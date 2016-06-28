//: Playground - noun: a place where people can play

import UIKit

//konstante i varijable
let pi: Double = 3.14
var numberOfSamples = 7
//type inference
let piInfered = 3.14
//print
var hello = "Hello world"
print (hello)
//moj primjer
let myName: String = "Ena"
let action = "learning Swift"
print("My name is \(myName) and I am \(action).")
/*Ovo
 je
 multi
 line
 komentar*/
//opcionali
var name: String!
var comment: String?
name = "Travnik"
comment = "cool town"
//opcionalno vezivanje
if let comment = comment{
    print (comment)
}
//moj primjer
var grad: String!
var wish: String?
grad = "Frankfurt"
wish = "want to visit"
if let wish = wish{
    print("I \(wish) to visit \(grad) again")
}
let b = 10
var a = 5
a = b
print (a)
//moj primjer
let c = 15
var d = 5
d = c - d
print (d)
//aritmetika
1 + 3
5 - 3
2 * 3
10.0 / 2.5
print ("Hello" + " world")
//ostatak pri dijeljenju
9 % 4
-7 % 5
9 % 2.5
// unarni minus i plus
let three = 3
let minusThree = -three
let alsoMinusThree = +minusThree
//moj primjer
let five = 5
var newValue = five * 2 / 5
print (newValue)
print(newValue % 2 * 1)
var newNewValue = -five
print(-newNewValue)
//kompozitni operatori dodjele
var g = 1
g += 2
g /= 3
g *= 7
g -= 2
//moj primjer
var jedan = 1
jedan += 5
print (jedan)
//ternarni operatori
let negativeNumber = -6
print(negativeNumber < 0 ? "Negative" : "Positive")
//moj primjer
let number = 5
print(number <= 5 ? "Failed" : "Passed")
//operator ??
var newTown: String?
print(newTown ?? "Banja Luka")
//moj primjer
print(grad ?? "Travnik")
var noviGrad: String?
print(noviGrad ?? "Travnik")
//intervali
for i in 1...3 {
    print("\(i) times 3 equals \(i * 3)")
}
//moj primjer
for i in 1..<5 {
    print("\(i) times 2 equals \(i * 2)")
}
//logicki operatori
var lightsOn = true
if lightsOn == true {
    lightsOn = false
}
let isTired = true
if lightsOn == false && isTired == true {
    print("Go to sleep")
}
let time = 3.15
if (isTired == true && lightsOn == false) || time > 3.0 {
    print("Go to sleep")
}
//moj primjer
var monthDecember = false
var date = "seventeenth"
if monthDecember == false{
    monthDecember = true
}
if monthDecember == true && date == "seventeenth"{
    print("It is my birthday today!")
}
//promjenjljivost (let/var)
var helloWorld = "Hello"
helloWorld += " world"
print (helloWorld)
//moj primjer
var broj = 15
broj += 5
broj -= 10
print (broj)
//karakteri
for character in "BiH".characters{
    print(character)
}
//moj primjer
for character in "Ena".characters{
    print(character)
}
//instanciranje stringa preko niza karaktera
let characters: [Character] = ["l", "o", "v", "e"]
let loveString = String(characters)
print (loveString)
//moj primjer
let charactersOne: [Character] = ["E", "n", "a"]
let nameString = String(charactersOne)
print (nameString)
//spajanje stringova i karaktera
var newHelloWorld = "Hello" + " " + "world"
newHelloWorld += "!"
let exclamation: Character = "!"
newHelloWorld.append(exclamation)
print (newHelloWorld)
//moj primjer
var ime = "Zovem se" + " " + "Ena"
let tacka: Character = "."
ime.append(tacka)
print (ime)
//interpolacija stringova
let six = 6
let fiveAgain = 5
let result = ("\(six) times \(fiveAgain) is equal \(six * fiveAgain)")
print (result)
//moj primjer
let fiveSqrd = ("Five squared is equal to \(fiveAgain * fiveAgain)")
print (fiveSqrd)
//sprecijalni karakteri u stringovima
let quote = "\"Be yourself; everyone else is already taken.\"\n - Oscar Wilde "
print(quote)
//moj primjer
let secondQuote = "\"Covjek samo srcem dobro vidi.\n Bitno je ocima nevidljivo.\" \n Mali Princ"
print (secondQuote)
//poredjenje
let chick = "Chick"
let anotherChick = "Chick"
if chick == anotherChick {
    print("This is the same chick")
}
//moj primjer
let myName = "Ena"
let myBestFriendsName = "Mia"
if myName == myBestFriendsName {
    print ("Me and my best friend have a same name.")
}
if myName != myBestFriendsName{
    print("My name is Ena and my best friend's name is Mia.")
}
//promjenjljivost
var array = [1, 2]
array.append(3)
/*let constArray = [3, 5]
 constArray.append(6) */
