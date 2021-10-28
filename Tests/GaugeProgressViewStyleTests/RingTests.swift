//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 28.09.21.
//

import Foundation
import XCTest
import SnapshotTesting

@testable import GaugeProgressViewStyle

final class RingTests: XCTestCase {
    override func setUp() {
        isRecording = false
    }
    
    func test_startAngleAt0_endAngleAt90() {
        let ring = Ring(thickness: 20, startAngle: .degrees(0), endAngle: .degrees(90))
        
        XCTAssertSnapshot(matching: ring, as: .image(size: CGSize(width: 300, height: 300)))
    }
    
    func test_startAngleAt90_endAngleAt0() {
        let ring = Ring(thickness: 20, startAngle: .degrees(90), endAngle: .degrees(0))
        
        XCTAssertSnapshot(matching: ring, as: .image(size: CGSize(width: 300, height: 300)))
    }
}
