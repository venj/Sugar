import PackageDescription

let package = Package(
    name: "Sugar",
    dependencies: [
        .Package(url: "https://github.com/johnno1962/NSLinux.git", versions: "1.0.0" ..< Version.max),
    ]
)
