function get_forest(path::String)
    forest = []
    open(path) do file
        for line in eachline(file)
            lineOfTrees = []
            for digit in eachindex(line)
                push!(lineOfTrees, parse(Int, line[digit]))
            end
            push!(forest, lineOfTrees)
        end
    end
    return [forest[i][j] for i in eachindex(forest), j in eachindex(forest)]
end

function is_visible(locNorthSouth::Int, locEastWest::Int, forest)
    treeHeight = forest[locNorthSouth, locEastWest]
    forestSize = size(forest)
    # check if on edge of forest
    if locNorthSouth == 1 || locNorthSouth == forestSize[1] || 
        locEastWest == 1 || locEastWest == forestSize[2]
        return true
    elseif sum(treeHeight .<= forest[locNorthSouth, locEastWest+1:forestSize[2]]) == 0
        return true
    elseif sum(treeHeight .<= forest[locNorthSouth, locEastWest-1:-1:1]) == 0
        return true
    elseif sum(treeHeight .<= forest[locNorthSouth+1:forestSize[1], locEastWest]) == 0
        return true
    elseif sum(treeHeight .<= forest[locNorthSouth-1:-1:1, locEastWest]) == 0
        return true
    else 
        return false
    end
end

function solution()
    forest = get_forest("./event8/input.txt")
    forestSize = size(forest)
    return sum([is_visible(i,j,forest) for i in 1:forestSize[1] for j in 1:forestSize[2]])
end

solution()