//nizovi
var strings = [String]()
var shoppingList = ["Eggs", "Milk"]
let additionalList = ["Cookies", "Bananas"]
let newList = shoppingList + additionalList
print(newList)
//moj primjer
let toDoList = ["Wash laundry", "Clean the room"]
let doAndShopList = newList + toDoList
print(doAndShopList)
//pristupanje i modifikovanje
var newArray = [3]
newArray.isEmpty
newArray.append(5)
newArray.count
print(newArray[0])
let subArray = newArray[0...1]
newArray.insert(6, atIndex: 1)
newArray.removeAtIndex(0)
//moj primjer
doAndShopList.append("Cook dinner")
doAndShopList.count
print (doAndShopList)
print(doAndShopList[4])
doAndShopList.insert("Do homework", atIndex: 0)
print (doAndShopList)
doAndShopList.removeAtIndex(0)
//iteriranje kroz niz
for item in shoppingList {
    print(item)
}
//moj primjer
for thing in doAndShopList{
    print(thing)
}
//skupovi
var letters = Set<Character>()
var favouriteGenres: Set<String> = ["Rock", "Classical", "Hip Hop"]
favouriteGenres.isEmpty
favouriteGenres.count
favouriteGenres.insert("Metal")
favouriteGenres.remove("Classical")
favouriteGenres.removeAll()
favouriteGenres.contains("Rock")
//moj primjer
var clothesToBuy: Set<String> = ["white t-shirt", "black pants", "jeans", "black dress"]
clothesToBuy.insert("long skirt")
print (clothesToBuy)
clothesToBuy.remove("white t-shirt")
print(clothesToBuy)
//iteracija kroz skup
for genre in favouriteGenres {
    print(genre)
}
//moj primjer
for item in clothesToBuy {
    print(item)
}
//operacije nad skupovima
let setA: Set<Int> = [1, 2, 3]
let setB: Set<Int> = [2, 3, 5]
setA.intersect(setB)
setA.union(setB)
setA.exclusiveOr(setB)
setA.subtract(setB)
//moj primjer
var clothesIHave: Set<String> = ["jeans", "black dress", "turtleneck"]
print(clothesToBuy.intersect(clothesIHave))
print(clothesToBuy.union(clothesIHave))
print(clothesToBuy.exclusiveOr(clothesIHave))
print(clothesToBuy.subtract(clothesIHave))
//rjecnici
let numberOfIntegers = [Int: String]()
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
airports.isEmpty
airports.count
airports["YYZ"] = "BiH"
airports["YYZ"] = nil
for (code, name) in airports {
    print("\(code) : \(name)")
}
//moj primjer
var playlist: [String: String] = ["Bolero": "Sjecanja", "Tutti Frutti": "Stvari lagane", "Opca opasnost": "Tvoje ime cuvam"]
print(playlist.count)
playlist["Tutti Frutti"] = "Krila leptira"
for(code, name) in playlist{
    print("\(code) : \(name)")
}
