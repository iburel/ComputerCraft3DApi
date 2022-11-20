-- Tests for vectors operations

os.loadAPI("/Biou3D/src/Matrix/VectorValidationLayer.lua")
Vector = VectorValidationLayer
os.loadAPI("/Biou3D/src/Matrix/MatrixValidationLayer.lua")
Matrix = MatrixValidationLayer

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
    local matrix = {{4}}
    local vector = {1}
    local result = Vector.DotMatrix(matrix, vector)
    assert(result[1] == 4)
end

local function TestVector2DotMatrix()
    local matrix = {
        {1, 2},
        {3, 4}
    }
    local vector = {5, 6}
    local result = Vector.DotMatrix(matrix, vector)
    assert(result[1] == 17)
    assert(result[2] == 39)
end

local function TestVector3DotMatrix()
    local matrix = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    }
    local vector = {10, 11, 12}
    local result = Vector.DotMatrix(matrix, vector)
    assert(result[1] == 68)
    assert(result[2] == 167)
    assert(result[3] == 266)
end

local function TestVector4DotMatrix()
    local matrix = {
        {1, 2, 3, 4},
        {5, 6, 7, 8},
        {9, 10, 11, 12},
        {13, 14, 15, 16}
    }
    local vector = {17, 18, 19, 20}
    local result = Vector.DotMatrix(matrix, vector)
    assert(result[1] == 190)
    assert(result[2] == 486)
    assert(result[3] == 782)
    assert(result[4] == 1078)
end

-- Test Divide by w for vector4
local function TestVector4DivideByW()
    local vector = {1, 2, 3, 4}
    local result = Vector.DivideByW(vector)
    assert(#result == 3)
    assert(result[1] == 0.25)
    assert(result[2] == 0.5)
    assert(result[3] == 0.75)
end

-- Test vector normalization
local function TestVectorNormalize()
    local vector = {1}
    local result = Vector.Normalize(vector)
    assert(result[1] == 1)
end

local function TestVector2Normalize()
    local vector = {1, 2}
    local result = Vector.Normalize(vector)
    assert(result[1] == 0.4472135954999579)
    assert(result[2] == 0.8944271909999159)
end

local function TestVector3Normalize()
    local vector = {1, 2, 3}
    local result = Vector.Normalize(vector)
    assert(result[1] == 0.2672612419124244)
    assert(result[2] == 0.5345224838248488)
    assert(result[3] == 0.8017837257372732)
end

local function TestVector4Normalize()
    local vector = {1, 2, 3, 4}
    local result = Vector.Normalize(vector)
    assert(result[1] == 0.18257418583505536)
    assert(result[2] == 0.3651483716701107)
    assert(result[3] == 0.5477225575051661)
    assert(result[4] == 0.7302967433402214)
end

print("Running matrix tests...")
print("--------------------------------------")

print("TestVectorAddition...")
TestVectorAddition()
print("TestVectorAddition passed!")

print("TestVector2Addition...")
TestVector2Addition()
print("TestVector2Addition passed!")

print("TestVector3Addition...")
TestVector3Addition()
print("TestVector3Addition passed!")

print("TestVector4Addition...")
TestVector4Addition()
print("TestVector4Addition passed!")

print("TestVectorSubtraction...")
TestVectorSubtraction()
print("TestVectorSubtraction passed!")

print("TestVector2Subtraction...")
TestVector2Subtraction()
print("TestVector2Subtraction passed!")

print("TestVector3Subtraction...")
TestVector3Subtraction()
print("TestVector3Subtraction passed!")

print("TestVector4Subtraction...")
TestVector4Subtraction()
print("TestVector4Subtraction passed!")

print("TestVectorMultiplication...")
TestVectorMultiplication()
print("TestVectorMultiplication passed!")

print("TestVector2Multiplication...")
TestVector2Multiplication()
print("TestVector2Multiplication passed!")

print("TestVector3Multiplication...")
TestVector3Multiplication()
print("TestVector3Multiplication passed!")

print("TestVector4Multiplication...")
TestVector4Multiplication()
print("TestVector4Multiplication passed!")

print("TestVectorDivision...")
TestVectorDivision()
print("TestVectorDivision passed!")

print("TestVector2Division...")
TestVector2Division()
print("TestVector2Division passed!")

print("TestVector3Division...")
TestVector3Division()
print("TestVector3Division passed!")

print("TestVector4Division...")
TestVector4Division()
print("TestVector4Division passed!")

print("TestVectorDot...")
TestVectorDot()
print("TestVectorDot passed!")

print("TestVector2Dot...")
TestVector2Dot()
print("TestVector2Dot passed!")

print("TestVector3Dot...")
TestVector3Dot()
print("TestVector3Dot passed!")

print("TestVector4Dot...")
TestVector4Dot()
print("TestVector4Dot passed!")

print("TestVectorDotMatrix...")
TestVectorDotMatrix()
print("TestVectorDotMatrix passed!")

print("TestVector2DotMatrix...")
TestVector2DotMatrix()
print("TestVector2DotMatrix passed!")

print("TestVector3DotMatrix...")
TestVector3DotMatrix()
print("TestVector3DotMatrix passed!")

print("TestVector4DotMatrix...")
TestVector4DotMatrix()
print("TestVector4DotMatrix passed!")

print("TestVector4DivideByW...")
TestVector4DivideByW()
print("TestVector4DivideByW passed!")

print("TestVectorNormalize...")
TestVectorNormalize()
print("TestVectorNormalize passed!")

print("TestVector2Normalize...")
TestVector2Normalize()
print("TestVector2Normalize passed!")

print("TestVector3Normalize...")
TestVector3Normalize()
print("TestVector3Normalize passed!")

print("TestVector4Normalize...")
TestVector4Normalize()
print("TestVector4Normalize passed!")

print("--------------------------------------")
print("Vector tests passed!")
