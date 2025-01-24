// Slices are a special kind of pointer that reference a contigous subset of elements in a sequence.
const std = @import("std");
const print = std.debug.print;

const Slice = []bool;

pub fn main() !void {
    // we define a slice using the [start..end] syntax.
    // slice begin at array[1] and ends just before array[4]
    var array = [5]i32{ 1, 2, 3, 4, 5 };
    const end: usize = 4;
    const slice = array[1..end];

    // get slice length
    print("len: {}\n", .{slice.len});
    // get element in slice
    print("first: {}\n", .{slice[0]});
    // print all elements in slice
    for (slice) |elem| {
        print("elem: .{}\n", .{elem});
    }

    // all slice must have a runtime-known length
    // instead their length are compile-time known
    // their compile will convert the slice into a single item array pointer for us
    const ptr: *[3]i32 = array[1..4];

    print("len: {}\n", .{ptr.len});
    print("first: {}\n", .{ptr[0]});
    for (ptr) |elem| {
        print("elem: {}\n", .{elem});
    }
}
