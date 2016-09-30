//
//  PerfectSizeTests.swift
//  PerfectSizeTests
//
//  Created by Silvan Mosberger on 25/07/16.
//
//

import XCTest
@testable import PerfectSize

class PerfectSizeTests: XCTestCase {
	func testBinary() {
		XCTAssertEqual(MemoryLayout<B>.size, 0b0)
		XCTAssertEqual(MemoryLayout<B.I>.size, 0b1)
		XCTAssertEqual(MemoryLayout<B.I.O>.size, 0b10)
		XCTAssertEqual(MemoryLayout<B.I.I>.size, 0b11)
		XCTAssertEqual(MemoryLayout<B.I.O.O>.size, 0b100)
		XCTAssertEqual(MemoryLayout<B.I.O.I>.size, 0b101)
		XCTAssertEqual(MemoryLayout<B.I.I.O>.size, 0b110)
		XCTAssertEqual(MemoryLayout<B.I.I.I>.size, 0b111)
		XCTAssertEqual(MemoryLayout<B.I.O.O.O>.size, 0b1000)
		XCTAssertEqual(MemoryLayout<B.I.O.O.I>.size, 0b1001)
		XCTAssertEqual(MemoryLayout<B.I.O.O.I.I.O>.size, 0b100110)
		XCTAssertEqual(MemoryLayout<B.I.O.I.O.I.I.O.I.I>.size, 0b101011011)
		XCTAssertEqual(MemoryLayout<B.I.I.O.O.O.O.I.I>.size, 0b11000011)
		XCTAssertEqual(MemoryLayout<B.I.I.O.I.O.I.I.O.O.O.I.I.I.I.O.O>.size, 0b1101011000111100)
		XCTAssertEqual(MemoryLayout<B.I.I.I.I.I.I.O.I.O.O.O.O.O.I.I>.size, 0b111111010000011)
		XCTAssertEqual(MemoryLayout<B.I.I.I.I.O.I.O.O.I.I.I.I.O.O.I.O.O.O.O.I.I.I.I>.size, 0b11110100111100100001111)
		XCTAssertEqual(MemoryLayout<B.I.I.I.O.O.O.O.I.O.O.I.O.O.O.I.O.O.O.I.O.O.I.I.O.O.O>.size, 0b11100001001000100010011000)
		XCTAssertEqual(MemoryLayout<B.I.I.I.I.O.O.O.O.O.O.I.O.O.I.I.O.I.O.I.I.I.I.O.I.O.I.O.O.O>.size, 0b11110000001001101011110101000)
		XCTAssertEqual(MemoryLayout<B.I.O.O.O.O.I.I.I.O.O.I.I.I.O.O.I.O.O.O.O.O.I.I.O.I.I.I.I.O.I.O>.size, 0b1000011100111001000001101111010)
		XCTAssertEqual(MemoryLayout<B.I.O.O.I.I.O.I.O.O.O.I.I.O.O.O.I.O.I.I.I.O.I.I.O.O.I.I.O.O.I.O.O.O.O>.size, 0b1001101000110001011101100110010000)
		XCTAssertEqual(MemoryLayout<B.I.O.I.I.I.O.O.O.O.I.I.O.I.O.O.I.O.I.O.O.O.I.O.I.I.O.I.O.O.O.I.I.I.I.O.O.I.O.O>.size, 0b101110000110100101000101101000111100100)
		XCTAssertEqual(MemoryLayout<B.I.I.O.I.O.O.I.I.I.I.O.I.O.O.I.I.O.O.O.I.I.I.O.I.O.O.I.O.O.O.O.O.I.I.I.I.O.I.O.I.I.I.I>.size, 0b1101001111010011000111010010000011110101111)
	}
	
