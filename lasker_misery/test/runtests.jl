
using PlayerModule
using main
using Test
using Base.Mocking

@testset "create_player" begin
    @testset "Mocking readline" begin
        # Mocking `readline` to simulate user input
        io = IOBuffer("Karl\n")
        @mocked readline() = readline(io)  # Mock the readline function
        
        output = create_player()
        @test output.name == "Karl\n"
    end
end
