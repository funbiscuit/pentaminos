const std = @import("std");

const Allocator = std.mem.Allocator;

const Piece = enum(u8) {
    F,
    I,
    L,
    N,
    P,
    T,
    U,
    V,
    W,
    X,
    Y,
    Z,

    /// board_width - full width of board (with boundaries. so it is 10 for 8x8 square)
    fn putIndexes(self: Piece, arena: Allocator, list: *std.ArrayList([5]usize), board_width: usize) !void {
        const enumVal: usize = @intFromEnum(self) + 1;
        switch (self) {
            Piece.F => {
                try list.append(arena, [5]usize{ enumVal, board_width - 1, board_width, board_width + 1, board_width * 2 + 1 });
                try list.append(arena, [5]usize{ enumVal, 1, board_width - 1, board_width, board_width * 2 });
                try list.append(arena, [5]usize{ enumVal, board_width, board_width + 1, board_width + 2, board_width * 2 + 1 });
                try list.append(arena, [5]usize{ enumVal, board_width, board_width + 1, board_width * 2 - 1, board_width * 2 });
                try list.append(arena, [5]usize{ enumVal, board_width - 2, board_width - 1, board_width, board_width * 2 - 1 });
                try list.append(arena, [5]usize{ enumVal, 1, board_width + 1, board_width + 2, board_width * 2 + 1 });
                try list.append(arena, [5]usize{ enumVal, board_width - 1, board_width, board_width + 1, board_width * 2 - 1 });
                try list.append(arena, [5]usize{ enumVal, board_width - 1, board_width, board_width * 2, board_width * 2 + 1 });
            },
            Piece.I => {
                try list.append(arena, [5]usize{ enumVal, 1, 2, 3, 4 });
                try list.append(arena, [5]usize{ enumVal, board_width, board_width * 2, board_width * 3, board_width * 4 });
            },
            Piece.L => {
                try list.append(arena, [5]usize{ enumVal, board_width, board_width + 1, board_width + 2, board_width + 3 });
                try list.append(arena, [5]usize{ enumVal, board_width, board_width * 2, board_width * 3 - 1, board_width * 3 });
                try list.append(arena, [5]usize{ enumVal, 1, 2, 3, board_width + 3 });
                try list.append(arena, [5]usize{ enumVal, 1, board_width, board_width * 2, board_width * 3 });
                try list.append(arena, [5]usize{ enumVal, 1, board_width + 1, board_width * 2 + 1, board_width * 3 + 1 });
                try list.append(arena, [5]usize{ enumVal, 1, 2, 3, board_width });
                try list.append(arena, [5]usize{ enumVal, board_width, board_width * 2, board_width * 3, board_width * 3 + 1 });
                try list.append(arena, [5]usize{ enumVal, board_width - 3, board_width - 2, board_width - 1, board_width });
            },
            Piece.N => {
                try list.append(arena, [5]usize{ enumVal, 1, board_width - 2, board_width - 1, board_width });
                try list.append(arena, [5]usize{ enumVal, board_width, board_width + 1, board_width * 2 + 1, board_width * 3 + 1 });
                try list.append(arena, [5]usize{ enumVal, 1, 2, board_width - 1, board_width });
                try list.append(arena, [5]usize{ enumVal, board_width, board_width * 2, board_width * 2 + 1, board_width * 3 + 1 });
                try list.append(arena, [5]usize{ enumVal, 1, board_width + 1, board_width + 2, board_width + 3 });
                try list.append(arena, [5]usize{ enumVal, board_width, board_width * 2 - 1, board_width * 2, board_width * 3 - 1 });
                try list.append(arena, [5]usize{ enumVal, 1, 2, board_width + 2, board_width + 3 });
                try list.append(arena, [5]usize{ enumVal, board_width - 1, board_width, board_width * 2 - 1, board_width * 3 - 1 });
            },
            Piece.P => {
                try list.append(arena, [5]usize{ enumVal, 1, board_width, board_width + 1, board_width * 2 + 1 });
                try list.append(arena, [5]usize{ enumVal, 1, 2, board_width, board_width + 1 });
                try list.append(arena, [5]usize{ enumVal, board_width, board_width + 1, board_width * 2, board_width * 2 + 1 });
                try list.append(arena, [5]usize{ enumVal, 1, board_width - 1, board_width, board_width + 1 });
                try list.append(arena, [5]usize{ enumVal, 1, board_width, board_width + 1, board_width + 2 });
                try list.append(arena, [5]usize{ enumVal, board_width - 1, board_width, board_width * 2 - 1, board_width * 2 });
                try list.append(arena, [5]usize{ enumVal, 1, 2, board_width + 1, board_width + 2 });
                try list.append(arena, [5]usize{ enumVal, 1, board_width, board_width + 1, board_width * 2 });
            },
            Piece.T => {
                try list.append(arena, [5]usize{ enumVal, 1, 2, board_width + 1, board_width * 2 + 1 });
                try list.append(arena, [5]usize{ enumVal, board_width - 2, board_width - 1, board_width, board_width * 2 });
                try list.append(arena, [5]usize{ enumVal, board_width, board_width * 2 - 1, board_width * 2, board_width * 2 + 1 });
                try list.append(arena, [5]usize{ enumVal, board_width, board_width + 1, board_width + 2, board_width * 2 });
            },
            Piece.U => {
                try list.append(arena, [5]usize{ enumVal, 1, 2, board_width, board_width + 2 });
                try list.append(arena, [5]usize{ enumVal, 1, board_width + 1, board_width * 2, board_width * 2 + 1 });
                try list.append(arena, [5]usize{ enumVal, 2, board_width, board_width + 1, board_width + 2 });
                try list.append(arena, [5]usize{ enumVal, 1, board_width, board_width * 2, board_width * 2 + 1 });
            },
            Piece.V => {
                try list.append(arena, [5]usize{ enumVal, board_width, board_width * 2, board_width * 2 + 1, board_width * 2 + 2 });
                try list.append(arena, [5]usize{ enumVal, 1, 2, board_width, board_width * 2 });
                try list.append(arena, [5]usize{ enumVal, board_width, board_width * 2 - 2, board_width * 2 - 1, board_width * 2 });
                try list.append(arena, [5]usize{ enumVal, 1, 2, board_width + 2, board_width * 2 + 2 });
            },
            Piece.W => {
                try list.append(arena, [5]usize{ enumVal, board_width, board_width + 1, board_width * 2 + 1, board_width * 2 + 2 });
                try list.append(arena, [5]usize{ enumVal, board_width - 1, board_width, board_width * 2 - 2, board_width * 2 - 1 });
                try list.append(arena, [5]usize{ enumVal, 1, board_width + 1, board_width + 2, board_width * 2 + 2 });
                try list.append(arena, [5]usize{ enumVal, 1, board_width - 1, board_width, board_width * 2 - 1 });
            },
            Piece.X => {
                try list.append(arena, [5]usize{ enumVal, board_width - 1, board_width, board_width + 1, board_width * 2 });
            },
            Piece.Y => {
                try list.append(arena, [5]usize{ enumVal, board_width - 2, board_width - 1, board_width, board_width + 1 });
                try list.append(arena, [5]usize{ enumVal, board_width - 1, board_width, board_width * 2, board_width * 3 });
                try list.append(arena, [5]usize{ enumVal, 1, 2, 3, board_width + 1 });
                try list.append(arena, [5]usize{ enumVal, board_width, board_width * 2, board_width * 2 + 1, board_width * 3 });
                try list.append(arena, [5]usize{ enumVal, 1, 2, 3, board_width + 2 });
                try list.append(arena, [5]usize{ enumVal, board_width, board_width + 1, board_width * 2, board_width * 3 });
                try list.append(arena, [5]usize{ enumVal, board_width - 1, board_width, board_width + 1, board_width + 2 });
                try list.append(arena, [5]usize{ enumVal, board_width, board_width * 2 - 1, board_width * 2, board_width * 3 });
            },
            Piece.Z => {
                try list.append(arena, [5]usize{ enumVal, 1, board_width, board_width * 2 - 1, board_width * 2 });
                try list.append(arena, [5]usize{ enumVal, board_width, board_width + 1, board_width + 2, board_width * 2 + 2 });
                try list.append(arena, [5]usize{ enumVal, 1, board_width + 1, board_width * 2 + 1, board_width * 2 + 2 });
                try list.append(arena, [5]usize{ enumVal, board_width - 2, board_width - 1, board_width, board_width * 2 - 2 });
            },
        }
    }
};

