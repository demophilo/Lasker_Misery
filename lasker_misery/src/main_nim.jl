include("screen.jl")
using .screen

include("PlayerModul.jl")
using .PlayerModule

include("Nim.jl")
using .NimModule


intro(title, introduction)
number_of_rows::Int = input_number_of_rows()
remaining_numbers = number_of_rows * (number_of_rows + 1) ÷ 2
players::Vector{Player} = input_Players()

nimst = generate_Nims(number_of_rows)
is_won = false
while !is_won
    print_Nims(nimst)
    for player in players
        println("$(player.name):")
        numbers_to_deactivate = input_numbers_to_deactivate(nimst)
        global remaining_numbers = remaining_numbers - length(numbers_to_deactivate)
        deactivate_some_Nims!(nimst, numbers_to_deactivate)
        print_Nims(nimst)
        global is_won = remaining_numbers == 0
        if is_won
            println("$player hat gewonnen!")
            break
        end
    end
end



