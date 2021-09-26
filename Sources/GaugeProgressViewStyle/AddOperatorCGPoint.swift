//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.09.21.
//

import Foundation
import CoreGraphics

func +(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(
        x: left.x + right.x,
        y: left.y + right.y
    )
}
