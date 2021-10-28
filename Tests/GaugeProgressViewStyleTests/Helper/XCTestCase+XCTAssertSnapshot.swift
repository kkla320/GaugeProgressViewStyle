//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 28.10.21.
//

import XCTest
import SnapshotTesting
import SwiftUI

extension XCTestCase {
    func XCTAssertSnapshot<Value, Format>(
        matching: @autoclosure () throws -> Value,
        as snapshotting: Snapshotting<Value, Format>,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) {
        #if os(iOS)
        assertSnapshot(matching: try matching(), as: snapshotting, named: "iOS", file: file, testName: testName, line: line)
        #elseif os(macOS)
        assertSnapshot(matching: try matching(), as: snapshotting, named: "macOS", file: file, testName: testName, line: line)
        #endif
    }
}

#if os(iOS)
extension Snapshotting where Value: SwiftUI.View, Format == UIImage {
    public static func image(size: CGSize) -> Snapshotting {
        return Snapshotting<Value, UIImage>.image(
            layout: .fixed(width: size.width, height: size.height)
        )
    }
}
#elseif os(macOS)
extension Snapshotting where Value: SwiftUI.View, Format == NSImage {
    public static func image(size: CGSize) -> Snapshotting {
        let correctedSize = CGSize(width: size.width, height: size.height)
        return Snapshotting<NSViewController, NSImage>.image(size: correctedSize).pullback {
            NSHostingController(rootView: $0.background(Color.white))
        }
    }
}
#endif
