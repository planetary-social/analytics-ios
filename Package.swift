// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Analytics",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Analytics",
            targets: ["Analytics"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "Logger",
                 url: "https://github.com/planetary-social/logger-ios",
                 from: "0.0.2"),
        .package(name: "Secrets",
                 url: "https://github.com/planetary-social/secrets-ios",
                 from: "0.0.3"),
        .package(name: "PostHog",
                 url: "https://github.com/PostHog/posthog-ios",
                 from: "1.4.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Analytics",
            dependencies: ["Secrets", "Logger", "PostHog"]),
        .testTarget(
            name: "AnalyticsTests",
            dependencies: ["Analytics"]),
    ]
)
