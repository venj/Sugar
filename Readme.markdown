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

