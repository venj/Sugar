import PackageDescription

let package = Package(
    name: "Sugar",
    dependencies: [
        .Package(url: "https://github.com/venj/COpenSSL.git", versions: Version(0,0,1) ..< Version(1,0,0)),
    ]
)

#if !os(Linux)
package.dependencies.append(.Package(url: "https://github.com/venj/CommonCrypto.git", versions: Version(0,0,1) ..< Version(1,0,0)))
#endif