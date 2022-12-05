## use push! and pop! or deleteat! to change arrays

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
    numBoxes = 0
    fromColumn = 0
    toColumn = 0
    for character in eachindex(line)
        if line[character] == 'e'
            digitNumBoxesString = ""
            characterTemp = character+2
            while line[characterTemp] != ' '
                digitNumBoxesString *= line[characterTemp]
                characterTemp += 1
            end
            numBoxes = parse(Int, digitNumBoxesString)
        end
        if line[character] == 'r'
            digitFromColumnString = ""
            characterTemp = character+4
            while line[characterTemp] != ' '
                digitFromColumnString *= line[characterTemp]
                characterTemp += 1
            end
            fromColumn = parse(Int, digitFromColumnString)
        end
        if line[character] == 't'
            digitToColumnString = ""
            characterTemp = character+3
            for i in characterTemp:length(line)
                digitToColumnString *= line[characterTemp]
            end
            toColumn = parse(Int, digitToColumnString)
        end
    end
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
    boxSetUp = [[] for _ in 1:9] 
    open("./event5/input.txt") do file
        for line in eachline(file)
            if !isempty(line) && line[1] == 'm'
                numBoxes, fromColumn, toColumn = read_move_input(line)
                boxSetUp = move_box_keeporder!(boxSetUp, numBoxes, fromColumn, toColumn)
            elseif !isempty(line) && line[2] != '1' && line[1] != 'm'
                referenceNumLine = " 1   2   3   4   5   6   7   8   9"  
                boxSetUp = initial_stack_boxes(boxSetUp, line, referenceNumLine)        
            end
        end
    end
    outputString = ""
    for i in 1:9
        outputString *= boxSetUp[i][1]
    end
    return outputString
end

sol()