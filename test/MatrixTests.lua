-- Tests for matrix operations

os.loadAPI("/Biou3D/src/Matrix/MatrixValidationLayer.lua")
Matrix = MatrixValidationLayer

-- Test identity matrix creation
local function TestIdentityMatrix1x1Creation()
    local identity = Matrix.CreateIdentity(1)
    assert(identity[1][1] == 1)
end

local function TestIdentityMatrix2x2Creation()
    local identity = Matrix.CreateIdentity(2)
    assert(identity[1][1] == 1)
    assert(identity[1][2] == 0)
    assert(identity[2][1] == 0)
    assert(identity[2][2] == 1)
end

local function TestIdentityMatrix3x3Creation()
    local identity = Matrix.CreateIdentity(3)
    assert(identity[1][1] == 1)
    assert(identity[1][2] == 0)
    assert(identity[1][3] == 0)
    assert(identity[2][1] == 0)
    assert(identity[2][2] == 1)
    assert(identity[2][3] == 0)
    assert(identity[3][1] == 0)
    assert(identity[3][2] == 0)
    assert(identity[3][3] == 1)
end

local function TestIdentityMatrix4x4Creation()
    local identity = Matrix.CreateIdentity(4)
    assert(identity[1][1] == 1)
    assert(identity[1][2] == 0)
    assert(identity[1][3] == 0)
    assert(identity[1][4] == 0)
    assert(identity[2][1] == 0)
    assert(identity[2][2] == 1)
    assert(identity[2][3] == 0)
    assert(identity[2][4] == 0)
    assert(identity[3][1] == 0)
    assert(identity[3][2] == 0)
    assert(identity[3][3] == 1)
    assert(identity[3][4] == 0)
    assert(identity[4][1] == 0)
    assert(identity[4][2] == 0)
    assert(identity[4][3] == 0)
    assert(identity[4][4] == 1)
end

-- Test matrix dot
local function TestMatrix3x3Dot3x3()
    local matrix1 = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    }
    local matrix2 = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    }
    local result = Matrix.Dot(matrix1, matrix2)
    assert(result[1][1] == 30)
    assert(result[1][2] == 36)
    assert(result[1][3] == 42)
    assert(result[2][1] == 66)
    assert(result[2][2] == 81)
    assert(result[2][3] == 96)
    assert(result[3][1] == 102)
    assert(result[3][2] == 126)
    assert(result[3][3] == 150)
end

local function TestMatrix2x2Dot2x2()
    local matrix1 = {
        {1, 2},
        {3, 4}
    }
    local matrix2 = {
        {5, 6},
        {7, 8}
    }
    local result = Matrix.Dot(matrix1, matrix2)
    assert(result[1][1] == 19)
    assert(result[1][2] == 22)
    assert(result[2][1] == 43)
    assert(result[2][2] == 50)
end

local function TestMatrix3x2Dot2x3()
    local matrix1 = {
        {1, 2, 3},
        {4, 5, 6}
    }
    local matrix2 = {
        {7, 8},
        {9, 10},
        {11, 12}
    }
    local result = Matrix.Dot(matrix1, matrix2)
    assert(result[1][1] == 58)
    assert(result[1][2] == 64)
    assert(result[2][1] == 139)
    assert(result[2][2] == 154)
end

local function TestMatrix2x3Dot3x2()
    local matrix1 = {
        {1, 2},
        {3, 4},
        {5, 6}
    }
    local matrix2 = {
        {7, 8, 9},
        {10, 11, 12}
    }
    local result = Matrix.Dot(matrix1, matrix2)
    assert(result[1][1] == 27)
    assert(result[1][2] == 30)
    assert(result[1][3] == 33)
    assert(result[2][1] == 61)
    assert(result[2][2] == 68)
    assert(result[2][3] == 75)
end

-- Test matrix translate
local function TestMatrix4x4Translate()
    local matrix = Matrix.CreateIdentity(4)
    local translation = { 1, 2, 3}
    local result = Matrix.Translate(matrix, translation)
    assert(result[1][1] == 1)
    assert(result[1][2] == 0)
    assert(result[1][3] == 0)
    assert(result[1][4] == 1)
    assert(result[2][1] == 0)
    assert(result[2][2] == 1)
    assert(result[2][3] == 0)
    assert(result[2][4] == 2)
    assert(result[3][1] == 0)
    assert(result[3][2] == 0)
    assert(result[3][3] == 1)
    assert(result[3][4] == 3)
    assert(result[4][1] == 0)
    assert(result[4][2] == 0)
    assert(result[4][3] == 0)
    assert(result[4][4] == 1)
