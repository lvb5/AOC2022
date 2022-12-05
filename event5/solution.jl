
function num_stack(characterNum, referenceNumLine)
    for i in eachindex(referenceNumLine)
        if referenceNumLine[i] != ' ' && characterNum == i
            return parse(Int, referenceNumLine[i])
        end
    end
end

function initial_stack_boxes(currentSetup, line, referenceNumLine)
    for character in eachindex(line)
        if line[character] != ' ' && line[character] != '[' && line[character] != ']'
            push!(currentSetup[num_stack(character, referenceNumLine)], line[character])
        end
    end
    return currentSetup
end

function read_move_input(line::String)
    numBoxes, fromColumn, toColumn = [parse(Int, m.match) for m in eachmatch(r"\d+", line)]
    return numBoxes, fromColumn, toColumn
end

function move_box!(boxSetUp, numBoxes, fromColumn, toColumn)
    counter = 0
    while counter < numBoxes
        pushfirst!(boxSetUp[toColumn], boxSetUp[fromColumn][1])
        deleteat!(boxSetUp[fromColumn], 1)
        counter += 1
    end
    return boxSetUp
end

function move_box_keeporder!(boxSetUp, numBoxes, fromColumn, toColumn)
    prepend!(boxSetUp[toColumn], boxSetUp[fromColumn][1:numBoxes])
    deleteat!(boxSetUp[fromColumn], 1:numBoxes)
    return boxSetUp
end

function sol()
    boxSetUp1 = [[] for _ in 1:9] 
    boxSetUp2 = [[] for _ in 1:9] 
    open("./event5/input.txt") do file
        for line in eachline(file)
            if !isempty(line) && line[1] == 'm'
                numBoxes, fromColumn, toColumn = read_move_input(line)
                boxSetUp1 = move_box!(boxSetUp1, numBoxes, fromColumn, toColumn)
                boxSetUp2 = move_box_keeporder!(boxSetUp2, numBoxes, fromColumn, toColumn)
            elseif !isempty(line) && line[2] != '1' && line[1] != 'm'
                referenceNumLine = " 1   2   3   4   5   6   7   8   9"  
                boxSetUp1 = initial_stack_boxes(boxSetUp1, line, referenceNumLine)      
                boxSetUp2 = initial_stack_boxes(boxSetUp2, line, referenceNumLine) 
            end
        end
    end
    outputString1 = ""
    outputString2 = ""
    for i in 1:9
        outputString1 *= boxSetUp1[i][1]
        outputString2 *= boxSetUp2[i][1]
    end
    return outputString1, outputString2
end

sol()