-- Matrix API

-------------------------------------------------------------------

-- Matrix.Create(rows, cols, float...) -> matrix
-- Matrix.Dot(matrix, matrix) -> matrix

-------------------------------------------------------------------

-- Create a matrix object with the given dimensions and values
function Create(rows, cols, ...)
    local matrix = {}
    matrix.rows = rows
    matrix.cols = cols
    for i = 1, rows do
        for j = 1, cols do
            matrix[i][j] = select((i - 1) * cols + j, ...)
        end
    end
    return matrix
end

-- Multiply two matrices together
function Dot(matrix1, matrix2)
    -- Check if the matrices can be multiplied
    if matrix1.cols ~= matrix2.rows then
        error("Matrix dimensions do not match, matrix1 has " ..
            matrix1.cols .. " columns and matrix2 has " .. matrix2.rows .. " rows")
    end
    local result = Create(matrix1.rows, matrix2.cols)
    for i = 1, matrix1.rows do
        for j = 1, matrix2.cols do
            for k = 1, matrix1.cols do
                result[i][j] = result[i][j] + matrix1[i][k] * matrix2[k][j]
            end
        end
    end
    return result
end
