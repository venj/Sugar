// swift-tools-version:4.2

import PackageDescription

let pkg = Package(name: "Sugar")
pkg.products = [
    .library(name: "Sugar", targets: ["Sugar"]),
]

let sugar: Target = .target(name: "Sugar")
sugar.path = "Sugar"
sugar.exclude = [
    "UIAlertAction.swift",
    "UIAlertController+Sugar.swift",
    "UINavigationController+StatusBarStyle.swift",
    "UITabBarController+StatusBarStyle.swift",
    "Sugar.h"
]
pkg.swiftLanguageVersions = [SwiftVersion.v4, SwiftVersion.v4_2]
pkg.targets = [
    sugar
]