end

-- Test matrix scale
local function TestMatrix4x4Scale()
    local matrix = Matrix.CreateIdentity(4)
    local scale = { 1, 2, 3 }
    local result = Matrix.Scale(matrix, scale)
    assert(result[1][1] == 1)
    assert(result[1][2] == 0)
    assert(result[1][3] == 0)
    assert(result[1][4] == 0)
    assert(result[2][1] == 0)
    assert(result[2][2] == 2)
    assert(result[2][3] == 0)
    assert(result[2][4] == 0)
    assert(result[3][1] == 0)
    assert(result[3][2] == 0)
    assert(result[3][3] == 3)
    assert(result[3][4] == 0)
    assert(result[4][1] == 0)
    assert(result[4][2] == 0)
    assert(result[4][3] == 0)
    assert(result[4][4] == 1)
end

-- Test matrix rotate (check at 0.0001 precision)
local function TestMatrix4x4RotatePi()
    local matrix = Matrix.CreateIdentity(4)
    local rotation = { 0, 0, 1 }
    local result = Matrix.Rotate(matrix, rotation, math.pi)
    assert(math.abs(result[1][1] - -1) < 0.0001)
    assert(math.abs(result[1][2] - 0) < 0.0001)
    assert(math.abs(result[1][3] - 0) < 0.0001)
    assert(math.abs(result[1][4] - 0) < 0.0001)
    assert(math.abs(result[2][1] - 0) < 0.0001)
    assert(math.abs(result[2][2] - -1) < 0.0001)
    assert(math.abs(result[2][3] - 0) < 0.0001)
    assert(math.abs(result[2][4] - 0) < 0.0001)
    assert(math.abs(result[3][1] - 0) < 0.0001)
    assert(math.abs(result[3][2] - 0) < 0.0001)
    assert(math.abs(result[3][3] - 1) < 0.0001)
    assert(math.abs(result[3][4] - 0) < 0.0001)
    assert(math.abs(result[4][1] - 0) < 0.0001)
    assert(math.abs(result[4][2] - 0) < 0.0001)
    assert(math.abs(result[4][3] - 0) < 0.0001)
    assert(math.abs(result[4][4] - 1) < 0.0001)
end


print("Running matrix tests...")
print("--------------------------------------")

print("TestIdentityMatrix1x1Creation...")
TestIdentityMatrix1x1Creation()
print("TestIdentityMatrix1x1Creation passed!")

print("TestIdentityMatrix2x2Creation...")
TestIdentityMatrix2x2Creation()
print("TestIdentityMatrix2x2Creation passed!")

print("TestIdentityMatrix3x3Creation...")
TestIdentityMatrix3x3Creation()
print("TestIdentityMatrix3x3Creation passed!")

print("TestIdentityMatrix4x4Creation...")
TestIdentityMatrix4x4Creation()
print("TestIdentityMatrix4x4Creation passed!")

print("TestMatrix3x3Dot3x3...")
TestMatrix3x3Dot3x3()
print("TestMatrix3x3Dot3x3 passed!")

print("TestMatrix2x2Dot2x2...")
TestMatrix2x2Dot2x2()
print("TestMatrix2x2Dot2x2 passed!")

print("TestMatrix3x2Dot2x3...")
TestMatrix3x2Dot2x3()
print("TestMatrix3x2Dot2x3 passed!")

print("TestMatrix2x3Dot3x2...")
TestMatrix2x3Dot3x2()
print("TestMatrix2x3Dot3x2 passed!")

print("TestMatrix4x4Translate...")
TestMatrix4x4Translate()
print("TestMatrix4x4Translate passed!")

print("TestMatrix4x4Scale...")
TestMatrix4x4Scale()
print("TestMatrix4x4Scale passed!")

print("TestMatrix4x4Rotate...")
TestMatrix4x4RotatePi()
print("TestMatrix4x4Rotate passed!")

print("--------------------------------------")
print("Matrix tests passed!")
