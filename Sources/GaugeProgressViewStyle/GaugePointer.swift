//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.09.21.
//

import Foundation
import SwiftUI

struct GaugePointer: View {
    var size: CGFloat
    var lineWidth: CGFloat
    var angle: Angle
    
    var body: some View {
        GeometryReader { geometry in
            Circle()
                .stroke(Color.black, lineWidth: lineWidth)
                .frame(
                    width: size - lineWidth,
                    height: size - lineWidth
                )
                .offset(
                    x: CGPoint(
                        angle: angle,
                        hypothenuse: (geometry.size.width / 2) - (size / 2)).x,
                    y: CGPoint(
                        angle: angle,
                        hypothenuse: (geometry.size.height / 2) - (size / 2)).y
                )
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct GaugePointer_Preview: PreviewProvider {
    static var previews: some View {
        GaugePointer(size: 20, lineWidth: 2, angle: .degrees(45))
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
