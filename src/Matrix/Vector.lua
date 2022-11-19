-- Vector API

-------------------------------------------------------------------

-- Vector.Create(size, float...) -> vector
-- Vector.Add(vector, vector) -> vector
-- Vector.Subtract(vector, vector) -> vector
-- Vector.Multiply(vector, float) -> vector
-- Vector.Divide(vector, float) -> vector
-- Vector.Dot(vector, vector) -> int
-- Vector.DotWithMatrix(vector, matrix) -> vector

-------------------------------------------------------------------

-- Create a vector object with the given dimensions and values
function Create(size, ...)
    local vector = {}
    vector.size = size
    for i = 1, size do
        vector[i] = select(i, ...)
    end
    return vector
end

-- Add two vectors together
function Add(vector1, vector2)
    -- Check if the vectors can be added
    if vector1.size ~= vector2.size then
        error("Vector sizes do not match, vector1 has " ..
            vector1.size .. " elements and vector2 has " .. vector2.size .. " elements")
    end
    local result = Create(vector1.size)
    for i = 1, vector1.size do
        result[i] = vector1[i] + vector2[i]
    end
    return result
end

-- Subtract two vectors
function Subtract(vector1, vector2)
    -- Check if the vectors can be subtracted
    if vector1.size ~= vector2.size then
        error("Vector sizes do not match, vector1 has " ..
            vector1.size .. " elements and vector2 has " .. vector2.size .. " elements")
    end
    local result = Create(vector1.size)
    for i = 1, vector1.size do
        result[i] = vector1[i] - vector2[i]
    end
    return result
end

-- Multiply a vector by a scalar
function Multiply(vector, scalar)
    local result = Create(vector.size)
    for i = 1, vector.size do
        result[i] = vector[i] * scalar
    end
    return result
end

-- Divide a vector by a scalar
function Divide(vector, scalar)
    local result = Create(vector.size)
    for i = 1, vector.size do
        result[i] = vector[i] / scalar
    end
    return result
end

-- Dot two vectors together
function Dot(vector1, vector2)
    -- Check if the vectors can be dotted
    if vector1.size ~= vector2.size then
        error("Vector sizes do not match, vector1 has " ..
            vector1.size .. " elements and vector2 has " .. vector2.size .. " elements")
    end
    local result = 0
    for i = 1, vector1.size do
        result = result + vector1[i] * vector2[i]
    end
    return result
end

-- Dot a vector with a matrix
function DotWithMatrix(vector, matrix)
    -- Check if the vector and matrix can be multiplied
    if matrix.cols ~= vector.size then
        error("Matrix and vector dimensions do not match, matrix has " ..
            matrix.cols .. " columns and vector has " .. vector.size .. " rows")
    end
    local result = Vector.Create(matrix.rows)
    for i = 1, matrix.rows do
        for j = 1, matrix.cols do
            result[i] = result[i] + matrix[i][j] * vector[j]
        end
    end
    return result
end
