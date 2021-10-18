//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 13.10.21.
//

import XCTest
import SnapshotTesting
import SwiftUI

@testable import GaugeProgressViewStyle

final class GaugeProgressViewStyleTests: XCTestCase {
    override func setUp() {
        isRecording = false
    }
    
    func test_withoutParameters() {
        let gaugeProgressView = ProgressView(value: 0)
            .progressViewStyle(.gauge())
            .padding()
        
        assertSnapshot(matching: gaugeProgressView, as: .image(layout: .fixed(width: 250, height: 200)))
    }
    
    func test_withCustomThickness() {
        let gaugeProgressView = ProgressView(value: 0.5)
            .progressViewStyle(.gauge(thickness: 20))
            .padding()
        
        assertSnapshot(matching: gaugeProgressView, as: .image(layout: .fixed(width: 250, height: 200)))
    }
    
    func test_withLabel() {
        let gaugeProgressView = ProgressView(value: 0.5) {
                Text("Gauge")
            }
            .progressViewStyle(.gauge())
            .padding()
        
        assertSnapshot(matching: gaugeProgressView, as: .image(layout: .fixed(width: 250, height: 200)))
    }
    
    func test_withTextUpperAndLowerLabel() {
        let gaugeProgressView = ProgressView(value: 0.5)
            .progressViewStyle(
                .gauge {
                    Text("12")
                } upperLabel: {
                    Text("24")
                }
            )
            .padding()
        
        assertSnapshot(matching: gaugeProgressView, as: .image(layout: .fixed(width: 250, height: 200)))
    }
    
    func test_withImageUpperAndLowerLabel() {
        let gaugeProgressView = ProgressView(value: 0.5)
            .progressViewStyle(
                .gauge {
                    Image(systemName: "sun.max.fill")
                } upperLabel: {
                    Image(systemName: "cloud.rain.fill")
                }
            )
            .padding()
        
        assertSnapshot(matching: gaugeProgressView, as: .image(layout: .fixed(width: 250, height: 200)))
    }
}
