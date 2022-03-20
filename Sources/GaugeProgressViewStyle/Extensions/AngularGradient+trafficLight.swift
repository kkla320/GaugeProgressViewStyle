//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.09.21.
//

import Foundation
import SwiftUI

extension AngularGradient {
    static var trafficLight: AngularGradient {
        AngularGradient(
            colors: [
                Color.red,
                Color.yellow,
                Color.green
            ],
            center: .center,
            startAngle: .angularGradientGaugeStart,
            endAngle: .angularGradientGaugeEnd
        )
    }
}
