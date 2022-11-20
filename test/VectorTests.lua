-- Tests for vectors operations

os.loadAPI("../src/Matrix/Vector.lua")
os.loadAPI("../src/Matrix/Vector2.lua")
os.loadAPI("../src/Matrix/Vector3.lua")
os.loadAPI("../src/Matrix/Vector4.lua")

os.loadAPI("../src/Matrix/Matrix.lua")
os.loadAPI("../src/Matrix/Matrix2.lua")
os.loadAPI("../src/Matrix/Matrix3.lua")
os.loadAPI("../src/Matrix/Matrix4.lua")

-- Test vector creation
local function TestVectorCreation()
    for i = 1, 10 do
        local v = Vector.Create(i, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
        assert(v.size == i, "Vector size is incorrect")
        for j = 1, i do
            assert(v[j] == j, "Vector value is incorrect")
        end
        assert(v[i + 1] == nil, "Vector unexpected value")
    end
end

local function TestVector2Creation()
    for i = 1, 10 do
        local v = Vector2.Create(i, i + 1)
        assert(v.size == 2, "Vector2 size is incorrect")
        assert(v[1] == i, "Vector2 value is incorrect")
        assert(v[2] == i + 1, "Vector2 value is incorrect")
        assert(v[3] == nil, "Vector2 unexpected value")
    end
end

local function TestVector3Creation()
    for i = 1, 10 do
        local v = Vector3.Create(i, i + 1, i + 2)
        assert(v.size == 3, "Vector3 size is incorrect")
        assert(v[1] == i, "Vector3 value is incorrect")
        assert(v[2] == i + 1, "Vector3 value is incorrect")
        assert(v[3] == i + 2, "Vector3 value is incorrect")
        assert(v[4] == nil, "Vector3 unexpected value")
    end
end

local function TestVector4Creation()
    for i = 1, 10 do
        local v = Vector4.Create(i, i + 1, i + 2, i + 3)
        assert(v.size == 4, "Vector4 size is incorrect")
        assert(v[1] == i, "Vector4 value is incorrect")
        assert(v[2] == i + 1, "Vector4 value is incorrect")
        assert(v[3] == i + 2, "Vector4 value is incorrect")
        assert(v[4] == i + 3, "Vector4 value is incorrect")
        assert(v[5] == nil, "Vector4 unexpected value")
    end
end

-- Test vector addition
local function TestVectorAddition()
    for i = 1, 10 do
        local v1 = Vector.Create(i, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
        local v2 = Vector.Create(i, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
        local v3 = Vector.Add(v1, v2)
        assert(v3.size == i, "Vector size is incorrect")
        for j = 1, i do
            assert(v3[j] == j + 10, "Vector value is incorrect")
        end
        assert(v3[i + 1] == nil, "Vector unexpected value")
    end
end

local function TestVector2Addition()
    for i = 1, 10 do
        local v1 = Vector2.Create(i, i + 1)
        local v2 = Vector2.Create(i + 10, i + 11)
        local v3 = Vector2.Add(v1, v2)
        assert(v3.size == 2, "Vector2 size is incorrect")
        assert(v3[1] == i + 10, "Vector2 value is incorrect")
        assert(v3[2] == i + 12, "Vector2 value is incorrect")
        assert(v3[3] == nil, "Vector2 unexpected value")
    end
end

local function TestVector3Addition()
    for i = 1, 10 do
        local v1 = Vector3.Create(i, i + 1, i + 2)
        local v2 = Vector3.Create(i + 10, i + 11, i + 12)
        local v3 = Vector3.Add(v1, v2)
        assert(v3.size == 3, "Vector3 size is incorrect")
        assert(v3[1] == i + 10, "Vector3 value is incorrect")
        assert(v3[2] == i + 12, "Vector3 value is incorrect")
        assert(v3[3] == i + 14, "Vector3 value is incorrect")
        assert(v3[4] == nil, "Vector3 unexpected value")
    end
end

local function TestVector4Addition()
    for i = 1, 10 do
        local v1 = Vector4.Create(i, i + 1, i + 2, i + 3)
        local v2 = Vector4.Create(i + 10, i + 11, i + 12, i + 13)
        local v3 = Vector4.Add(v1, v2)
        assert(v3.size == 4, "Vector4 size is incorrect")
        assert(v3[1] == i + 10, "Vector4 value is incorrect")
        assert(v3[2] == i + 12, "Vector4 value is incorrect")
        assert(v3[3] == i + 14, "Vector4 value is incorrect")
        assert(v3[4] == i + 16, "Vector4 value is incorrect")
        assert(v3[5] == nil, "Vector4 unexpected value")
    end
end

-- Test vector subtraction
local function TestVectorSubtraction()
    for i = 1, 10 do
        local v1 = Vector.Create(i, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
        local v2 = Vector.Create(i, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
        local v3 = Vector.Subtract(v1, v2)
        assert(v3.size == i, "Vector size is incorrect")
        for j = 1, i do
            assert(v3[j] == j - 10, "Vector value is incorrect")
        end
        assert(v3[i + 1] == nil, "Vector unexpected value")
    end
end

local function TestVector2Subtraction()
    for i = 1, 10 do
        local v1 = Vector2.Create(i, i + 1)
        local v2 = Vector2.Create(i + 10, i + 11)
        local v3 = Vector2.Subtract(v1, v2)
        assert(v3.size == 2, "Vector2 size is incorrect")
        assert(v3[1] == i - 10, "Vector2 value is incorrect")
        assert(v3[2] == i - 10, "Vector2 value is incorrect")
        assert(v3[3] == nil, "Vector2 unexpected value")
    end
end

local function TestVector3Subtraction()
    for i = 1, 10 do
        local v1 = Vector3.Create(i, i + 1, i + 2)
        local v2 = Vector3.Create(i + 10, i + 11, i + 12)
        local v3 = Vector3.Subtract(v1, v2)
        assert(v3.size == 3, "Vector3 size is incorrect")
        assert(v3[1] == i - 10, "Vector3 value is incorrect")
        assert(v3[2] == i - 10, "Vector3 value is incorrect")
        assert(v3[3] == i - 10, "Vector3 value is incorrect")
        assert(v3[4] == nil, "Vector3 unexpected value")
    end
end

local function TestVector4Subtraction()
    for i = 1, 10 do
        local v1 = Vector4.Create(i, i + 1, i + 2, i + 3)
        local v2 = Vector4.Create(i + 10, i + 11, i + 12, i + 13)
        local v3 = Vector4.Subtract(v1, v2)
        assert(v3.size == 4, "Vector4 size is incorrect")
        assert(v3[1] == i - 10, "Vector4 value is incorrect")
        assert(v3[2] == i - 10, "Vector4 value is incorrect")
        assert(v3[3] == i - 10, "Vector4 value is incorrect")
        assert(v3[4] == i - 10, "Vector4 value is incorrect")
        assert(v3[5] == nil, "Vector4 unexpected value")
    end
end

-- Test vector multiplication
local function TestVectorMultiplication()
    for i = 1, 10 do
        local v1 = Vector.Create(i, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
        local v2 = Vector.Create(i, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
        local v3 = Vector.Multiply(v1, v2)
        assert(v3.size == i, "Vector size is incorrect")
        for j = 1, i do
            assert(v3[j] == j * 10, "Vector value is incorrect")
        end
        assert(v3[i + 1] == nil, "Vector unexpected value")
    end
end

local function TestVector2Multiplication()
    for i = 1, 10 do
        local v1 = Vector2.Create(i, i + 1)
        local v2 = Vector2.Create(i + 10, i + 11)
        local v3 = Vector2.Multiply(v1, v2)
        assert(v3.size == 2, "Vector2 size is incorrect")
        assert(v3[1] == i * 10, "Vector2 value is incorrect")
        assert(v3[2] == (i + 1) * (i + 11), "Vector2 value is incorrect")
        assert(v3[3] == nil, "Vector2 unexpected value")
    end
end

local function TestVector3Multiplication()
    for i = 1, 10 do
        local v1 = Vector3.Create(i, i + 1, i + 2)
        local v2 = Vector3.Create(i + 10, i + 11, i + 12)
        local v3 = Vector3.Multiply(v1, v2)
        assert(v3.size == 3, "Vector3 size is incorrect")
        assert(v3[1] == i * 10, "Vector3 value is incorrect")
        assert(v3[2] == (i + 1) * (i + 11), "Vector3 value is incorrect")
        assert(v3[3] == (i + 2) * (i + 12), "Vector3 value is incorrect")
        assert(v3[4] == nil, "Vector3 unexpected value")
    end
end

local function TestVector4Multiplication()
    for i = 1, 10 do
        local v1 = Vector4.Create(i, i + 1, i + 2, i + 3)
        local v2 = Vector4.Create(i + 10, i + 11, i + 12, i + 13)
        local v3 = Vector4.Multiply(v1, v2)
        assert(v3.size == 4, "Vector4 size is incorrect")
        assert(v3[1] == i * 10, "Vector4 value is incorrect")
        assert(v3[2] == (i + 1) * (i + 11), "Vector4 value is incorrect")
        assert(v3[3] == (i + 2) * (i + 12), "Vector4 value is incorrect")
        assert(v3[4] == (i + 3) * (i + 13), "Vector4 value is incorrect")
        assert(v3[5] == nil, "Vector4 unexpected value")
    end
end

-- Test vector division
local function TestVectorDivision()
    for i = 1, 10 do
        local v1 = Vector.Create(i, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
        local v2 = Vector.Create(i, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
        local v3 = Vector.Divide(v1, v2)
        assert(v3.size == i, "Vector size is incorrect")
        for j = 1, i do
            assert(v3[j] == j / 10, "Vector value is incorrect")
        end
        assert(v3[i + 1] == nil, "Vector unexpected value")
    end
end

local function TestVector2Division()
    for i = 1, 10 do
        local v1 = Vector2.Create(i, i + 1)
        local v2 = Vector2.Create(i + 10, i + 11)
        local v3 = Vector2.Divide(v1, v2)
        assert(v3.size == 2, "Vector2 size is incorrect")
        assert(v3[1] == i / 10, "Vector2 value is incorrect")
        assert(v3[2] == (i + 1) / (i + 11), "Vector2 value is incorrect")
        assert(v3[3] == nil, "Vector2 unexpected value")
    end
end

local function TestVector3Division()
    for i = 1, 10 do
        local v1 = Vector3.Create(i, i + 1, i + 2)
        local v2 = Vector3.Create(i + 10, i + 11, i + 12)
        local v3 = Vector3.Divide(v1, v2)
        assert(v3.size == 3, "Vector3 size is incorrect")
        assert(v3[1] == i / 10, "Vector3 value is incorrect")
        assert(v3[2] == (i + 1) / (i + 11), "Vector3 value is incorrect")
        assert(v3[3] == (i + 2) / (i + 12), "Vector3 value is incorrect")
        assert(v3[4] == nil, "Vector3 unexpected value")
    end
end

local function TestVector4Division()
    for i = 1, 10 do
        local v1 = Vector4.Create(i, i + 1, i + 2, i + 3)
        local v2 = Vector4.Create(i + 10, i + 11, i + 12, i + 13)
        local v3 = Vector4.Divide(v1, v2)
        assert(v3.size == 4, "Vector4 size is incorrect")
        assert(v3[1] == i / 10, "Vector4 value is incorrect")
        assert(v3[2] == (i + 1) / (i + 11), "Vector4 value is incorrect")
        assert(v3[3] == (i + 2) / (i + 12), "Vector4 value is incorrect")
        assert(v3[4] == (i + 3) / (i + 13), "Vector4 value is incorrect")
        assert(v3[5] == nil, "Vector4 unexpected value")
    end
end

-- Test vector dot product
local function TestVectorDot()
    for i = 1, 10 do
        local v1 = Vector.Create(i, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
        local v2 = Vector.Create(i, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
        local v3 = Vector.Dot(v1, v2)
        assert(v3 == 55, "Vector dot product is incorrect")
    end
end

local function TestVector2Dot()
    for i = 1, 10 do
        local v1 = Vector2.Create(i, i + 1)
        local v2 = Vector2.Create(i + 10, i + 11)
        local v3 = Vector2.Dot(v1, v2)
        assert(v3 == 220, "Vector2 dot product is incorrect")
    end
end

local function TestVector3Dot()
    for i = 1, 10 do
        local v1 = Vector3.Create(i, i + 1, i + 2)
        local v2 = Vector3.Create(i + 10, i + 11, i + 12)
        local v3 = Vector3.Dot(v1, v2)
        assert(v3 == 660, "Vector3 dot product is incorrect")
    end
end

local function TestVector4Dot()
    for i = 1, 10 do
        local v1 = Vector4.Create(i, i + 1, i + 2, i + 3)
        local v2 = Vector4.Create(i + 10, i + 11, i + 12, i + 13)
        local v3 = Vector4.Dot(v1, v2)
        assert(v3 == 1320, "Vector4 dot product is incorrect")
    end
end

-- Test vector dot with matrix
local function TestVectorDotMatrix()
    for i = 1, 10 do
        local v1 = Vector.Create(i, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
        local m1 = Matrix.Create(i, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
        local v2 = Vector.Dot(v1, m1)
        assert(v2.size == i, "Vector size is incorrect")
        for j = 1, i do
            assert(v2[j] == 55 + j, "Vector value is incorrect")
        end
        assert(v2[i + 1] == nil, "Vector unexpected value")
    end
end

local function TestVector2DotMatrix()
    for i = 1, 10 do
        local v1 = Vector2.Create(i, i + 1)
        local m1 = Matrix2.Create(i, 1, 2, 3, 4, 5, 6, 7, 8)
        local v2 = Vector2.Dot(v1, m1)
        assert(v2.size == 2, "Vector2 size is incorrect")
        assert(v2[1] == 220 + i, "Vector2 value is incorrect")
        assert(v2[2] == 220 + i + 1, "Vector2 value is incorrect")
        assert(v2[3] == nil, "Vector2 unexpected value")
    end
end

local function TestVector3DotMatrix()
    for i = 1, 10 do
        local v1 = Vector3.Create(i, i + 1, i + 2)
        local m1 = Matrix3.Create(i, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
        local v2 = Vector3.Dot(v1, m1)
        assert(v2.size == 3, "Vector3 size is incorrect")
        assert(v2[1] == 660 + i, "Vector3 value is incorrect")
        assert(v2[2] == 660 + i + 1, "Vector3 value is incorrect")
        assert(v2[3] == 660 + i + 2, "Vector3 value is incorrect")
        assert(v2[4] == nil, "Vector3 unexpected value")
    end
end

local function TestVector4DotMatrix()
    for i = 1, 10 do
        local v1 = Vector4.Create(i, i + 1, i + 2, i + 3)
        local m1 = Matrix4.Create(i, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24)
        local v2 = Vector4.Dot(v1, m1)
        assert(v2.size == 4, "Vector4 size is incorrect")
        assert(v2[1] == 1320 + i, "Vector4 value is incorrect")
        assert(v2[2] == 1320 + i + 1, "Vector4 value is incorrect")
        assert(v2[3] == 1320 + i + 2, "Vector4 value is incorrect")
        assert(v2[4] == 1320 + i + 3, "Vector4 value is incorrect")
        assert(v2[5] == nil, "Vector4 unexpected value")
    end
end

TestVectorCreation()
TestVector2Creation()
TestVector3Creation()
TestVector4Creation()
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
