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
                .red,
                .yellow,
                .green
            ],
            center: .center
        )
    }
}
