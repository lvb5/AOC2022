function gemeinsam(s1, s2)
    for i in s1
        for j in s2
            if i == j
                return i
            end
        end
    end
end

const letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

function sol1()
    score = 0
    open("./event3/input.txt") do f
        for l in eachline(f)
            ll = length(l)
            p1 = SubString(l, 1:Int(ll/2))
            p2 = SubString(l, Int(ll/2)+1:ll)
            score += findfirst(gemeinsam(p1, p2), letters)
        end
    end
    print(score)
end

sol1()