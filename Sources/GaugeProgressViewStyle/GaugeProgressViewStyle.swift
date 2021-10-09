import SwiftUI
import Combine

public struct GaugeProgressViewStyle<S: ShapeStyle & View, LowerLabel: View, UpperLabel: View>: ProgressViewStyle {
    private var shape: S
    private var thickness: CGFloat = 12
    private var lowerLabel: () -> LowerLabel?
    private var upperLabel: () -> UpperLabel?
    
    public func makeBody(configuration: Configuration) -> some View {
        Gauge(
            shape: shape,
            thickness: thickness,
            value: configuration.fractionCompleted ?? 0
        ) {
            configuration.label
        } lowerLabel: {
            lowerLabel()
        } upperLabel: {
            upperLabel()
        }
    }
    
    public init(thickness: CGFloat = 12) where S == AngularGradient, LowerLabel == EmptyView, UpperLabel == EmptyView {
        self.shape = .trafficLight
        self.thickness = thickness
        lowerLabel = { nil }
        upperLabel = { nil }
    }
    
    public init(shape: S, thickness: CGFloat = 12) where LowerLabel == EmptyView, UpperLabel == EmptyView {
        self.shape = shape
        self.thickness = thickness
        lowerLabel = { nil }
        upperLabel = { nil }
    }
    
    public init<S1: StringProtocol, S2: StringProtocol>(
        thickness: CGFloat = 12,
        lowerLabel: S1,
        upperLabel: S2
    ) where S == AngularGradient, LowerLabel == Text, UpperLabel == Text {
        self.shape = .trafficLight
        self.thickness = thickness
        self.lowerLabel = {
            Text(lowerLabel)
        }
        self.upperLabel = {
            Text(upperLabel)
        }
    }
    
    public init<S1: StringProtocol, S2: StringProtocol>(
        shape: S,
        thickness: CGFloat = 12,
        lowerLabel: S1,
        upperLabel: S2
    ) where LowerLabel == Text, UpperLabel == Text {
        self.shape = shape
        self.thickness = thickness
        self.lowerLabel = {
            Text(lowerLabel)
        }
        self.upperLabel = {
            Text(upperLabel)
        }
    }
    
    public init(
        thickness: CGFloat = 12,
        lowerLabelSystemName: String,
        upperLabelSystemName: String
    ) where S == AngularGradient, LowerLabel == Image, UpperLabel == Image {
        self.shape = .trafficLight
        self.thickness = thickness
        self.lowerLabel = {
            Image(systemName: lowerLabelSystemName)
        }
        self.upperLabel = {
            Image(systemName: upperLabelSystemName)
        }
    }
    
    public init(
        shape: S,
        thickness: CGFloat = 12,
        lowerLabelSystemName: String,
        upperLabelSystemName: String
    ) where LowerLabel == Image, UpperLabel == Image {
        self.shape = shape
        self.thickness = thickness
        self.lowerLabel = {
            Image(systemName: lowerLabelSystemName)
        }
        self.upperLabel = {
            Image(systemName: upperLabelSystemName)
        }
    }
}

@available(iOS 15, *)
struct GaugeProgressViewStyle_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ProgressView(value: 0)
                .progressViewStyle(GaugeProgressViewStyle())
            
            ProgressView(value: 0.5) {
                Text("Gauge")
            }
            .progressViewStyle(GaugeProgressViewStyle())
            
            ProgressView(value: 0.5) {
                Text("Gauge")
            }
            .progressViewStyle(GaugeProgressViewStyle())
            
            ProgressView(value: 0.5) {
                Text("Gauge")
            }
            .progressViewStyle(GaugeProgressViewStyle(lowerLabel: "12", upperLabel: "24"))
            
            ProgressView(value: 0.5) {
                Text("Gauge")
            }
            .progressViewStyle(
                GaugeProgressViewStyle(
                    lowerLabelSystemName: "sun.max.fill",
                    upperLabelSystemName: "cloud.rain.fill"
                )
            )
        }
        .previewLayout(.fixed(width: 250, height: 200))
    }
}
