import Foundation

// Attempt to use generic function to sort two similar, but different structs.

protocol ILikeTurtles {
    var name : String { get set }
    var date : Date { get set }
    var catchphrase : String { get set }
}

struct FourLegs : Identifiable, ILikeTurtles {
    var id = UUID()
    var name : String
    var date = Date()
    var catchphrase : String
    let pi : Float = 3.14
}

struct TwoLegs : Identifiable, ILikeTurtles {
    var id = UUID()
    var name : String
    var date = Date()
    var catchphrase: String
    let birdFood = false
}

var fourThings = [FourLegs(name: "Turtle", catchphrase: "I like them"), FourLegs(name: "Cow", catchphrase: "Moo"), FourLegs(name: "Zebra", catchphrase: "gum"), FourLegs(name: "Cow", catchphrase: "Another cow")]
var twoThings = [TwoLegs(name: "Stork", catchphrase: "baby"), TwoLegs(name: "Toucan", catchphrase: "sam"), TwoLegs(name: "Parrot", catchphrase: "king"), TwoLegs(name: "Toucan", catchphrase: "Fruit Loops")]

func printSomething<T : ILikeTurtles>(inputArray: [T]) {
    var x = 1
    print("-------")
    for oneThing in inputArray {
        print("\(x)) \(oneThing.name) \(oneThing.catchphrase) \(oneThing.date)")
        x+=1
    }
}

func sortSomething<T : ILikeTurtles>(inputArray: [T]) -> [T] {
    let sortedResults = inputArray.sorted { lhs, rhs in
        guard lhs.name == rhs.name else {
            return lhs.name < rhs.name
        }
        
       return lhs.catchphrase < rhs.catchphrase
    }
    
    return sortedResults
}

printSomething(inputArray: sortSomething(inputArray: fourThings))
printSomething(inputArray: sortSomething(inputArray: twoThings))

