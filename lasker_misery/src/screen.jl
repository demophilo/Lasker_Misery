module screen
export intro, print_colored_string, clear_sreen, title, introduction
title = """
 _            _              ___ _ _       
| |   ___ ___| |_ ___ ___   |   | |_|_____ 
| |__| .'|_ -| '_| -_|  _|  | | | | |     |
|____|__,|___|_,_|___|_|    |_|___|_|_|_|_|
"""
introduction = """Spielanleitung:

Regel 1: Lösche mindestens eine Nummer.
Regel 2: Du kannst eine Serie von Nummern löschen,
         solange sie in einer Reihe sind und unmittelbar aufeinander folgen.
Regel 3: Wer die letzte Nummer löscht hat verloren.
"""
function intro(title::String, introduction::String)
    clear_sreen()
    print_colored_string(title, "blue")
    print("\n"^15)
    print_colored_string(introduction, "yellow")
end



function get_color()
    farben = Dict(
        "red" => "\e[31m",
        "green" => "\e[32m",
        "yellow" => "\e[33m",
        "blue" => "\e[34m",
        "purple" => "\e[35m",
        "lightblue" => "\e[36m",
        "white" => "\e[37m",
        "lightred" => "\e[91m",
        "green2" => "\e[92m",
        "lightyellow" => "\e[93m",
        "lightpurple" => "\e[95m",
        "cyan" => "\e[96m"
    )
    return farben
end

function print_colored_string(text::String, color::String)
    _col = get_color()
    _colored_string = _col["$color"]*"$text"*"\e[0m"
    print(_colored_string)
end

function clear_sreen()
    print("\e[2J")
end
end # module