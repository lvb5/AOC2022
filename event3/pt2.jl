const letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

function gemeinsam(s1, s2, s3)
    for i in s1
        for j in s2
            for k in s3
                if (i == j) && (j == k)
                    return i
                end
            end
        end
    end
end

function sol2()
    score = 0
    open("./event3/input.txt") do f
        group = [".", ".", "."]
        temp_index = 1
        for l in eachline(f)
            if temp_index == 3
                group[3] = l
                score += findfirst(gemeinsam(group[1], 
                            group[2], group[3]), letters)
                temp_index = 1
            else
                group[temp_index] = l
                temp_index += 1
            end  
        end
    end
    return score
end

sol2()