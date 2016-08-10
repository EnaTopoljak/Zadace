import Foundation

func delayedPrint(string: String) {
    sleep(2)
    print (string)
}
enum DrivingLicenceType {
    case A
    case B
    case C
    case D
}

protocol DrivingLicence {
    var set: Set<DrivingLicenceType> {get set}
}
protocol CarMonitoringDelegate {
    func engineBroke ()
    func lowOnFuel ()
    func outOfFuel ()
}
class Person {
    var firstName: String
    var lastName: String
    var age: Int
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}
class Mechanic: Person {
    var authorizedServicerForLicenceTypes: Set<DrivingLicenceType>
    init(authorizedServicerForLicenceTypes: Set<DrivingLicenceType>, firstName: String, lastName: String, age: Int) {
        self.authorizedServicerForLicenceTypes = authorizedServicerForLicenceTypes
        super.init(firstName: firstName, lastName: lastName, age: age)
    }
        func fixCar(car: Car) {
            delayedPrint("\(firstName) is fixing car")
            car.broken = false
            delayedPrint("Car fixed")
        }
    }

class Driver: Person, DrivingLicence {
    var car: Car?
    var set: Set<DrivingLicenceType>
    var mechanic: Mechanic?
    init(set: Set<DrivingLicenceType>, firstName: String, lastName: String, age: Int) {
        self.set = set
        super.init(firstName: firstName, lastName: lastName, age: age)
    }
    func callMechanic (mechanic: Mechanic, toFixACar car: Car) {
        if (mechanic.authorizedServicerForLicenceTypes.contains(car.licenceType)) {
            delayedPrint("Mechanic responded he can fix this car")
            mechanic.fixCar(car)
        } else {
            delayedPrint("Mechanic responded he can not fix this car")
        }
    }
    func driveCar() {
        car?.drive()
    }
}
protocol RandomNumberGenerator {
    func random() -> Double
}
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() < 0.01
    }
}
extension Driver: CarMonitoringDelegate {
    func engineBroke() {
        delayedPrint("Calling mechanic")
        callMechanic(mechanic!, toFixACar: car!)
    }
    func lowOnFuel() {
        let addFuel = Int(arc4random() % 100)
        if(addFuel > 33) {
        delayedPrint("I will add some gas now")
        guard addFuel <= car!.fuelTank else {
            let newAddFuel = car!.fuelTank - car!.fuelLevel
            car?.fuelLevel = newAddFuel
            delayedPrint("Added fuel. Current fuel level \(car!.fuelLevel)")
            delayedPrint("Car crossed \(car?.crossedKilometers) km in this run")
            return
            }
            car?.fuelLevel += addFuel
            delayedPrint("Added fuel. Current fuel level \(car!.fuelLevel)")
            delayedPrint("Car crossed \(car?.crossedKilometers) km in this run")
        } else {
            delayedPrint("I will add some gas later")
            delayedPrint("Car crossed \(car?.crossedKilometers) km in this run")
            
        }
    }
    func outOfFuel() {
        delayedPrint("I will add some gas now")
        let addFuel = Int(arc4random() % 100)
        car?.fuelLevel += addFuel
        delayedPrint("Added fuel. Current fuel level \(car!.fuelLevel)")
        delayedPrint("Car crossed \(car?.crossedKilometers) km in this run")
}
}



class Car: RandomNumberGenerator{
    var name: String
    var model: String
    var licenceType: DrivingLicenceType
    var fuelTank: Int
    var crossedKilometers = 0
    private var fuel = 0
    var broken = false
    var engineOn = false
    var driver: DrivingLicence?
    var delegate: CarMonitoringDelegate?
    var fuelLevel: Int {
        get {
            return fuel
        }
        set (newFuelLevel) {
            if (newFuelLevel > fuelTank) {
                fuel = fuelTank
            } else {
                fuel = newFuelLevel
            }
        }
    }
    init(name: String, model: String, licenceType: DrivingLicenceType, fuelTank: Int, fuelLevel: Int) {
        self.name = name
        self.model = model
        self.licenceType = licenceType
        self.fuelTank = fuelTank
        self.fuelLevel = fuelLevel
    }
    func stop() {
        engineOn = false
    }
    func random () -> Double {
        return Double (arc4random() % 100)
    }
    func drive () {
        print ("Starting the engine")
        engineOn = true
        while (engineOn == true) {
            if (broken == true) {
                delayedPrint("Engine broke")
                delegate?.engineBroke()
                stop()
            }
            if (fuelLevel == 10) {
                delayedPrint("Fuel low")
                delegate?.lowOnFuel()
            }
            guard (fuelLevel > 0) else {
                delayedPrint("Empty fuel tank")
                delegate?.outOfFuel()
                stop()
                break
            }
            fuelLevel -= 1
            crossedKilometers += 10
            broken = randomBool()
      
        }
    }
}

let driver = Driver(set: [DrivingLicenceType.B], firstName:"Ena", lastName:"Topoljak",age: 23)
let car = Car(name: "Audi", model: "A6", licenceType: DrivingLicenceType.B, fuelTank: 60, fuelLevel:40)
let mechanic = Mechanic(authorizedServicerForLicenceTypes:[DrivingLicenceType.B,DrivingLicenceType.C, DrivingLicenceType.D], firstName: "Merima", lastName: "Delic", age: 27)
driver.car = car
car.delegate = driver
driver.mechanic = mechanic
for value in 1...10 {
    driver.driveCar()
    
}
delayedPrint("Car crossed \(car.crossedKilometers) km in this run")