const Game = struct {
    width: usize,
    height: usize,

    board: []i8,
    pieces: std.ArrayList([5]usize),
    piece_used: []bool,
    pieces_left: usize,

    solutions: usize,
    find_all: bool,

    fn init(arena: Allocator, available_pieces: []const Piece, w: usize, h: usize, find_all: bool) !Game {
        const data = try arena.alloc(i8, (w + 2) * (h + 2));
        @memset(data, 0);

        const piece_used = try arena.alloc(bool, @typeInfo(Piece).@"enum".fields.len);
        @memset(piece_used, false);

        for (0..w + 2) |i| {
            data[i] = -1; // top border
            data[(h + 1) * (w + 2) + i] = -1; // bottom border
        }
        for (0..h + 2) |i| {
            data[(w + 2) * i] = -1; // left border
            data[(w + 2) * i + w + 1] = -1; // right border
        }

        var pieces = std.ArrayList([5]usize).empty;
        for (available_pieces) |piece| {
            try piece.putIndexes(arena, &pieces, w + 2);
        }

        return .{
            .width = w,
            .height = h,
            .board = data,
            .pieces = pieces,
            .piece_used = piece_used,
            .solutions = 0,
            .pieces_left = available_pieces.len,
            .find_all = find_all,
        };
    }

    fn firstEmpty(self: Game, start: usize) ?usize {
        if (std.mem.indexOfScalar(i8, self.board[start..], 0)) |idx| {
            return start + idx;
        }
        return null;
    }

    fn play(self: *Game, square: usize) void {
        for (self.pieces.items) |piece| {
            const piece_id = piece[0] - 1;

            if (!self.piece_used[piece_id]) {
                // Try to place the piece
                if (self.putPiece(&piece, square)) {
                    self.piece_used[piece_id] = true;
                    self.pieces_left -= 1;

                    // Check if puzzle is solved
                    if (self.pieces_left == 0) {
                        // Solution found
                        self.solutions += 1;
                        // self.print();
                        if (!self.find_all) {
                            return;
                        }
                    } else {
                        // Find next empty square
                        if (self.firstEmpty(square)) |next_square| {
                            // Recursively try to solve the rest
                            self.play(next_square);
                        }
                    }

                    // Backtrack
                    self.removePiece(&piece, square);
                    self.piece_used[piece_id] = false;
                    self.pieces_left += 1;

                    if (!self.find_all and self.solutions > 0) {
                        return;
                    }
                }
            }
        }
    }

    fn print(self: Game) void {
        std.debug.print("\n ", .{});
        for (0..self.width) |x| {
            std.debug.print(" {X}", .{x});
        }
        std.debug.print("\n", .{});

        for (0..self.height) |y| {
            std.debug.print("{X}", .{y});
            for (0..self.width) |x| {
                const idx = (y + 1) * (self.width + 2) + (x + 1);
                const val = self.board[idx];

                if (val == -1) {
                    std.debug.print(" *", .{});
                } else if (val == 0) {
                    std.debug.print(" .", .{});
                } else {
                    const piece: Piece = @enumFromInt(val - 1);
                    std.debug.print(" {s}", .{@tagName(piece)});
                }
            }
            std.debug.print("\n", .{});
        }
    }

    fn putPiece(self: *Game, piece: []const usize, square: usize) bool {
        // Check if starting square is empty
        if (self.board[square] != 0) {
            return false;
        }

        // Check if all required squares are empty
        for (1..5) |i| {
            if (self.board[square + piece[i]] != 0) {
                return false;
            }
        }

        // Place the piece
        self.board[square] = @intCast(piece[0]);
        for (1..5) |i| {
            self.board[square + piece[i]] = @intCast(piece[0]);
        }

        return true;
    }

    fn removePiece(self: *Game, piece: []const usize, square: usize) void {
        self.board[square] = 0;

        for (1..5) |i| {
            self.board[square + piece[i]] = 0;
        }
    }
};

