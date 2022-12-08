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

function scenic_score(locNorthSouth::Int, locEastWest::Int, forest)
    treeHeight = forest[locNorthSouth, locEastWest]
    forestSize = size(forest)
    score = [0,0,0,0]
    if locNorthSouth == 1 || locNorthSouth == forestSize[1] || 
        locEastWest == 1 || locEastWest == forestSize[2]
        return 0
    else 
        for i in locEastWest+1:forestSize[2]
            if forest[locNorthSouth,i] < treeHeight
                score[1] += 1
            else
                score[1] += 1
                break
            end
        end
        for i in locEastWest-1:-1:1
            if forest[locNorthSouth,i] < treeHeight
                score[2] += 1
            else
                score[2] += 1
                break
            end
        end
        for i in locNorthSouth+1:forestSize[1]
            if forest[i, locEastWest] < treeHeight
                score[3] += 1
            else
                score[3] += 1
                break
            end
        end
        for i in locNorthSouth-1:-1:1
            if forest[i, locEastWest] < treeHeight
                score[4] += 1
            else
                score[4] += 1
                break
            end
        end
    end
    return prod(score)
end

function solution()
    forest = get_forest("./event8/input.txt")
    forestSize = size(forest)
    return maximum([scenic_score(i,j,forest) for i in 1:forestSize[1] for j in 1:forestSize[2]])
end

solution()