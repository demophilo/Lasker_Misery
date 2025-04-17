module PlayerModule

export Player, input_Players, create_player

mutable struct Player
    name::String
end

function create_player(num::Int)::Player
    while true
        println("Player$num, wie lautet ihr Name?")
        _player_name = readline()
        if all(isletter, _player_name)
            return Player(_player_name)
        end
    end
end

function input_Players()::Vector{Player}
    players::Vector{Player} = [create_player(num) for num in 1:2]
    return players
end
end # module

