import SwiftUI
import Combine

public struct GaugeProgressViewStyle<LowerLabel: View, UpperLabel: View>: ProgressViewStyle {
    private var lowerLabel: () -> LowerLabel?
    private var upperLabel: () -> UpperLabel?
    
    public func makeBody(configuration: Configuration) -> some View {
        Gauge(thickness: 12, value: configuration.fractionCompleted ?? 0) {
            configuration.label
        } lowerLabel: {
            lowerLabel()
        } upperLabel: {
            upperLabel()
        }
        .frame(width: 100, height: 100)
    }
    
    public init() where LowerLabel == EmptyView, UpperLabel == EmptyView {
        lowerLabel = { nil }
        upperLabel = { nil }
    }
    
    public init<S1: StringProtocol, S2: StringProtocol>(lowerLabel: S1, upperLabel: S2) where LowerLabel == Text, UpperLabel == Text {
        self.lowerLabel = {
            Text(lowerLabel)
        }
        self.upperLabel = {
            Text(upperLabel)
        }
    }
    
    public init(lowerLabelSystemName: String, upperLabelSystemName: String) where LowerLabel == Image, UpperLabel == Image {
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
        .previewLayout(.fixed(width: 200, height: 200))
    }
}
