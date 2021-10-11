//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.09.21.
//

import Foundation
import SwiftUI

extension ProgressViewStyle {
    /// A progress view that visually indicates its progress using a gauge.
    /// - Parameter thickness: The thickness of the gauge.
    /// - Returns: A view representing the body of a progress view with traffic light angular gradient and no labels for the lowest and highest value.
    public static func gauge(thickness: CGFloat = 12) -> GaugeProgressViewStyle<AngularGradient, EmptyView, EmptyView> where Self == GaugeProgressViewStyle<AngularGradient, EmptyView, EmptyView> {
        return GaugeProgressViewStyle(
            shape: .trafficLight,
            thickness: thickness) {
                EmptyView()
            } upperLabel: {
                EmptyView()
            }
    }
    
    /// A progress view that visually indicates its progress using a gauge.
    /// - Parameter thickness: The thickness of the gauge.
    /// - Parameter lowerLabel: A view builder that creates a view that describes the lowest value of the gauge.
    /// - Parameter upperLabel: A view builder that creates a view that describes the highest value of the gauge.
    /// - Returns: A view representing the body of a progress view with traffic light angular gradient and a minimum and maximum label.
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
    
    /// A progress view that visually indicates its progress using a gauge.
    /// - Parameter shape: The shape used for coloring the gauge.
    /// - Parameter thickness: The thickness of the gauge.
    /// - Returns: A view representing the body of a progress view with the shape and no labels for the lowest and highest value.
    public static func gauge<S: ShapeStyle & View>(shape: S, thickness: CGFloat = 12) -> GaugeProgressViewStyle<S, EmptyView, EmptyView> where Self == GaugeProgressViewStyle<S, EmptyView, EmptyView> {
        return GaugeProgressViewStyle(
            shape: shape,
            thickness: thickness) {
                EmptyView()
            } upperLabel: {
                EmptyView()
            }
    }
    
    /// A progress view that visually indicates its progress using a gauge.
    /// - Parameter shape: The shape used for coloring the gauge.
    /// - Parameter thickness: The thickness of the gauge.
    /// - Parameter lowerLabel: A view builder that creates a view that describes the lowest value of the gauge.
    /// - Parameter upperLabel: A view builder that creates a view that describes the highest value of the gauge.
    /// - Returns: A view representing the body of a progress view with the shape and a minimum and maximum label.
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
