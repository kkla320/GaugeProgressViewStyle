//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 28.09.21.
//

import Foundation
import SwiftUI
import XCTest
import SnapshotTesting

@testable import GaugeProgressViewStyle

final class GaugePointerTests: XCTestCase {
    override func setUp() {
        isRecording = false
    }
    
    func test_at0Degrees() {
        let gaugePointer = GaugePointer(
            size: 20,
            lineWidth: 2,
            angle: .degrees(0)
        )
        
        XCTAssertSnapshot(matching: gaugePointer, as: .image(size: CGSize(width: 300, height: 300)))
    }
    
    func test_at90Degrees() {
        let gaugePointer = GaugePointer(
            size: 20,
            lineWidth: 2,
            angle: .degrees(90)
        )
        
        XCTAssertSnapshot(matching: gaugePointer, as: .image(size: CGSize(width: 300, height: 300)))
    }
}
