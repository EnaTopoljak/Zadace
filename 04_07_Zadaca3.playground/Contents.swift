
//Kontrola toka
//Petlje
//For in
for number in 1...3 {
    print("\(number) times 5 is \(number*5)")
}
//moj primjer

for everyNumber in 1...3 {
    print("\(everyNumber) minus 1 is \(everyNumber - 1)")
}

//underscore
for _ in 1...3 {
    print("Hello World")
}


//moj primjer
for _ in 1...3{
    print ("We are learning Swift")
}

//Iteriranje kroz kolekcije
let names = ["Alex", "Tracy", "Jack"]
for name in names {
    print("Hello, \(name)")
}
//moj primjer
var imena = ["Ena", "Merima"]
for ime in imena {
    print("\(ime) uci Swift.")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animal, legCount) in numberOfLegs {
    print("\(animal) has \(legCount) legs")
}

//moj primjer
let familyAge = ["My Father": 50, "My Mother": 50, "My Aunt": 52]
for (member, age) in familyAge {
    print("\(member) is \(age) years old.")
}