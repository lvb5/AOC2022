function solve1()
    sol = 0
    sol_temp = 0
    open("./event1/elves.txt") do f
        for l in eachline(f)
            if !isempty(l)
                sol_temp += parse(Int, l)
                if sol_temp > sol
                    sol = sol_temp
                end
            else 
                sol_temp = 0
            end
        end
    end
    println(sol)
end

solve1()