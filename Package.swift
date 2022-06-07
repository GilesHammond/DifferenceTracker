// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "DifferenceTracker",
    products: [
        .library(
            name: "DifferenceTracker",
            targets: ["DifferenceTracker"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DifferenceTracker",
            dependencies: []),
        .testTarget(
            name: "DifferenceTrackerTests",
            dependencies: ["DifferenceTracker"]),
    ]
)
