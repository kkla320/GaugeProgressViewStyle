// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GaugeProgressViewStyle",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .macCatalyst(.v14),
        .tvOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "GaugeProgressViewStyle",
            targets: ["GaugeProgressViewStyle"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "ViewInspector", url: "https://github.com/nalexn/ViewInspector.git", from: "0.9.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "GaugeProgressViewStyle",
            dependencies: []),
        .testTarget(
            name: "GaugeProgressViewStyleTests",
            dependencies: [
                "GaugeProgressViewStyle",
                "ViewInspector"
            ]
        ),
    ]
)
