//: Playground - noun: a place where people can play

import UIKit

/**
 本页内容包括:
 简单值(Simple Value)
 控制流(control Flow)
 函数和闭包(Functions and Closures)
 对象和类(Objects and classes)
 枚举和结构体(Enumerations and Structures)
 协议和扩展(Protocols and Extensions)
 错误处理(Error Handling)
 泛型(Generics)
 */
print("Hello, world!")


/*
 简单值
 */
var myVariable = 42
myVariable = 50
let myConstant = 42

let implicitInteger = 70
let implcitDouble = 70.0
let explictiDoublt: Double = 70
// EXPERIMENT:  Create a constant with an explicit type of float and a value of 4
let explicitDouble: Double = 4



let label = "The width is "
let width = 94

let widthLabel = label + String(width)
// EXPERIMENT: Try removing the conversion to string from the last line. What error do you get?
// binary operator '+' cannot be applied to operands of type 'String' and 'Int'

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
// EXPERMENT: Use \() to include a float-point calculation in a string and to include someone's name in a greeting.
let revenue: Float = 160.0
let cost: Float = 70.0
let profit: String = "Today my lemonade stand made \(revenue-cost)"
let personName: String = "Josh"
let greetJosh = "Hi \(personName)"


var shoppingList = ["catfish", "water", "tulips","blue paint"]
shoppingList[1] = "bottle of water"
var occupations = [
    "Malcolm":"Captain",
    "Kaylee":"Mechanic",
]
occupations["Jayne"] = "Public Relations"

let emptyArray = [String]()
let emptyDictionary = [String: Float]()

shoppingList = []
occupations = [:]





/**
 控制流
 */
let individualScore = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScore {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)


var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalString {
    greeting = "Hello, \(name)"
}
// EXPERMENT: Change optional to nil. What greeting do you get? Add an else clause that sets a different greeting if optionalName is nil
optionalName = nil
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello stranger"
}


let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

let vegetable = "red repper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber","watercress":
    print("That would make a good tea sandwich")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
// EXPERIMENT: Try removing the default case. What error do you get?
//  switch must be exhaustive, consider adding a default clause

let interestingNumbers = [
    "prime":[2, 3, 5, 7, 11, 13],
    "Fibonacci":[1, 1, 2, 3, 5, 8],
    "Square":[1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)
// EXPERIMENT: Add another variable to keep track o which kind of number was the largest, as well as what that largest number was.
let interestingNumber1 = [
    "prime":[2, 3, 5, 7, 11, 13],
    "Fibonacci":[1, 1, 2, 3, 5, 8],
    "Square":[1, 4, 9, 16, 25],
]
var largest1 = 0
var largestKind: String = ""
for (kind, numbers) in interestingNumber1 {
    for number in numbers {
        if number > largest1 {
            largest1 = number
            largestKind = kind
        }
    }
}
print(largest1)
print(largestKind)


var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
}while m < 100
print(m)

var total = 0
for i in 0..<4 {
    total += i
}
print(total)




/**
 Functions and Closures
 */
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")
// EXPERIMENT: Remove the day parameter. Add a parameter to include today's lunch special in the greeting.
func greet(name: String, tadaysLunch: String) -> String {
    return "Hello \(name), today's lunch is \(tadaysLunch)"
}
greet(name: "Bob", tadaysLunch: "Turkey Sandwich")


func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")


func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.min)


func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42, 597, 12)
// EXPERIMENT: Write a function that calculates the average of its arguments
func average(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum/numbers.count
}
average(numbers: 2, 10)


func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()


func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)


func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)


numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
// EXPERIMENT: Rewrite the closure to return zero for all odd numbers.
var number1 = [20 , 19, 7, 12]
number1.map({
    (number : Int) -> Int in
    if number % 2 == 0 {
        return number
    } else {
        return 0
    }
})

let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

let sortedNumbers = numbers.sorted{ $0 > $1 }
print(sortedNumbers)





/**
 Objects and Classes
 */
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
// EXPERIMENT: Add a constant property with let, and add another method that takes an argument.
class Shape1 {
    var numberOfSides = 0
    let dimension = "2d"
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    func notSoSimpleDescription() -> String {
        return "That is a \(dimension) shape."
    }
}
let myShape1 = Shape1()
myShape1.notSoSimpleDescription()

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()


class NameShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NameShape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

// EXPERIMENT: Make another subclass of NameShape called Circle that takes a radius and a name as arguments to its initializer.
class NameShape1 {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
class Circle: NameShape1 {
    var radius: Double
    init(name: String, radius: Double) {
        self.radius = radius
        super.init(name: name)
        self.name = name
    }
    override func simpleDescription() -> String {
        return "A circle with a radius of \(radius)"
    }
    func area() -> Double {
        return 3.14159265 * radius * radius
    }
    
    
}
let myCircle = Circle(name: "Example circle", radius: 6.0)

myCircle.name
myCircle.area()
myCircle.simpleDescription()

class EquilateralTriangle: NameShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimter)
triangle.perimter = 9.9
print(triangle.sideLength)


class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "large square")
print(triangleAndSquare.triangle.sideLength)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength





