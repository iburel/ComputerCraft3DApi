-- Tests for matrix operations

os.loadAPI("/Biou3D/src/Matrix/Matrix.lua")

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

TestMatrix3x3Dot3x3()
TestMatrix2x2Dot2x2()
TestMatrix3x2Dot2x3()
TestMatrix2x3Dot3x2()
