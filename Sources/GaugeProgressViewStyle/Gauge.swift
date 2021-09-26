//
//  SwiftUIView.swift
//  
//
//  Created by Kevin Klaebe on 25.09.21.
//

import SwiftUI

struct Gauge<Label: View>: View {
    private let indicatorStrokeLineWidth: CGFloat = 2
    private let startAngle: Angle = .degrees(40)
    private let endAngle: Angle = .degrees(140)
    
    var thickness: CGFloat = 30
    var value: Double
    var label: () -> Label
    
    var body: some View {
        ZStack {
            Ring(
                thickness: thickness,
                startAngle: startAngle,
                endAngle: endAngle
            )
            .fill(
                AngularGradient(
                    colors: [
                        .red,
                        .yellow,
                        .green
                    ],
                    center: .center,
                    startAngle: .degrees(180),
                    endAngle: .degrees(360)
                )
            )
            
            GaugePointer(
                size: thickness,
                lineWidth: 2,
                angle: endAngle + ((.degrees(360) - (endAngle - startAngle)) * value)
            )
            
            label()
        }
    }
}

struct Gauge_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            Gauge(value: 0) {
                Text("Gauge")
            }
            Gauge(value: 0.5) {
                Text("Gauge")
            }
        }
        .previewLayout(.fixed(width: 300, height: 300))
        
        Group {
            Gauge(thickness: 15, value: 0.5) {
                Text("Gauge")
            }
            
            Gauge(thickness: 15, value: 0.5) {
                Image(systemName: "sun.max.fill")
                    .imageScale(.large)
            }
        }
        .previewLayout(.fixed(width: 100, height: 100))
    }
}
