//
//  PerfectSize.swift
//  PerfectSize
//
//  Created by Silvan Mosberger on 25/07/16.
//  
//

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