-- Utils functions to manipulate images

local colorChar = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"}

function Display(window, image)
    for i = 1, #image do
        window.setCursorPos(1, i)
        local str = ""
        local textColor = ""
        local backgroundColor = ""
        for j = 1, #image[i] do
            str = str .. " "
            textColor = textColor .. "f"
            local color = math.floor(image[i][j] + 0.5)
            backgroundColor = backgroundColor .. colorChar[color]
        end
        window.blit(str, textColor, backgroundColor)
    end
end
