//: Playground - noun: a place where people can play

import UIKit
import Sugar

let base = "Hello"
base.ljust(20, padString: "abc")

base.lstrip()

var vbase = base
vbase.lstripInPlace()

base.match("H", offset: 9)?.range.location

base.match("H") {
    let capture = base[$0.range]
}

base.ljust(20)
base.ljust(20, padString: "abc")
base.rjust(20)
base.rjust(20, padString: "abc")

let myString = "<li><a href=\"https://google.com\">Google</a></li><li><a href=\"https://apple.com\">Apple</a></li>"

var result = ""
myString.scan("<a href=\"([^\"]+?)\">([^<]+?)</a>") { match in
    let keyRange = match[1]
    let valueRange = match[2]
    result = result + myString[keyRange] + ", "  + myString[valueRange] + "; "
}
result

let endIndex = myString.startIndex.advancedBy(2)
let subRange = Range<String.Index>(start: myString.startIndex, end: endIndex)

let testString = "test"
let nsrange = NSRange(location:0, length:500)
testString[nsrange]

myString.split("</[^>]+?>", isRegex: true)

myString.squeeze()
vbase.squeezeInPlace()
vbase = "H ello   Wor  l d"
vbase.squeezeInPlace()

vbase.validEncoding(NSUTF8StringEncoding)
vbase.fastestEncoding

"Size: %d" %% [12]
 
"good".split("")

let str1 = "The big brown fox jumps over the lazy dog."

str1.delete(["hello", "old"])
let str = "Hello, Hello, Hello"
str.partition("ll")
str.rpartition("ll")
str.partition("l+", isRegex: true)
str.index("l+", isRegex: true)
str.rindex("ll")

2 * 3
2 ** 3
5.upTo(9) { print($0) }
5.gcd(2)
27.gcd(9)
27.gcd(15)
27.lcm(9)
27.lcm(15)

"abc" <=> "bcd"



