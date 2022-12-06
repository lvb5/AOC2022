function sol()
    open("./event6/input.txt") do file
        for line in eachline(file)
            for char in eachindex(line)
                startOfMessageMarker = [line[char+i] for i in 0:13]
                if allunique(startOfMessageMarker)
                    return char+13
                end
            end
        end
    end
end

sol()