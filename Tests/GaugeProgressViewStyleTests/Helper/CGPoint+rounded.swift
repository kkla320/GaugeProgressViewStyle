import CoreGraphics

extension CGPoint {
    func rounded() -> CGPoint {
        return CGPoint(x: x.rounded(), y: y.rounded())
    }
}
