const std = @import("std");

pub fn build(b: *std.Build) void {
    // Options

    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Library

    _ = b.addModule("zlm", .{
        .root_source_file = b.path("src/zlm.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Testing

    const lib_tests = b.addTest(.{
        .root_source_file = b.path("src/test.zig"),
        .target = target,
        .optimize = optimize,
    });

    const run_unit_tests = b.addRunArtifact(lib_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_unit_tests.step);
}