	func testDecimal() {
		XCTAssertEqual(MemoryLayout<D>.size, 0)
		XCTAssertEqual(MemoryLayout<D.n1>.size, 1)
		XCTAssertEqual(MemoryLayout<D.n2>.size, 2)
		XCTAssertEqual(MemoryLayout<D.n3>.size, 3)
		XCTAssertEqual(MemoryLayout<D.n4>.size, 4)
		XCTAssertEqual(MemoryLayout<D.n5>.size, 5)
		XCTAssertEqual(MemoryLayout<D.n6>.size, 6)
		XCTAssertEqual(MemoryLayout<D.n7>.size, 7)
		XCTAssertEqual(MemoryLayout<D.n8>.size, 8)
		XCTAssertEqual(MemoryLayout<D.n9>.size, 9)
		XCTAssertEqual(MemoryLayout<D.n3.n1>.size, 31)
		XCTAssertEqual(MemoryLayout<D.n3.n0.n6>.size, 306)
		XCTAssertEqual(MemoryLayout<D.n4.n5.n1.n4>.size, 4514)
		XCTAssertEqual(MemoryLayout<D.n6.n2.n7.n2.n3>.size, 62723)
		XCTAssertEqual(MemoryLayout<D.n5.n4.n5.n6.n6.n1>.size, 545661)
		XCTAssertEqual(MemoryLayout<D.n8.n8.n7.n2.n6.n9.n9>.size, 8872699)
		XCTAssertEqual(MemoryLayout<D.n6.n4.n5.n3.n9.n4.n7.n5>.size, 64539475)
		XCTAssertEqual(MemoryLayout<D.n1.n8.n6.n9.n0.n7.n2.n9.n5>.size, 186907295)
		XCTAssertEqual(MemoryLayout<D.n2.n6.n2.n8.n2.n9.n7.n8.n9.n7>.size, 2628297897)
		XCTAssertEqual(MemoryLayout<D.n1.n0.n6.n9.n8.n2.n7.n2.n1.n9.n7>.size, 10698272197)
		XCTAssertEqual(MemoryLayout<D.n2.n9.n8.n6.n8.n7.n1.n7.n9.n8.n7.n5>.size, 298687179875)
		XCTAssertEqual(MemoryLayout<D.n8.n4.n6.n1.n7.n1.n1.n9.n4.n1.n8.n6.n0>.size, 8461711941860)
	}

//	func testAdd() {
//		XCTAssertEqual(MemoryLayout<(B.I.O.O.O.I.I.O.I.I.self + B.I.O.O.I.O.O.I.self + B.I.O.I.O.I.O.I.I.I.I.I.O.I.O.I.O.I.self)>.size, 0b100011011 + 0b1001001 + 0b10101011111010101)
//		XCTAssertEqual(MemoryLayout<(B.I.O.O.self + B.I.O.O.O.I.O.self + D.n9.n5.self)>.size, 0b100 + 0b100010 + 95)
//		XCTAssertEqual(MemoryLayout<(B.self + B.I.I.O.I.O.O.I.I.I.O.I.O.I.I.O.O.self)>.size, 0b0 + 0b1101001110101100)
//		XCTAssertEqual(MemoryLayout<(B.I.I.O.O.O.I.I.self + D.n8.n5.n9.self + D.n8.n8.self + B.I.I.I.O.O.I.O.O.I.self)>.size, 0b1100011 + 859 + 88 + 0b111001001)
//		XCTAssertEqual(MemoryLayout<(D.n2.n4.self + D.n6.n3.self + D.n7.n0.n9.n6.n4.self + B.self)>.size, 24 + 63 + 70964 + 0b0)
//		XCTAssertEqual(MemoryLayout<(B.I.O.O.O.O.O.O.I.O.O.O.O.I.O.O.I.self + D.n3.n4.n5.self + D.self + B.I.I.I.I.I.I.O.I.O.O.O.I.I.O.self)>.size, 0b1000000100001001 + 345 + 0 + 0b11111101000110)
//		XCTAssertEqual(MemoryLayout<(D.n4.n7.n1.self + B.I.O.I.O.I.O.I.I.O.I.O.O.O.I.I.O.I.self)>.size, 471 + 0b10101011010001101)
//		XCTAssertEqual(MemoryLayout<(D.n2.n8.n2.self + B.I.O.I.self + D.n2.n5.n9.self + B.I.O.O.O.I.O.I.I.O.self)>.size, 282 + 0b101 + 259 + 0b100010110)
//		XCTAssertEqual(MemoryLayout<(B.I.O.O.I.O.O.I.I.I.I.self + B.I.I.self + D.n4.n6.self)>.size, 0b1001001111 + 0b11 + 46)
//		XCTAssertEqual(MemoryLayout<(B.I.I.O.O.O.I.O.O.O.O.I.O.I.self + D.self + B.I.O.O.I.O.O.I.I.O.O.I.self)>.size, 0b1100010000101 + 0 + 0b10010011001)
//	}
}

