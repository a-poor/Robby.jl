module Robby

import Base.show

mutable struct Robby
    x::Int
    y::Int
end

"""
Data structure holding the state of a game board.
"""
mutable struct Board
    timestep::Int
    robby::Robby
    trash::Matrix{Bool}
end

function newgame(board_width::Int = 10, p_trash::Float64 = 0.2, randomize_pos::Bool = false)
    @assert board_width > 0
    @assert 0. <= p_trash <= 1.
    r = randomize_pos ? Robby(
        rand(1:board_width),
        rand(1:board_width)
    ) : Robby(1,1)
    Board(0,r,
        rand(board_width,board_width) .< p_trash)
end

function show(b::Board)
    N = length(b.trash)
    for i = 0:N
        for j = 0:N
            is_trash = b.trash[i,j]
            is_robby = i == b.robby.x && j == b.robby.y
        end
    end
end

end # module

