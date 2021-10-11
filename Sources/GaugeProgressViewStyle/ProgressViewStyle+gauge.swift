//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.09.21.
//

import Foundation
import SwiftUI

extension ProgressViewStyle {
    public static func gauge(thickness: CGFloat = 12) -> GaugeProgressViewStyle<AngularGradient, EmptyView, EmptyView> where Self == GaugeProgressViewStyle<AngularGradient, EmptyView, EmptyView> {
        return GaugeProgressViewStyle(
            shape: .trafficLight,
            thickness: thickness) {
                EmptyView()
            } upperLabel: {
                EmptyView()
            }
    }
    
    public static func gauge<LowerLabel: View, UpperLabel: View>(
        thickness: CGFloat = 12,
        @ViewBuilder lowerLabel: @escaping () -> LowerLabel,
        @ViewBuilder upperLabel: @escaping () -> UpperLabel
    ) -> GaugeProgressViewStyle<AngularGradient, LowerLabel, UpperLabel> where Self == GaugeProgressViewStyle<AngularGradient, LowerLabel, UpperLabel> {
        return GaugeProgressViewStyle(
            shape: .trafficLight,
            thickness: thickness,
            lowerLabel: lowerLabel,
            upperLabel: upperLabel
        )
    }
    
    public static func gauge<S: ShapeStyle & View>(shape: S, thickness: CGFloat = 12) -> GaugeProgressViewStyle<S, EmptyView, EmptyView> where Self == GaugeProgressViewStyle<S, EmptyView, EmptyView> {
        return GaugeProgressViewStyle(
            shape: shape,
            thickness: thickness) {
                EmptyView()
            } upperLabel: {
                EmptyView()
            }
    }
    
    public static func gauge<S: ShapeStyle & View, LowerLabel: View, UpperLabel: View>(
        shape: S,
        thickness: CGFloat = 12,
        @ViewBuilder lowerLabel: @escaping () -> LowerLabel,
        @ViewBuilder upperLabel: @escaping () -> UpperLabel
    ) -> GaugeProgressViewStyle<S, LowerLabel, UpperLabel> where Self == GaugeProgressViewStyle<S, LowerLabel, UpperLabel> {
        return GaugeProgressViewStyle(
            shape: shape,
            thickness: thickness,
            lowerLabel: lowerLabel,
            upperLabel: upperLabel
        )
    }
}
