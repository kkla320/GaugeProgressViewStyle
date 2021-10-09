//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 01.10.21.
//

import Foundation
import CoreGraphics

extension CGRect {
    var shortestSide: CGFloat {
        return min(width, height)
    }
}

extension CGSize {
    var shortestSide: CGFloat {
        return min(width, height)
    }
}
