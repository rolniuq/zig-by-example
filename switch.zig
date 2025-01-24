const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    var x: i18 = 1;

    switch (x) {
        -1...1 => {
            x = -x;
        },
        10, 100 => print("x: {d}\n", .{x}),
        else => {
            print("x else case\n", .{});
        },
    }

    print("x: {d}\n", .{x});
}