/**
 Enumerations and Structrures
 */
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
// EXPERIMENT: Write a function that compares two Rank values by comparing their raw values.
enum Rank2: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ac = Rank2.Ace
let two = Rank2.Two
let aceRawValu = ace.rawValue


func compare(rank11: Rank2, rank12: Rank2) -> String {
    var higher: Rank2 = rank11
    if rank12.rawValue > rank11.rawValue {
        var higher = rank12
        
    }
    return "The higher of the two is \(higher.simpleDescription())"
}
compare(rank11: ac, rank12: two)

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
    
}

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
            
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
// EXPERIMENT: Add a color() method to Suit that returns "black" for spades and clubs, and returns "red" for hearts and diamonds.
enum Suit1: Int {
    case Spades = 1
    case Hearts, Diamonds, Clubs
    
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
            
        }
    }
    
    func color() -> String {
        switch self {
        case .Spades, .Clubs:
            return "black"
        case .Hearts, .Diamonds:
            return "red"
            
        }
    }
}

let heartsDescription1 = Suit1.Hearts.simpleDescription()
let heartsColor = Suit1.Hearts.color()



enum ServerResponse {
    case result(String, String)
    case failure(String)
}
let success = ServerResponse.result(" 6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure... \(message)")
}
// EXPERRMENT: Add a third case to ServerResponse and to the switch.
enum ServerResponse1 {
    case Result(String, String)
    case Error(String)
    case ThirdCase(String)
}

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
// EXPERIMENT: Add a method to Card that creates a full deck of cards,with one card of each combination of rank and suit
//class Card12 {
//    var rank: Rank
//    var suit: Suit
//
//    init(cardRank: Rank, cardSuit: Suit) {
//        self.rank = cardRank
//        self.suit = cardSuit
//    }
//
//    func simpleDescription() -> String {
//        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
//    }
//
//    func Deck() -> String {
//        var stringTogether = ""
//        for i in 0..<14 {
//            if let convertedRank = Rank.init(rawValue: i) {
//                self.rank = convertedRank
//
//                for y in 0..<14 {
//                    if let convertedSuit = Suit.init(rawValue: y) {
//                        self.suit = convertedSuit
//                        stringTogether = "\(stringTogether) \(self.simpleDescription())"
//                    }
//                }
//            }
//        }
//        return stringTogether
//    }
//}

/**
 Protocols and Extensions
 */
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription


struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription


// EXPERIMENT: Write an enumeration that conforms to this protocol.
protocol ExampleProtocol22 {
    var simpleDescription: String { get }
    mutating func adjust()
}
class SimpleClass22: ExampleProtocol22 {
    var simpleDescription: String = "A VERY simple class."
    var anotherProperty: Int = 69105
    
    func adjust()  {
        simpleDescription += "Now 100% adjusted."
    }
}
class ConformingClass: ExampleProtocol22 {
    var simpleDescription: String = "A very simple class."
    var carModel: String = "The toyota corolla"
    
    func adjust() {
        carModel += " is the best car ever"
    }
}
let conformingClass = ConformingClass()
conformingClass.adjust()

let whichCarIsBest = conformingClass.carModel




extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)
// EXPERIMENT: Write an extension for the Double type that adds an absoluteValue property.
extension Double {
    var absoluteValue: Double {
        return abs(self)
    }
}
let exampleDouble: Double = -40.0
let exampleAbsoluteValue = exampleDouble.absoluteValue

let protocolValue: ExampleProtocol = a
protocolValue.simpleDescription

/**
 Error Handing
 */
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}
// EXPERIMENT: Change the printer name to "Never Has Toner", so that the send(job: toPrinter:)function throws an error.

do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError)")
} catch {
    print(error)
}
// EXPERMENT: Add code to throw an error inside the do block. What kind of error do you need to throw so that the error is handled by the first catch block? What about the second and third blocks?

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)



/**
 Generics
 */
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)


enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: Optional<Int> = .none
possibleInteger = .some(100)

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])
// EXPERIMENT: Modify the anyCommonElements(_:_:)function to make a function that returns an array of the elements that any two sequences have in common
// 练习: 修改 anyCommonElements 函数来创建一个函数, 返回一个数组, 内容是两个序列的共有元素.
//func anyCommonElements1<T: Sequence, U:Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element
//{
//    for lhsItem in lhs {
//        for rhsItem in rhs {
//            if lhsItem == rhsItem {
//                return true
//            }
//        }
//    }
//    return false
//}
//anyCommonElements1([1, 2, 3], [3])
//
//
//func whichCommonElements <T, U where T: Sequence, U: Sequence, T.GeneratorType.Element:Equatable, T.GeneratorType.Element == U.GeneratorType.Element>(lhs: T, rhs: U) -> Array<T.GeneratorType.Element>
//{
//    var toReturn = Array<T.GeneratorType.Element>()
//
//    for lhsItem in lhs {
//        for rhsItem in rhs {
//            if lhsItem == rhsItem {
//                toReturn.append(lhsItem)
//            }
//        }
//    }
//    return toReturn
//}
//whichCommonElements(lhs: [1, 2, 3], rhs: [3, 2])

// Write<T: Equatable> is the same as writing<T>...where T:Equatable>.


