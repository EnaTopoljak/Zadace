import UIKit

struct Location {
    
    var latitude: Double
    var longitude: Double
    
    init() {
        latitude = Double(arc4random()%181)-90.0
        longitude = Double(arc4random()%361)-90.0
    }
}

struct Contact {
    var name: String
    var phoneNumber: String
}

class Message {
    enum Status {
        case Recieved
        case Read
    }
    let sender: Contact
    let text: String
    var status: Status = Status.Recieved
    
    init (sender: Contact, text: String){
        self.sender = sender
        self.text = text
    }
    func changeStatusToRead () {
        status = Status.Read
    }
}

protocol MessageHandlerDelegate: class {
    func didRecieveMessage (message: Message)
}

class Telephone {
    private var messages: [Message] = [Message]()
    var model: String
    weak var delegate: MessageHandlerDelegate?
    init (model: String) {
        self.model = model
    }
    func addNewMessage (message: Message) {
        messages = [Message](arrayLiteral: message)
        delegate?.didRecieveMessage(message)
    }
}

class Person: MessageHandlerDelegate {
    weak var father: Parent?
    weak var mother: Parent?
    var name: String
    var lastName: String
    var yearOfBirth: Int
    var location = Location()
    private var telephone: Telephone?
    var age: Int {
        get {
            return 2016 - yearOfBirth
        }
        set {
            yearOfBirth = 2016 - age
        }
    }
    init (name: String, lastName: String, yearOfBirth: Int, location: Location) {
        self.name = name
        self.lastName = lastName
        self.yearOfBirth = yearOfBirth
        self.location = location
        
    }
    convenience init (yearOfBirth: Int, location: Location) {
        self.init(yearOfBirth: 1990, location: Location())
    }
    
    func introduction() -> String {
        return "Hi, my name is \(name) \(lastName). Age \(age)."
    }
    func addTelephone (telephone: Telephone) {
        self.telephone = telephone
        telephone.delegate = self
    }
    func removeTelephone () {
        telephone = nil
        telephone?.delegate = nil
    }
    func didRecieveMessage(message: Message) {
        message.changeStatusToRead()
        print ("Hey I've got message from \(message.sender.name): \(message.text)")
    }
}

class Parent: Person {
    var children : [Person]
    var savings: Double?
    init (name: String, lastName: String, yearOfBirth: Int, location: Location, children: [Person], savings: Double?) {
        self.children = children
        self.savings = savings
        super.init(name: name, lastName: lastName, yearOfBirth: yearOfBirth, location: location)
    }
    convenience init (children: [Person]) {
        self.init(children: [])
    }
    override func introduction() -> String {
        if children.isEmpty {
            return super.introduction()
        } else {
            return super.introduction() + "I'm a parent of \(children.count)"}
    }
    
}

let mirko = Person(name: "Mirko", lastName: "Babic", yearOfBirth: 1987, location: Location())
let nedim = Person(name: "Nedim", lastName: "Sabic", yearOfBirth: 1982, location: Location())

print(mirko.introduction())
print(nedim.introduction())

struct Course {
    var teacher: Person
    var courseName: String
    
    func aboutCourse() -> String {
        return "\(courseName) course by professor \(teacher.lastName)."
    }
}

class Student: Person {
    var attendingCourses: [Course]
    var grades: [Int]
    var faculty = "WiP"
    var averageGrade: Double {
        get {
            var sum: Int = 0
            for grade in grades {
                sum += grade
            }
            return Double(sum)/Double(grades.count)
        }
    }
    
    init(name: String, lastName: String, yearOfBirth: Int, location: Location, attendingCourses: [Course], grades: [Int]){
        self.attendingCourses = attendingCourses
        self.grades = grades
        super.init(name: name, lastName: lastName, yearOfBirth: yearOfBirth, location: location)
    }
    
    override func introduction () -> String {
        let introduceMyself = super.introduction() + "I' m a student at \(faculty). My favourite course is " + attendingCourses.first!.aboutCourse()
        guard (father?.savings == nil && mother?.savings == nil) else {
            if let value = father?.savings {
                return introduceMyself + "My father has \(value) savings."
            } else
                if let value2 = mother?.savings {
                    return introduceMyself + "My mother has \(value2) savings."
                } else {
                    return introduceMyself + "My parents have $ \(father!.savings! + mother!.savings!) savings. "
            }
        }
        return introduceMyself + "We are broke."
        
    }
}

let iOSDevelopment = Course(teacher: mirko, courseName: "iOS Development")
let seo = Course(teacher: nedim, courseName: "SEO")

let student = Student(name: "Ena", lastName: "Topoljak", yearOfBirth: 1992, location: Location(), attendingCourses: [iOSDevelopment, seo], grades: [7,8,7])

print(student.averageGrade)

extension Int {
    mutating func ageInDays() -> Int {
        return self * 365
    }
}

let myImaginarySister = Person (name: "Mia", lastName: "Batic", yearOfBirth: 1993, location: Location())
let father = Parent(name: "Enes", lastName: "Topoljak", yearOfBirth: 1966, location: Location(), children: [student, myImaginarySister], savings: nil)
let mother = Parent(name: "Vlatka", lastName: "Topoljak", yearOfBirth: 1965, location: Location(), children: [], savings: nil)

print(father.introduction())
print(mother.introduction())

print("Student's age in days is " + "\(student.age.ageInDays())")
mother.savings = 300
student.father = father
student.mother = mother
print(student.introduction())

let telephone = Telephone(model: "iPhone")

let kontakt1 = Contact(name: "Ena", phoneNumber: "061427173")
let kontakt2 = Contact(name: "Merima", phoneNumber: "061234567")
let kontakt3 = Contact(name: "Enes", phoneNumber: "062345678")

let message1 = Message(sender: kontakt1, text: "Hey, do you want to hang out?")
let message2 = Message(sender: kontakt2, text: "I can't answer my phone at the moment.")
let message3 = Message(sender: kontakt3, text: "I'm in a meeting, I will call you later.")

student.addTelephone(telephone)
telephone.addNewMessage (message1)
telephone.addNewMessage (message2)
student.removeTelephone()
telephone.addNewMessage(message3)
mirko.addTelephone(telephone)
