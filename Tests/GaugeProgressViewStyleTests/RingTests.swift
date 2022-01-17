//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 28.09.21.
//

import Foundation
import XCTest

@testable import GaugeProgressViewStyle

final class RingTests: XCTestCase {
    func test_startAngleAt0_endAngleAt90() async {
        let ring = Ring(thickness: 20, startAngle: .degrees(0), endAngle: .degrees(90))
        
        var controlPoints: [CGPoint] = []
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        ring.path(in: rect).forEach { element in
            switch element {
                case .curve(to: let controlPoint, control1: _, control2: _):
                    controlPoints.append(controlPoint)
                default:
                    break
            }
        }
        
        XCTAssertEqual(controlPoints.count, 6)
        XCTAssertEqual(controlPoints[0].rounded(), CGPoint(x: 50, y: 100))
        XCTAssertEqual(controlPoints[1].rounded(), CGPoint(x: 40, y: 90))
        XCTAssertEqual(controlPoints[2].rounded(), CGPoint(x: 50, y: 80))
        XCTAssertEqual(controlPoints[3].rounded(), CGPoint(x: 80, y: 50))
        XCTAssertEqual(controlPoints[4].rounded(), CGPoint(x: 90, y: 40))
        XCTAssertEqual(controlPoints[5].rounded(), CGPoint(x: 100, y: 50))
    }
    
    func test_startAngleAt90_endAngleAt0() {
        let ring = Ring(thickness: 20, startAngle: .degrees(90), endAngle: .degrees(0))
        
        var controlPoints: [CGPoint] = []
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        ring.path(in: rect).forEach { element in
            switch element {
                case .curve(to: let to, control1: _, control2: _):
                    print(to)
                    controlPoints.append(to)
                default:
                    break
            }
        }
        
        XCTAssertEqual(controlPoints.count, 10)
        XCTAssertEqual(controlPoints[0].rounded(), CGPoint(x: 0, y: 50))
        XCTAssertEqual(controlPoints[1].rounded(), CGPoint(x: 50, y: 0))
        XCTAssertEqual(controlPoints[2].rounded(), CGPoint(x: 100, y: 50))
        XCTAssertEqual(controlPoints[3].rounded(), CGPoint(x: 90, y: 60))
        XCTAssertEqual(controlPoints[4].rounded(), CGPoint(x: 80, y: 50))
        XCTAssertEqual(controlPoints[5].rounded(), CGPoint(x: 50, y: 20))
        XCTAssertEqual(controlPoints[6].rounded(), CGPoint(x: 20, y: 50))
        XCTAssertEqual(controlPoints[7].rounded(), CGPoint(x: 50, y: 80))
        XCTAssertEqual(controlPoints[8].rounded(), CGPoint(x: 60, y: 90))
        XCTAssertEqual(controlPoints[9].rounded(), CGPoint(x: 50, y: 100))
    }
}
