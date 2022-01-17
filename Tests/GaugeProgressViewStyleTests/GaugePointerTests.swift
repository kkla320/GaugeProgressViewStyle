//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 28.09.21.
//

import Foundation
import SwiftUI
import XCTest
import ViewInspector

@testable import GaugeProgressViewStyle

final class GaugePointerTests: XCTestCase {
    func test_structure() {
        let gaugePointer = GaugePointer(
            size: 20,
            lineWidth: 2,
            angle: .degrees(0)
        )
        
        let geometryReader = try? gaugePointer.body.inspect().geometryReader()
        let shape = try? geometryReader?.shape()
        let circleFrame = try? shape?.fixedFrame()
        
        XCTAssertNotNil(geometryReader)
        XCTAssertNotNil(shape)
        XCTAssertEqual(circleFrame?.width, 18)
        XCTAssertEqual(circleFrame?.height, 18)
    }
}
