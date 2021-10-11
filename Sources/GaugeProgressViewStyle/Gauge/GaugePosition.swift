//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.09.21.
//

import Foundation
import SwiftUI

enum GaugePosition {
    case left
    case right
    
    func calculateRect(size: CGSize, angle: Angle, thickness: CGFloat) -> CGRect {
        let correctionForThickness = self == .left ? (thickness / 2) : -(thickness / 2)
        let hypothenuse = (size.shortestSide / 2) - (thickness / 2)
        let topRightCorner = CGPoint(angle: angle, hypothenuse: hypothenuse)
            .manipulateX(byAdding: correctionForThickness)
        
        let width = abs(topRightCorner.x)
        let height = (size.shortestSide / 2) - abs(topRightCorner.y)
        let x = min((size.width / 2) + topRightCorner.x, (size.width / 2))
        let y = (size.height / 2) + topRightCorner.y
        
        return CGRect(
            origin: CGPoint(
                x: x,
                y: y
            ),
            size: CGSize(
                width: width,
                height: height
            )
        )
    }
}

extension View {
    func gaugeLabelPosition(size: CGSize, angle: Angle, thickness: CGFloat, position: GaugePosition) -> some View {
        let rect = position.calculateRect(size: size, angle: angle, thickness: thickness)
        
        return self
            .frame(
                width: rect.width,
                height: rect.height,
                alignment: position == .left ? .leading : .trailing
            )
            .position(
                x: rect.center.x,
                y: rect.center.y
            )
    }
}
