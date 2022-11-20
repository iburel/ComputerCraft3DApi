-- Vector API

-------------------------------------------------------------------

-- Vector.Add(vector, vector) -> vector
-- Vector.Subtract(vector, vector) -> vector
-- Vector.Multiply(vector, vector) -> vector
-- Vector.Divide(vector, vector) -> vector
-- Vector.MultiplyByScalar(vector, float) -> vector
-- Vector.DivideByScalar(vector, float) -> vector
-- Vector.Dot(vector, vector) -> int
-- Vector.DotMatrix(matrix, vector) -> vector
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

-- Multiply two vectors together
function Multiply(vector1, vector2)
    local result = {}
    for i = 1, #vector1 do
        result[i] = vector1[i] * vector2[i]
    end
    return result
end

-- Divide two vectors
function Divide(vector1, vector2)
    local result = {}
    for i = 1, #vector1 do
        result[i] = vector1[i] / vector2[i]
    end
    return result
end

-- Multiply a vector by a scalar
function MultiplyByScalar(vector, scalar)
    local result = {}
    for i = 1, #vector do
        result[i] = vector[i] * scalar
    end
    return result
end

-- Divide a vector by a scalar
function DivideByScalar(vector, scalar)
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

-- Dot a matrix with a vector
function DotMatrix(matrix, vector)
    local result = {}
    for i = 1, #matrix do
        local sum = 0
        for j = 1, #matrix[1] do
            sum = sum + matrix[i][j] * vector[j]
        end
        result[i] = sum
    end
    return result
end

-- Divide a vector4 by its w component to get a vector3
function DivideByW(vector)
    return { vector[1] / vector[4], vector[2] / vector[4], vector[3] / vector[4] }
end
