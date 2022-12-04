#=
A / X : rock, B / Y : paper, C / Z : scissors
=#

"""
Rock gets one points, paper two, scissors three
"""
function shape_score(shape)
    if shape == 'A' || shape == 'X'
        return 1
    elseif shape == 'B' || shape == 'Y'
        return 2
    elseif shape == 'C' || shape == 'Z'
        return 3
    end
end

"""
Win get six, draw gets three, lose gets zero
"""
function win_loss(p1, p2)
    if p1 == 'A'
        if p2 == 'X'
            return 3;
        elseif p2 == 'Y'
            return 6;
        elseif p2 == 'Z'
            return 0;
        end
    elseif p1 == 'B'
        if p2 == 'X'
            return 0;
        elseif p2 == 'Y'
            return 3;
        elseif p2 == 'Z'
            return 6;
        end
    elseif p1 == 'C'
        if p2 == 'X'
            return 6;
        elseif p2 == 'Y'
            return 0;
        elseif p2 == 'Z'
            return 3;
        end
    end
end

function solve1()
    tot_score = 0
    open("./event2/rps.txt") do f
        for l in eachline(f)
            tot_score += (shape_score(l[3]) + win_loss(l[1],l[3]))
        end
    end
    print(tot_score)
end

solve1()