//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.09.21.
//

import Foundation
import SwiftUI

struct Ring: Shape {
    var thickness: CGFloat
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        let gaugeRadius = rect.shortestSide / 2
        let center = rect.center
        
        var path = Path()
        
        path.addArc(
            center: center,
            radius: gaugeRadius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: false
        )
        
        path.addArc(
            center: center + CGPoint(angle: endAngle, hypothenuse: (gaugeRadius - (thickness / 2))),
            radius: thickness / 2,
            startAngle: endAngle,
            endAngle: endAngle + .radians(.pi),
            clockwise: false
        )
        
        path.addArc(
            center: center,
            radius: gaugeRadius - thickness,
            startAngle: endAngle,
            endAngle: startAngle,
            clockwise: true
        )

        path.addArc(
            center: center + CGPoint(angle: startAngle, hypothenuse: (gaugeRadius - (thickness / 2))),
            radius: thickness / 2,
            startAngle: startAngle - .radians(.pi),
            endAngle: startAngle,
            clockwise: false
        )
        
        return path
    }
}

struct Ring_Previews: PreviewProvider {
    static var previews: some View {
        Ring(
            thickness: 15,
            startAngle: .radians(0),
            endAngle: .radians(Double.pi)
        )
        .stroke(.blue, lineWidth: 2)
        .previewLayout(.fixed(width: 300, height: 300))
        
        Ring(
            thickness: 15,
            startAngle: .degrees(0),
            endAngle: .degrees(90)
        )
        .stroke(Color.blue, lineWidth: 2)
        .previewLayout(.fixed(width: 300, height: 300))
    }
}
