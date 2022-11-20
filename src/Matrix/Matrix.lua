-- Matrix API

-------------------------------------------------------------------

-- Matrix.Dot(matrix, matrix) -> matrix

-------------------------------------------------------------------

-- Multiply two matrices together
function Dot(matrix1, matrix2)
    local result = {}
    for i = 1, #matrix1 do
        result[i] = {}
        for j = 1, #matrix2[1] do
            local sum = 0
            for k = 1, #matrix1[1] do
                sum = sum + matrix1[i][k] * matrix2[k][j]
            end
            result[i][j] = sum
        end
    end
    return result
end
