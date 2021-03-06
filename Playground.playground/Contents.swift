import PerfectSize

//:# PerfectSize
//: Ever wanted to have a type with a certain size? Me neither! But now you can!
//:
//:## Usage
//: Say you want a type that has a size of 9001 bytes, which is clearly over 9000, so it'd take a long time to figure out how to get *exactly* 9001. With this framework it's as simple as:

typealias NineThousand = D.n9.n0.n0.n0
typealias OVER9000 = NineThousand.Add1

//:This type has now really a size of over 9000:

MemoryLayout<OVER9000>.size

//:You can also use binary, which doesn't need the ugly characters inbetween the numbers:

typealias MeaningOfLife = B.I.O.I.O.I.O

//:There is a single initializer for every such type which takes a byte value (`UInt8`) with a default value of `0`:

let a = D.n9.n9() // All zeroes
let life = MeaningOfLife(byte: 0b00101010)  // Every byte is set to the answer

//: If you need to add the size of multiple structs together, you can use the `+` operator. You can only use this to immediately create a type. You *cannot* declare a `typealias` that contains the `+` operator.

let molPlusFive = (MeaningOfLife.self + B.I.O.I.self).init() // 42 + 5

//: There is also a `+` operator defined to concatenate instantiated structs to produce an instance of a struct of the combined size

let combined = B.I.I.I() + life // 7 + 42
let c = combined + B.I() // 49 + 1

//:## What can I use this for?
//:Potential usages include:
//: - Test your memory handling library with big types.
//: - Use `unsafeBitCast` to convert this type to some other type.
