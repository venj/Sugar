Sugar
=====

Sugar for Swift. Ruby Core sweetness and more for Swift. 

If you're looking for a complete Ruby Core implementation, see this: [RubyNative/SwiftRuby](https://github.com/RubyNative/SwiftRuby)

Usage
-----

Add this repo as a git submodule. Add Sugar_`$ARCH` to Linked Frameworks and Libraries. `$ARCH` could be iOS, OSX, watchOS, tvOS. 

Add import in your code like:

```swift
import Sugar_iOS 
```

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

Linux Support
-------------

Part of the code is now Linux compatiable. Linux support will evolve as Swift evolves.


Usage for Linux
---------------

Add dependency code in your Package.swift:

```
dependencies: [
    .Package(url: "https://github.com/venj/Sugar.git", versions: Version(0,0,1) ..< Version(1,0,0)),
]
```

Now, in your code:

```
import Sugar
```

See [main.swift](https://github.com/venj/SugarTest/blob/master/Sources/main.swift) for an example.
