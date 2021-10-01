//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 28.09.21.
//

import Foundation
import XCTest

@testable import GaugeProgressViewStyle

final class GaugePositionTests: XCTestCase {
    func test_calculateRect_left() {
        let gaugePosition = GaugePosition.left
        
        let rect = gaugePosition.calculateRect(
            size: CGSize(width: 300, height: 300),
            angle: .degrees(135),
            thickness: 20
        )
        
        XCTAssertEqual(rect.origin.x, 61.00505063388336)
        XCTAssertEqual(rect.origin.y, 248.994949366116653)
        XCTAssertEqual(rect.size.width, 88.99494936611664)
        XCTAssertEqual(rect.size.height, 51.00505063388334)
    }
    
    func test_calculateRect_right() {
        let gaugePosition = GaugePosition.right
        
        let rect = gaugePosition.calculateRect(
            size: CGSize(width: 300, height: 300),
            angle: .degrees(45),
            thickness: 20
        )
        
        XCTAssertEqual(rect.origin.x, 150)
        XCTAssertEqual(rect.origin.y, 248.994949366116653)
        XCTAssertEqual(rect.size.width, 88.99494936611666)
        XCTAssertEqual(rect.size.height, 51.00505063388336)
    }
}
