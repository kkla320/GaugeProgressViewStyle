//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.09.21.
//

import Foundation
import CoreGraphics
import SwiftUI

extension CGPoint {
    init(angle: Angle, hypothenuse: CGFloat) {
        self.init(
            x: hypothenuse * cos(angle.radians),
            y: hypothenuse * sin(angle.radians)
        )
    }
}
