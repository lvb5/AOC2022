function sol1()
    numFullyContained = 0
    open("./event4/input.txt") do f
        for l in eachline(f)
            range_vals = [parse(Int, split(l, ('-', ','))[i]) for i in 1:4]
            ranges = (range_vals[1]:range_vals[2], range_vals[3]:range_vals[4])
            if issubset(ranges[1], ranges[2]) || issubset(ranges[2], ranges[1])
                numFullyContained += 1
            end
        end
    end
    return numFullyContained
end

sol1()