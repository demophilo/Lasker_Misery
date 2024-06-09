module NimModule

export Nim, print_Nims, input_numbers_to_deactivate, input_number_of_rows, generate_Nims, deactivate_some_Nims!


mutable struct Nim
    number::Int
    row::Int
    place::Int
    is_erased::Bool
end

function input_number_of_rows()
    while true
        print("Wie viele Reihen sollen erzeugt werden?")
        _number_of_rows = parse(Int, readline())
        if _number_of_rows in 5:15
            return _number_of_rows
        end
        print("")
    end
    
    
end

function generate_Nims(n::Integer)
    _array_nim::Vector{Vector{Nim}} = []
    for _row in 1:n
        _array_row::Vector{Nim} = []
        for _col in 1:_row
            place_number::Int = _col + _row * (_row - 1) ÷ 2
            push!(_array_row, Nim(place_number, _row, _col, false))
        end
        push!(_array_nim, _array_row)
    end
    return _array_nim
end

function print_Nims(Nims::Vector{Vector{Nim}})
    shift_col = 20
    
    for row in Nims
        print(" "^shift_col)
        shift_col += -1
        for col in row
            if col.is_erased
                print("__", " ")
            else
                print(lpad("$(col.number)",2,), " ")
            end
        end
        println("")
    end
end

function input_first_number(Nims::Vector{Vector{Nim}})
    while true
        print("Gib die erste Zahl der Zahlenreihe, die gelöscht werden soll ein: ")
        _raw_input =  readline()
        
        first_number = parse(Int, _raw_input)
        is_available = first_number ∈ [col.number for row in Nims for col in row if !col.is_erased]
        if is_available
            return first_number
        end
        println("Die Eingabe ist ungültig.")
    end
end

function deactivate_some_Nims!(Nims::Vector{Vector{Nim}}, numbers::Vector{Int})
    for row in Nims
        for col in row
            if col.number in numbers
                col.is_erased = true
            end
        end
    end
    return Nims
end

function get_max_number_in_row(Nims::Vector{Vector{Nim}}, any_number_in_row::Int)
    _max_number::Int = 1
    for row in Nims
        for col in row
            if col.number == any_number_in_row
                _max_number = col.row*(col.row + 1) ÷ 2
            end
        end
    end
    return _max_number
end

function get_possible_numbers(Nims::Vector{Vector{Nim}}, first_number::Int)
    _max_number::Int = get_max_number_in_row(Nims, first_number)
    

    _possible_numbers = [first_number]
    for _number in (first_number + 1):_max_number
        is_available = _number ∈ [col.number for row in Nims for col in row if !col.is_erased]
        if is_available
            push!(_possible_numbers, _number)
        else
            break
        end
    end
    return sort!(_possible_numbers)
end

function input_second_number(Nims::Vector{Vector{Nim}}, first_number::Int)
    _max_number = get_max_number_in_row(Nims, first_number)

   
    _possible_numbers = get_possible_numbers(Nims, first_number)
    _second_number = 0
    while true
        print("Gib eine Zahl von $(first_number) bis $(_possible_numbers[end]) ein: ")
        _second_number = parse(Int, readline())
        if _second_number in _possible_numbers
            _numbers_to_deactivate = [_number for _number in first_number:_second_number]
            return _numbers_to_deactivate
        end
    end
    
end

function input_numbers_to_deactivate(Nims::Vector{Vector{Nim}})
    _first_number = input_first_number(Nims)
    _numbers_to_deactivate = input_second_number(Nims, _first_number)
    return _numbers_to_deactivate
end

end # module


#=
Nims = generate_Nims(6)
print_Nims(Nims)





numbers_to_deactivate = input_numbers_to_deactivate(Nims::Vector{Vector{Nim}})


deactivate_some_Nims!(Nims, numbers_to_deactivate)

print_Nims(Nims)

=#