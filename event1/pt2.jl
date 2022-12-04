function solve2()
    sol = [0, 0, 0]
    sol_temp = 0
    open("./event1/elves.txt") do f
        for l in eachline(f)
            if !isempty(l)
                sol_temp += parse(Int, l)
                if sol_temp > sol[1]
                    sol[3] = sol[2]
                    sol[2] = sol[1]
                    sol[1] = sol_temp
                elseif sol_temp > sol[2]
                    sol[3] = sol[2]
                    sol[2] = sol_temp
                elseif sol_temp > sol[3]
                    sol[3] = sol_temp
                end
            else 
                sol_temp = 0
            end
        end
    end
    println(sol)
    println(sum(sol))
end

solve2()