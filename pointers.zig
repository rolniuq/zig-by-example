// Pointers are objects that store a memory address;
const std = @import("std");
const print = std.debug.print;

// Single item pointers point to exactly one value;
const Single = *bool;

// Many items pointers point to an unkown number of values;
const Many = [*]bool;

const Null = ?*bool;

pub fn main() !void {
    // To create a single item pointer, use the & operator
    var v = false;
    const ptr: *bool = &v;
    print("pointer: {}\n", .{ptr});

    // To access the value located at the memory address stored, use the * operator
    ptr.* = true;
    print("value: {}\n", .{ptr.*});

    // If the pointer is const, the value of its pointee can be modified, but the pointer itself cannot be re-assigned
    const const_ptr: *bool = &v;
    const_ptr.* = false;

    // If a pointee is const, its pointer type will reflect that.
    // The value of const pointees cannot be modified, but the pointer itself can be re-assigned
    const cf = false;
    const ct = true;
    var ptr_to_const: *const bool = &cf;
    ptr_to_const = &ct;
}
