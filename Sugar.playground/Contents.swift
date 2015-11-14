//: Playground - noun: a place where people can play

import UIKit
import Sugar

let base = "        Hello"
base.ljust(20, padString: "abc")

base.lstrip()

var vbase = base
vbase.lstripInPlace()

base.match("H", offset: 9)?.range.location

base.match("H") {
    let capture1 = base.substringWithRange(base.rangeFromNSRange($0.range)!)
    let capture2 = base[base.rangeFromNSRange($0.range)!]
}
