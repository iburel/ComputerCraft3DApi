-- Utils functions to manipulate images

local colorChar = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"}

function ConvertToArrayOfString(image)
    local colorsLines = {}
    for i = 1, #image do
        local colors = ""
        for j = 1, #image[i] do
            local color = math.floor(image[i][j] + 0.5)
            colors = colors .. colorChar[color]
        end
        colorsLines[i] = colors
    end
    return colorsLines
end

function Display(window, colorsLines, oldColorsLines)
    for i = 1, #colorsLines do
        if oldColorsLines[i] ~= colorsLines[i] then
            local text = ""
            local colorText = ""
            local colors = colorsLines[i]
            for j = 1, #colors do
                text = text .. " "
                colorText = colorText .. "f"
            end
            window.setCursorPos(1, i)
            window.blit(text, colorText, colors)
        end
    end
end
