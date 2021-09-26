//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.09.21.
//

import Foundation
import SwiftUI

@available(iOS 15, *)
extension ProgressViewStyle where Self == GaugeProgressViewStyle {
    public static var gauge: GaugeProgressViewStyle {
        return GaugeProgressViewStyle()
    }
}
