function sol()
    open("./event6/input.txt") do file
        for line in eachline(file)
            for char in eachindex(line)
                startOfPacketMarker = [line[char+i] for i in 0:3]
                if allunique(startOfPacketMarker)
                    return char+3
                end
            end
        end
    end
end

sol()