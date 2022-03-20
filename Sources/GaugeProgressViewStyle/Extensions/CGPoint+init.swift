//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.09.21.
//

import Foundation
import CoreGraphics
import SwiftUI
import Trigonometry

extension CGPoint {
    init(angle: SwiftUI.Angle, hypothenuse: CGFloat) {
        self.init(
            x: Double.adjacent(angle: angle, hypothenuse: hypothenuse),
            y: Double.opposite(angle: angle, hypothenuse: hypothenuse)
        )
    }
}
