-- Matrix API

-------------------------------------------------------------------

-- Matrix.CreateIdentity(size) -> matrix
-- Matrix.Dot(matrix, matrix) -> matrix
-- Matrix.Translate(matrix4x4, vector3) -> matrix4x4
-- Matrix.Scale(matrix4x4, vector3) -> matrix4x4
-- Matrix.Rotate(matrix4x4, vector3, radian) -> matrix4x4

-------------------------------------------------------------------

-- Create an identity matrix
function CreateIdentity(size)
    local result = {}
    for i = 1, size do
        result[i] = {}
        for j = 1, size do
            result[i][j] = i == j and 1 or 0
        end
    end
    return result
end

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

-- Translate a matrix 4x4 by a vector 3D
function Translate(matrix, vector)
    local translationMatrix = {
        {1, 0, 0, vector[1]},
        {0, 1, 0, vector[2]},
        {0, 0, 1, vector[3]},
        {0, 0, 0, 1}
    }
    return Dot(matrix, translationMatrix)
end

-- Scale a matrix 4x4 by a vector 3D
function Scale(matrix, vector)
    local scaleMatrix = {
        {vector[1], 0, 0, 0},
        {0, vector[2], 0, 0},
        {0, 0, vector[3], 0},
        {0, 0, 0, 1}
    }
    return Dot(matrix, scaleMatrix)
end

-- Rotate a matrix 4x4 by a vector 3D
function Rotate(matrix, vector, radian)
    local x, y, z = vector[1], vector[2], vector[3]
    local c, s = math.cos(radian), math.sin(radian)
    local rotationMatrix = {
        {x * x * (1 - c) + c, x * y * (1 - c) - z * s, x * z * (1 - c) + y * s, 0},
        {y * x * (1 - c) + z * s, y * y * (1 - c) + c, y * z * (1 - c) - x * s, 0},
        {x * z * (1 - c) - y * s, y * z * (1 - c) + x * s, z * z * (1 - c) + c, 0},
        {0, 0, 0, 1}
    }
    return Dot(matrix, rotationMatrix)
end
