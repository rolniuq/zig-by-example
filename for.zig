const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    var array = [_]u32{ 1, 2, 3 };

    // iterate over array by value, storing a copy of each element in elem
    // NOTE: that since elem is just a copy, we cannot use it to modify array's contents
    for (array) |elem| {
        print("by val: {}\n", .{elem});
    }

    // interate by reference, we can loop over a slice of array and prefix elem with a *
    // NOTE: elem is pointer to an element in array. which we can modify array contents
    for (&array) |*elem| {
        elem.* += 100;
        print("by ref: {}\n", .{elem.*});
    }

    // interate over multiple sequences
    // NOTE: that both sequences must have the same length
    for (array, &array) |val, *ref| {
        _ = val;
        _ = ref;
    }

    for (0.., array) |i, elem| {
        print("{}: {}\n", .{ i, elem });
    }

    // ignore the elemnts of sequence, use _
    for (array) |_| {}
}
