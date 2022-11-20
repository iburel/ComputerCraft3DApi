-- Tests for vectors operations

os.loadAPI("/Biou3D/src/Matrix/Vector.lua")
os.loadAPI("/Biou3D/src/Matrix/Matrix.lua")

-- Test vector addition
local function TestVectorAddition()
    local vector1 = {1}
    local vector2 = {4}
    local result = Vector.Add(vector1, vector2)
    assert(result[1] == 5)
end

local function TestVector2Addition()
    local vector1 = {1, 2}
    local vector2 = {3, 4}
    local result = Vector.Add(vector1, vector2)
    assert(result[1] == 4)
    assert(result[2] == 6)
end

local function TestVector3Addition()
    local vector1 = {1, 2, 3}
    local vector2 = {4, 5, 6}
    local result = Vector.Add(vector1, vector2)
    assert(result[1] == 5)
    assert(result[2] == 7)
    assert(result[3] == 9)
end

local function TestVector4Addition()
    local vector1 = {1, 2, 3, 4}
    local vector2 = {5, 6, 7, 8}
    local result = Vector.Add(vector1, vector2)
    assert(result[1] == 6)
    assert(result[2] == 8)
    assert(result[3] == 10)
    assert(result[4] == 12)
end

-- Test vector subtraction
local function TestVectorSubtraction()
    local vector1 = {1}
    local vector2 = {4}
    local result = Vector.Subtract(vector1, vector2)
    assert(result[1] == -3)
end

local function TestVector2Subtraction()
    local vector1 = {1, 2}
    local vector2 = {3, 4}
    local result = Vector.Subtract(vector1, vector2)
    assert(result[1] == -2)
    assert(result[2] == -2)
end

local function TestVector3Subtraction()
    local vector1 = {1, 2, 3}
    local vector2 = {4, 5, 6}
    local result = Vector.Subtract(vector1, vector2)
    assert(result[1] == -3)
    assert(result[2] == -3)
    assert(result[3] == -3)
end

local function TestVector4Subtraction()
    local vector1 = {1, 2, 3, 4}
    local vector2 = {5, 6, 7, 8}
    local result = Vector.Subtract(vector1, vector2)
    assert(result[1] == -4)
    assert(result[2] == -4)
    assert(result[3] == -4)
    assert(result[4] == -4)
end

-- Test vector multiplication
local function TestVectorMultiplication()
    local vector1 = {1}
    local vector2 = {4}
    local result = Vector.Multiply(vector1, vector2)
    assert(result[1] == 4)
end

local function TestVector2Multiplication()
    local vector1 = {1, 2}
    local vector2 = {3, 4}
    local result = Vector.Multiply(vector1, vector2)
    assert(result[1] == 3)
    assert(result[2] == 8)
end

local function TestVector3Multiplication()
    local vector1 = {1, 2, 3}
    local vector2 = {4, 5, 6}
    local result = Vector.Multiply(vector1, vector2)
    assert(result[1] == 4)
    assert(result[2] == 10)
    assert(result[3] == 18)
end

local function TestVector4Multiplication()
    local vector1 = {1, 2, 3, 4}
    local vector2 = {5, 6, 7, 8}
    local result = Vector.Multiply(vector1, vector2)
    assert(result[1] == 5)
    assert(result[2] == 12)
    assert(result[3] == 21)
    assert(result[4] == 32)
end

-- Test vector division
local function TestVectorDivision()
    local vector1 = {1}
    local vector2 = {4}
    local result = Vector.Divide(vector1, vector2)
    assert(result[1] == 0.25)
end

local function TestVector2Division()
    local vector1 = {1, 2}
    local vector2 = {3, 4}
    local result = Vector.Divide(vector1, vector2)
    assert(result[1] == 0.3333333333333333)
    assert(result[2] == 0.5)
end

local function TestVector3Division()
    local vector1 = {1, 2, 3}
    local vector2 = {4, 5, 6}
    local result = Vector.Divide(vector1, vector2)
    assert(result[1] == 0.25)
    assert(result[2] == 0.4)
    assert(result[3] == 0.5)
end

local function TestVector4Division()
    local vector1 = {1, 2, 3, 4}
    local vector2 = {5, 6, 7, 8}
    local result = Vector.Divide(vector1, vector2)
    assert(result[1] == 0.2)
    assert(result[2] == 0.3333333333333333)
    assert(result[3] == 0.42857142857142855)
    assert(result[4] == 0.5)
end

-- Test vector dot product
local function TestVectorDot()
    local vector1 = {1}
    local vector2 = {4}
    local result = Vector.Dot(vector1, vector2)
    assert(result == 4)
end

local function TestVector2Dot()
    local vector1 = {1, 2}
    local vector2 = {3, 4}
    local result = Vector.Dot(vector1, vector2)
    assert(result == 11)
end

local function TestVector3Dot()
    local vector1 = {1, 2, 3}
    local vector2 = {4, 5, 6}
    local result = Vector.Dot(vector1, vector2)
    assert(result == 32)
end

local function TestVector4Dot()
    local vector1 = {1, 2, 3, 4}
    local vector2 = {5, 6, 7, 8}
    local result = Vector.Dot(vector1, vector2)
    assert(result == 70)
end

-- Test vector dot with matrix
local function TestVectorDotMatrix()
    local vector = {1}
    local matrix = {{4}}
    local result = Vector.DotMatrix(vector, matrix)
    assert(result[1] == 4)
end

local function TestVector2DotMatrix()
    local vector = {1, 2}
    local matrix = {
        {3, 4},
        {5, 6}
    }
    local result = Vector.Dot(vector, matrix)
    assert(result[1] == 13)
    assert(result[2] == 16)
end

local function TestVector3DotMatrix()
    local vector = {1, 2, 3}
    local matrix = {
        {4, 5, 6},
        {7, 8, 9},
        {10, 11, 12}
    }
    local result = Vector.Dot(vector, matrix)
    assert(result[1] == 58)
    assert(result[2] == 64)
    assert(result[3] == 70)
end

local function TestVector4DotMatrix()
    local vector = {1, 2, 3, 4}
    local matrix = {
        {5, 6, 7, 8},
        {9, 10, 11, 12},
        {13, 14, 15, 16},
        {17, 18, 19, 20}
    }
    local result = Vector.Dot(vector, matrix)
    assert(result[1] == 250)
    assert(result[2] == 260)
    assert(result[3] == 270)
    assert(result[4] == 280)
end

TestVectorAddition()
TestVector2Addition()
TestVector3Addition()
TestVector4Addition()
TestVectorSubtraction()
TestVector2Subtraction()
TestVector3Subtraction()
TestVector4Subtraction()
TestVectorMultiplication()
TestVector2Multiplication()
TestVector3Multiplication()
TestVector4Multiplication()
TestVectorDivision()
TestVector2Division()
TestVector3Division()
TestVector4Division()
TestVectorDot()
TestVector2Dot()
TestVector3Dot()
TestVector4Dot()
TestVectorDotMatrix()
TestVector2DotMatrix()
TestVector3DotMatrix()
TestVector4DotMatrix()
