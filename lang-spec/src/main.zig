const std = @import("std");

const values: [3]i32 = [3]i32(1, 2, 3);

const Point = struct {
    x: f32 = 0,
    y: f32 = 0,
};

const Some = struct {
    const Self = @This();

    fn init() Self {
        return Self{};
    }

    fn deinit(self: *Self) void {
        _ = self;
    }

    fn method(self: Self) void {
        _ = self;
    }
};

const point: Point = Point{ .x = 1, .y = 2 };
const func_pointer: *const fn () void = undefined;
const name = "name";

var global: i32 = 0;

// Immutable argument (const)
pub fn Hoge(some: Some) void {
    _ = some;
}

// Mutable argument (Pointer of Object)
pub fn Fuga(some: *Some) void {
    _ = *some;
}

pub fn create_array() [4]f32 {
    return [_]f32{
        0.5,
        0.5,
        0.8,
        1.0,
    };
}

pub fn return_slice() []i32 {
    var array = [4]i32{ 1, 2, 3, 4 };
    var slice: []i32 = &array; // & で slice 化できる
    return slice; // ダングリングポインターになるのでアウト
}

pub fn main() anyerror!void {
    var local = 9;
    _ = local;
    const S = struct {
        var static = 123;
    };
    S.static = 456;

    // Comparision of structs
    // const v = Vec3.init(1, 2, 3);
    // if(std.meta.eql(v, Vec3.init(1, 2, 3)))
    // {
    //     std.debug.print("equal\n", .{});
    // }

    // 文字列の比較
    var text = "text";
    std.mem.eql(u8, text, "text");

    std.log.info("All your codebase are belong to us.", .{});
}

test "basic test" {
    try std.testing.expectEqual(10, 3 + 7);
}
