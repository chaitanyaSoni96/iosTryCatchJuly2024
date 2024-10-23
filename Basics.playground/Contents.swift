import Foundation

//String
let str = "Hello world!"
var _str = "Hello world!"
_str = "Hey"
print(str, _str)

//Integers
let myInt = 0
var _myInt = 2
_myInt += 1
print(myInt, _myInt)


print(_myInt/2)

//Decimals
let myDouble = Double(_myInt)
print(myDouble/2)

let myIntStr = "12"
let myCastedInt = Int(myIntStr)

let myDecimalStr = "13.37"
let myCastedDouble = Double(myDecimalStr)

let myVar: String = "\(myCastedDouble)"

let double: Double = 1.0
let optionalDouble: Double? = nil

let sum: Double? = double + (optionalDouble ?? 601.423)


//Arrays

var arr: [Any] = []

if arr.indices.contains(0) {
    print("found something")
} else {
    print("boo")
}

arr.append(1)
arr.append(2)
arr.append(3)
arr.append(4)
arr.append("50") // string
arr.append("50.54") // string
print(arr)
let firstObject = Double( (arr[0] as? Int) ?? 0)
print(firstObject)
let fourthObject = (arr[4] as? Double) ?? 5 // string wont cast into a double
print(fourthObject)
let sum2 = firstObject + fourthObject

let arr2 = arr.dropLast()
print(arr)
print(arr2)

let moreThan3 = arr.compactMap({ value in
    let maybeInteger = value as? Int
    if let integer = maybeInteger {
        
        if integer >= 3 {
            print(integer)
            return integer
        } else {
            return nil
        }
        
    } else if let string = value as? String,
              let integer = Int(string) {
        
        if integer >= 3 {
            print(integer)
            return integer
        } else {
            return nil
        }
    }
    return nil
})
typealias CartItem = (String, Int, String)
var cartItems = [CartItem(UUID().uuidString, 1, "iphone"), CartItem(UUID().uuidString, 0, "android"), CartItem(UUID().uuidString, 1, "macbook")]

func update(productUUID: String, quantity: Int) {
    print(cartItems)
    print(cartItems.enumerated())
    
loop: for (index, element) in cartItems.enumerated() {
        print(index)
        if element.0 == productUUID {
            print(element)
            cartItems[index].1 = quantity
            break loop
        }
    }
}
update(productUUID: cartItems.first?.0 ?? "", quantity: 8)
print(cartItems.first)

//Dictionaries

var cartItemsDict: [String : CartItem] = [:]
cartItemsDict = Dictionary(uniqueKeysWithValues: cartItems.map({ ($0.0, $0) }))

func updateDict(productUUID: String, quantity: Int) {
    cartItemsDict[productUUID]?.1 = quantity
}

for (key, value) in cartItemsDict {
    print(key, value)
}
let minutes = 60
for tickMark in 0..<minutes {
    // render the tick mark each minute (60 times)
    print(tickMark)
}

var someBool = true
while someBool {
    if 1+1 == 2 {
        print("yay")
        someBool = false
    }
}


let someNumber = 49

switch someNumber {
    
case 1: print("do something")
    
case 50: print("found my number")
    
default: print("unhandled")
    
}


enum ScreenType {
    case list
    case selection
}

let type = ScreenType.list

switch type {
    
case .list: break
    
case .selection: break
    
}

someLoop: for item in cartItems {
    if item.1 == 0 {
        break someLoop
    }
    print(item.0)
}

func some() -> () {
    
}

func xyz() -> Void {
    
}

func abc() {
    
}



protocol Deletable {
    func delete()
}

protocol Polishable {
    func polish() -> GemStone?
}

class Object: Deletable {
    func delete() {
        
    }
    
    var width: Float
    var height: Float
    
    init(width: Float, height: Float) {
        self.width = width
        self.height = height
    }
}

class Stone: Object, Polishable {
    func polish() -> GemStone? {
        if Int.random(in: 1...10) % 2 == 0 {
            return GemStone(cutStyle: "", rarity: .common, color: self.color, width: self.width, height: self.height)
        } else {
            return nil
        }
    }
    
    var color: String
    
    init(color: String, width: Float, height: Float) {
        self.color = color
        super.init(width: width, height: height)
    }
}

class GemStone: Stone {
    
    enum Rarity {
        case common
        case precious
    }
    
    var cutStyle: String
    var rarity: GemStone.Rarity
    
    override func polish() -> GemStone? {
        GemStone(cutStyle: self.cutStyle, rarity: .precious, color: self.color, width: self.width, height: self.height)
    }
    
    init(cutStyle: String, rarity: GemStone.Rarity, color: String, width: Float, height: Float) {
        self.cutStyle = cutStyle
        self.rarity = rarity
        super.init(color: color, width: width, height: height)
    }
    
}
let gemstone = GemStone(cutStyle: "", rarity: .common, color: "", width: 1, height: 1)
let stone = Stone(color: "", width: 2, height: 2)

let someObject: Object = GemStone(cutStyle: "", rarity: .common, color: "", width: 10, height: 10)

func trashCan(object: Object) {
    
}

func locker(gemstone: GemStone) {
    
}
gemstone.delete()
trashCan(object: gemstone)


if let gem = stone.polish() {
    gem.polish()
    locker(gemstone: gem)
}

locker(gemstone: stone as! GemStone)
