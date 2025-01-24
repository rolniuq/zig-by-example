const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    var a: usize = 0;
    var b: usize = 0;
    var c: usize = 0;
    var d: usize = 0;

    // the body will loop until the condition is no longer true
    while (a < 2) {
        print("a: {}\n", .{a});
        a += 1;
    }

    // continue expression can be used to evaluate an expression after each execution of a while loop body
    while (b < 2) : (b += 1) {
        print("b: {}\n", .{b});
    }

    // can specific multiple continue expressions by using the { <exp1>; <exp2>; ... } syntax
    while (c < 4) : ({
        c += 1;
        c += 1;
    }) {
        print("c: {}\n", .{c});
    }

    // to break a while loop use break
    while (true) {
        break;
    }

    // to jump to the next iteration of while loop, use the continue keyword
    while (true) : (d += 1) {
        if (d < 2) {
            print("d: {}\n", .{d});
            continue;
        }

        break;
    }
}
