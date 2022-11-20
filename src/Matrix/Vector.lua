-- Vector API

-------------------------------------------------------------------

-- Vector.Add(vector, vector) -> vector
-- Vector.Subtract(vector, vector) -> vector
-- Vector.Multiply(vector, float) -> vector
-- Vector.Divide(vector, float) -> vector
-- Vector.Dot(vector, vector) -> int
-- Vector.DotWithMatrix(vector, matrix) -> vector
-- Vector.DivideByW(vector) -> vector

-------------------------------------------------------------------

-- Add two vectors together
function Add(vector1, vector2)
    local result = {}
    for i = 1, #vector1 do
        result[i] = vector1[i] + vector2[i]
    end
    return result
end

-- Subtract two vectors
function Subtract(vector1, vector2)
    local result = {}
    for i = 1, #vector1 do
        result[i] = vector1[i] - vector2[i]
    end
    return result
end

-- Multiply a vector by a scalar
function Multiply(vector, scalar)
    local result = {}
    for i = 1, #vector do
        result[i] = vector[i] * scalar
    end
    return result
end

-- Divide a vector by a scalar
function Divide(vector, scalar)
    local result = {}
    for i = 1, #vector do
        result[i] = vector[i] / scalar
    end
    return result
end

-- Dot two vectors together
function Dot(vector1, vector2)
    local result = 0
    for i = 1, #vector1 do
        result = result + vector1[i] * vector2[i]
    end
    return result
end

-- Dot a vector with a matrix
function DotWithMatrix(vector, matrix)
    local result = {}
    for i = 1, #matrix do
        for j = 1, #matrix[1] do
            result[i] = result[i] + matrix[i][j] * vector[j]
        end
    end
    return result
end

-- Divide a vector4 by its w component to get a vector3
function DivideByW(vector)
    return { vector[1] / vector[4], vector[2] / vector[4], vector[3] / vector[4] }
end
