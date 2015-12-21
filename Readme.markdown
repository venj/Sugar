Sugar
=====

[![Build Status](https://travis-ci.org/venj/Sugar.svg?branch=master)](https://travis-ci.org/venj/Sugar)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Sugar for Swift -- Ruby Core sweetness and more for Swift. 

If you're looking for a complete Ruby Core implementation, see this: [RubyNative/SwiftRuby](https://github.com/RubyNative/SwiftRuby)

Usage
-----

You can use this project with Carthage and Swift Package Manager.

### Carthage

Sugar supports iOS, OS X, tvOS and watchOS 2(?) by using Carthage. Add following line to your Cartfile:

```
github "venj/Sugar" ~> 0.1.0
```

Add both Sugar.framework and CommonCrypto.framework to your project.

### Swift Package Manager

Swift Package Manager only supports OS X target and Linux target for now. Add dependency code in your Package.swift:

```swift
dependencies: [
    .Package(url: "https://github.com/venj/Sugar.git", versions: Version(0,1,0) ..< Version(1,0,0)),
]
```

If you are on Linux, you may also need to install OpenSSL library headers.

```bash
sudo apt-get install libssl-dev
```

Now, in your code:

```swift
import Sugar
```

**Note:** There are many extension methods missing on Linux platform as they require methods that only available on OS X. As Apple's cross-platform Foundation library expanding, these extension methods would be finally available on Linux.

Documentation
-------------

1. Install the tool

	```
	gem install jazzy
	```

2. Generate documentation

	```
	jazzy
	```

3. Read documentation in `docs` directory.

See [main.swift](https://github.com/venj/SugarTest/blob/master/Sources/main.swift) for an example.

Known Issues
------------

Currently, playgrounds in the sample project is not working.
