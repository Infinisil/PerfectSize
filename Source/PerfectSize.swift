//
//  PerfectSize.swift
//  PerfectSize
//
//  Created by Silvan Mosberger on 25/07/16.
//  
//

import class Foundation.NSData

public protocol Size : CustomStringConvertible {
	static var size : Int { get }

	/// Initialize this struct with every byte set to the given one
	init(byte: UInt8)
}

extension Size {
	public var description: String {
		return "[size: \(Self.size)]"
	}
}

public protocol BinarySize : Size {}
public protocol DecimalSize : Size {}

extension Size {
	public var size : Int { return Self.size }
}

public struct B : BinarySize {
	public static let size : Int = 0
	
	/// Initialize this struct with every byte set to the given one
	public init(byte: UInt8 = 0) {}
}

public struct D : DecimalSize {
	public static let size : Int = 0
	
	/// Initialize this struct with every byte set to the given one
	public init(byte: UInt8 = 0) {}
}

public struct Times2<S : BinarySize> : BinarySize {
	public static var size : Int { return S.size * 2 }
	
	let a, b : S
	
	/// Initialize this struct with every byte set to the given one
	public init(byte: UInt8 = 0) {
		a = S(byte: byte)
		b = a
	}
}

public struct DecimalPlus1<S : DecimalSize> : DecimalSize {
	public static var size : Int { return S.size + 1 }
	
	let a : S
	let x : UInt8
	
	/// Initialize this struct with every byte set to the given one
	public init(byte: UInt8 = 0) {
		a = S(byte: byte)
		x = byte
	}
}

public struct BinaryPlus1<S : BinarySize> : BinarySize {
	public static var size : Int { return S.size + 1 }
	
	let a : S
	let x : UInt8
	
	/// Initialize this struct with every byte set to the given one
	public init(byte: UInt8 = 0) {
		a = S(byte: byte)
		x = byte
	}
}

public struct Times10<S : Size> : DecimalSize {
	public static var size : Int { return S.size * 10 }
	
	let a0, a1, a2, a3, a4, a5, a6, a7, a8, a9 : S
	
	public init(byte: UInt8 = 0) {
		a0 = S(byte: byte)
		a1 = a0
		a2 = a0
		a3 = a0
		a4 = a0
		a5 = a0
		a6 = a0
		a7 = a0
		a8 = a0
		a9 = a0
	}
}

public extension BinarySize {
	typealias O = Times2<Self>
	typealias I = BinaryPlus1<O>
}

public extension DecimalSize {
	typealias n0 = Times10<Self>
	typealias n1 = DecimalPlus1<n0>
	typealias n2 = DecimalPlus1<n1>
	typealias n3 = DecimalPlus1<n2>
	typealias n4 = DecimalPlus1<n3>
	typealias n5 = DecimalPlus1<n4>
	typealias n6 = DecimalPlus1<n5>
	typealias n7 = DecimalPlus1<n6>
	typealias n8 = DecimalPlus1<n7>
	typealias n9 = DecimalPlus1<n8>
}