pub fn main2() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    const pieces_str = "FILNPTUVWXYZ";

    var pieces_array: [12]Piece = undefined;

    for (pieces_str, 0..) |f, i| {
        if (std.meta.stringToEnum(Piece, &[_]u8{f})) |piece| {
            pieces_array[i] = piece;
        } else {
            std.debug.print("Invalid piece: {c}\n", .{f});
            return;
        }
    }

    const pieces = pieces_array[0..pieces_str.len];

    if (pieces.len < 3) {
        std.debug.print("Can't create from {d} pieces. Need at least 3\n", .{pieces.len});
        return;
    }

    var board = try Game.init(allocator, pieces, 5, 12, false);

    std.debug.print("Initial board:\n", .{});
    board.print();

    const start = board.firstEmpty(0).?;

    std.debug.print("\nSolving Pentominos puzzle...\n", .{});
    const start_time = std.time.milliTimestamp();

    board.play(start);

    const end_time = std.time.milliTimestamp();
    const elapsed = end_time - start_time;

    std.debug.print("\nFound {d} solutions in {} ms!\n", .{ board.solutions, elapsed });
}

fn generateCombinations(allocator: std.mem.Allocator, elements: []const u8, k: usize, start: usize, current: *std.ArrayList(u8), result: *std.ArrayList(std.ArrayList(u8))) !void {
    // If we have selected k elements, add the current combination to result
    if (current.items.len == k) {
        var combination = try std.ArrayList(u8).initCapacity(allocator, k);
        combination.appendSliceAssumeCapacity(current.items);
        try result.append(allocator, combination);
        return;
    }

    // Generate combinations by including each possible element
    var i = start;
    while (i < elements.len) : (i += 1) {
        // Add current element to combination
        try current.append(allocator, elements[i]);

        // Recursively generate combinations with remaining elements
        try generateCombinations(allocator, elements, k, i + 1, current, result);

        // Backtrack: remove last element
        _ = current.pop();
    }
}

