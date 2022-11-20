-- Matrix API

-------------------------------------------------------------------

-- Matrix.Dot(matrix, matrix) -> matrix

-------------------------------------------------------------------

-- Multiply two matrices together
function Dot(matrix1, matrix2)
    local result = {}
    for i = 1, #matrix1 do
        for j = 1, #matrix2[1] do
            for k = 1, #matrix1[1] do
                result[i][j] = result[i][j] + matrix1[i][k] * matrix2[k][j]
            end
        end
    end
    return result
end
