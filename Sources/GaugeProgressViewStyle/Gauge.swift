//
//  SwiftUIView.swift
//  
//
//  Created by Kevin Klaebe on 25.09.21.
//

import SwiftUI

struct Gauge<S: ShapeStyle & View, Label: View, LowerLabel: View, UpperLabel: View>: View {
    private let startAngle: Angle = .degrees(140)
    private let endAngle: Angle = .degrees(40)
    
    private var shape: S
    private var thickness: CGFloat
    private var value: Double
    private var label: () -> Label
    private var lowerLabel: () -> LowerLabel?
    private var upperLabel: () -> UpperLabel?
    
    var body: some View {
        ZStack {
            Ring(
                thickness: thickness,
                startAngle: startAngle,
                endAngle: endAngle
            )
            .fill(shape)
            
            GaugePointer(
                size: thickness,
                lineWidth: 2,
                angle: startAngle
            )
            .rotationEffect(((.degrees(360) - (startAngle - endAngle)) * value), anchor: UnitPoint.center)
            
            label()
            
            GeometryReader { geometry in
                if let text = lowerLabel() {
                    shape
                        .mask(
                            text
                                .gaugeLabelPosition(
                                    size: geometry.size,
                                    angle: startAngle,
                                    thickness: thickness,
                                    position: .left
                                )
                        )
                }
                if let text = upperLabel() {
                    shape
                        .mask(
                            text
                                .gaugeLabelPosition(
                                    size: geometry.size,
                                    angle: endAngle,
                                    thickness: thickness,
                                    position: .right
                                )
                        )
                }
            }
        }
    }
    
    init(
        shape: S,
        thickness: CGFloat,
        value: Double,
        label: @escaping () -> Label,
        lowerLabel: @escaping () -> LowerLabel?,
        upperLabel: @escaping () -> UpperLabel?
    ) {
        self.shape = shape
        self.thickness = thickness
        self.value = value
        self.label = label
        self.lowerLabel = lowerLabel
        self.upperLabel = upperLabel
    }
}

struct Gauge_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            Gauge(shape: Color.red, thickness: 30, value: 0) {
                Text("Gauge")
            } lowerLabel: {
                Text("12")
            } upperLabel: {
                Text("24")
            }
            
            Gauge(shape: Color.red, thickness: 30, value: 0.5) {
                Text("Gauge")
            } lowerLabel: {
                Text("12")
            } upperLabel: {
                Text("24")
            }
        }
        .previewLayout(.fixed(width: 300, height: 300))
        
        Group {
            Gauge(shape: Color.red, thickness: 15, value: 0.5) {
                Text("Gauge")
            } lowerLabel: {
                Text("12")
            } upperLabel: {
                Text("24")
            }
            
            Gauge(shape: Color.red, thickness: 15, value: 1) {
                Image(systemName: "sun.max.fill")
                    .imageScale(.large)
            } lowerLabel: {
                Text("12")
            } upperLabel: {
                Text("24")
            }
        }
        .previewLayout(.fixed(width: 100, height: 100))
    }
}