fn canSolve(arena: Allocator, pieces_str: []const u8) bool {
    var pieces_array: [12]Piece = undefined;

    for (pieces_str, 0..) |f, i| {
        if (std.meta.stringToEnum(Piece, &[_]u8{f})) |piece| {
            pieces_array[i] = piece;
        } else {
            std.debug.print("Invalid piece: {c}\n", .{f});
            return false;
        }
    }

    const pieces = pieces_array[0..pieces_str.len];

    if (pieces.len < 3) {
        std.debug.print("Can't create from {d} pieces. Need at least 3\n", .{pieces.len});
        return false;
    }

    var board = Game.init(arena, pieces, 5, pieces.len, false) catch return false;
    const start = board.firstEmpty(0).?;
    board.play(start);
    return board.solutions > 0;
}

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    // Input: 12 elements
    const elements = "FILNPTUVWXYZ";

    // Generate combinations C(12, 5)
    for (3..12) |k| {
        var current_combination = std.ArrayList(u8).empty;
        var all_combinations = std.ArrayList(std.ArrayList(u8)).empty;

        try generateCombinations(allocator, elements, k, 0, &current_combination, &all_combinations);

        // Print results
        // std.debug.print("Total combinations: {}\n\n", .{all_combinations.items.len});

        var idx: usize = 0;
        for (all_combinations.items) |combination| {
            if (canSolve(allocator, combination.items)) {
                // std.debug.print("Combination {}: ", .{idx + 1});
                for (combination.items) |elem| {
                    std.debug.print("{c} ", .{elem});
                }
                std.debug.print("\n", .{});
                idx += 1;
            }
        }
        // std.debug.print("Combinations with solution: {}\n\n", .{idx});
    }
}
