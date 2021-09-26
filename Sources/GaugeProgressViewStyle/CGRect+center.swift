//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.09.21.
//

import Foundation
import CoreGraphics

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}
