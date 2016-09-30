//
//  main.swift
//  TestGenerator
//
//  Created by Silvan Mosberger on 25/07/16.
//
//

import Darwin

print("DOES NOT WORK CURRENTLY")

enum Base : Int {
	case binary = 2
	case decimal = 10
	
	static let all = [binary, decimal]
	
	var prefix : String {
		switch self {
		case .binary: return "0b"
		case .decimal: return ""
		}
	}
	
	var baseType : String {
		switch self {
		case .binary: return "B"
		case .decimal: return "D"
		}
	}
	
	var subTypes : [String] {
		switch self {
		case .binary: return ["O", "I"]
		case .decimal: return (0..<10).map{ "n\($0)" }
		}
	}
}

typealias Number = (n: Int, base: Base)

func typePathForNumber(_ n: Number) -> String {
	let (n, base) = n
	assert(n >= 0)
	var v = n
	var typePath = ""
	while v > 0 {
		typePath = ".\(base.subTypes[v % base.rawValue])" + typePath
		v /= base.rawValue
	}
	return "\(base.baseType)\(typePath)"
}

func literalForNumber(_ n: Number) -> String {
	return "\(n.base.prefix)\(String(n.n, radix: n.base.rawValue))"
}

func testEqual(_ a: String, _ b: String) {
	print("XCTAssertEqual(\(a), \(b))")
}

func testSize(_ n: Number) {
	testEqual("sizeof(\(typePathForNumber(n)).self)", "\(literalForNumber(n))")
}

extension Int {
	static func random(min: Int = 0, max: Int) -> Int {
		return min + Int(arc4random_uniform(UInt32(max - min + 1)))
	}
	
	static func random(maxDigits: Int) -> Int {
		return random(digits: random(max: maxDigits))
	}
	
	static func random(digits: Int) -> Int {
		return Int(Double(arc4random()) / Double(UInt32.max) * pow(10, Double(digits)))
	}
}

for base in Base.all {
	for n in 0..<10 {
		testSize((n, base))
	}
	
	for i in 2..<14 {
		let number = (Int.random(digits: i), base)
		testSize(number)
	}
}

func testSum(_ numbers: [Number]) {
	let lhs = "sizeof((\(numbers.map(typePathForNumber).map{ "\($0).self" }.joined(separator: " + "))).self)"
	let rhs = numbers.map(literalForNumber).joined(separator: " + ")
	testEqual(lhs, rhs)
}

for _ in 0..<10 {
	let terms = 0..<Int.random(min: 2, max: 4)
	let values = terms.map{ _ in Int.random(maxDigits: 5) }
	let bases = terms.map{ _ in Base.all[Int(arc4random_uniform(UInt32(Base.all.count)))] }
	
	let numbers : [Number] = Array(zip(values, bases))
	
	testSum(numbers)
}
