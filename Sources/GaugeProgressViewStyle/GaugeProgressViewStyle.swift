import SwiftUI
import Combine

public struct GaugeProgressViewStyle: ProgressViewStyle {
    public func makeBody(configuration: Configuration) -> some View {
        Gauge(thickness: 12, value: configuration.fractionCompleted ?? 0) {
            configuration.label
        }
        .frame(width: 100, height: 100)
    }
}

@available(iOS 15, *)
struct GaugeProgressViewStyle_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ProgressView(value: 0)
                .progressViewStyle(GaugeProgressViewStyle())
            
            ProgressView.init(value: 0.5) {
                Text("Gauge")
            }
            .progressViewStyle(GaugeProgressViewStyle())
            
            ProgressView.init(value: 0.5) {
                Text("Gauge")
            }
            .progressViewStyle(.gauge)
        }
        .previewLayout(.fixed(width: 300, height: 300))
    }
}
