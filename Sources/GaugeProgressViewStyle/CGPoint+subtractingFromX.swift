//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 28.09.21.
//

import Foundation
import CoreGraphics

extension CGPoint {
    func manipulateX(byAdding value: CGFloat) -> CGPoint {
        return CGPoint(
            x: self.x + value,
            y: self.y
        )
    }
}
