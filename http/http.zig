// TODO: incorrect code
const std = @import("std");

pub fn main() !void {
    // Create a TCP listener on port 8080
    const listener = try std.net.listen(.{
        .address = .{ .hostname = null, .port = 8080 },
        .reuse_address = true,
    });
    defer listener.close();

    std.log.info("Server running on port 8080...", .{});

    var accept_buf: [1024]u8 = undefined;
    while (true) {
        // Accept an incoming connection
        const conn = try listener.accept();
        defer conn.close();

        // Read the incoming request
        const request_size = try conn.reader().read(&accept_buf);
        const request = accept_buf[0..request_size];

        std.log.info("Received request:\n{any}", .{request});

        // Write an HTTP response
        const response = "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\nHello, Zig!";
        try conn.writer().writeAll(response);
    }
}
