import PackageDescription

let package = Package(
    name: "Sugar",
    dependencies: [
        .Package(url: "https://github.com/johnno1962/NSLinux.git", versions: Version(1,0,0) ..< Version(2,0,0)),
        .Package(url: "https://github.com/venj/COpenSSL.git", versions: Version(0,0,1) ..< Version(1,0,0)),
    ]
)
