function shape_score2(p)
    if p == "R"
        return 1;
    elseif p == "P"
        return 2;
    elseif p == "S"
        return 3;
    end
end

"""
X: loss, Y: draw, Z: win
"""
function win_loss_shape(p1, p2)
    # p1 rock
    if p1 == 'A'
        if p2 == 'X'
            return "S";
        elseif p2 == 'Y'
            return "R";
        elseif p2 == 'Z'
            return "P";
        end
    # p1 paper
    elseif p1 == 'B'
        if p2 == 'X'
            return "R";
        elseif p2 == 'Y'
            return "P";
        elseif p2 == 'Z'
            return "S";
        end
    #p2 scissors
    elseif p1 == 'C'
        if p2 == 'X'
            return "P";
        elseif p2 == 'Y'
            return "S";
        elseif p2 == 'Z'
            return "R";
        end
    end
end

function win_loss_score(p1,p2)
    turn_score = 0;
    if p2 == 'Y'
        turn_score += 3
    elseif p2 == 'Z'
        turn_score += 6
    end
    turn_score += shape_score2(win_loss_shape(p1,p2))
    return turn_score
end

function solve2()
    tot_score = 0
    open("./event2/rps.txt") do f
        for l in eachline(f)
            tot_score += win_loss_score(l[1], l[3])
        end
    end
    print(tot_score) 
end

solve2()