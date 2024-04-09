// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Presentation",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Presentation",
            targets: ["Presentation"]),
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../Shared"),
        .package(path: "../Data"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.0.0"),
        .package(url: "https://github.com/nalexn/ViewInspector.git", from: "0.9.10")
    ],
    targets: [
        .target(
            name: "Presentation",
            dependencies: ["Domain", "Shared", "Data", "Kingfisher", "ViewInspector"]),
        .testTarget(
            name: "PresentationTests",
            dependencies: ["Presentation"]),
    ]
)
