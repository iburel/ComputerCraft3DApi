-- An overload of the Vector API that check if data is valid and throw an error if not.
-- Useful for debugging.

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

local expect = dofile("rom/modules/main/cc/expect.lua").expect
os.loadAPI("/Biou3D/src/Matrix/Vector.lua")

-- Add two vectors together
function Add(vector1, vector2)
    expect(1, vector1, "table")
    expect(2, vector2, "table")

    for i = 1, #vector1 do
        expect(1, vector1[i], "number")
    end

    for i = 1, #vector2 do
        expect(2, vector2[i], "number")
    end

    assert(#vector1 == #vector2, "Vector.Add: vectors must have the same size")

    return Vector.Add(vector1, vector2)
end

-- Subtract two vectors
function Subtract(vector1, vector2)
    expect(1, vector1, "table")
    expect(2, vector2, "table")

    for i = 1, #vector1 do
        expect(1, vector1[i], "number")
    end

    for i = 1, #vector2 do
        expect(2, vector2[i], "number")
    end

    assert(#vector1 == #vector2, "Vector.Subtract: vectors must have the same size")

    return Vector.Subtract(vector1, vector2)
end

-- Multiply two vectors together
function Multiply(vector1, vector2)
    expect(1, vector1, "table")
    expect(2, vector2, "table")

    for i = 1, #vector1 do
        expect(1, vector1[i], "number")
    end

    for i = 1, #vector2 do
        expect(2, vector2[i], "number")
    end

    assert(#vector1 == #vector2, "Vector.Multiply: vectors must have the same size")

    return Vector.Multiply(vector1, vector2)
end

-- Divide two vectors
function Divide(vector1, vector2)
    expect(1, vector1, "table")
    expect(2, vector2, "table")

    for i = 1, #vector1 do
        expect(1, vector1[i], "number")
    end

    for i = 1, #vector2 do
        expect(2, vector2[i], "number")
    end

    assert(#vector1 == #vector2, "Vector.Divide: vectors must have the same size")

    return Vector.Divide(vector1, vector2)
end

-- Multiply a vector by a scalar
function MultiplyByScalar(vector, scalar)
    expect(1, vector, "table")
    expect(2, scalar, "number")

    for i = 1, #vector do
        expect(1, vector[i], "number")
    end

    return Vector.MultiplyByScalar(vector, scalar)
end

-- Divide a vector by a scalar
function DivideByScalar(vector, scalar)
    expect(1, vector, "table")
    expect(2, scalar, "number")

    for i = 1, #vector do
        expect(1, vector[i], "number")
    end

    return Vector.DivideByScalar(vector, scalar)
end

-- Dot two vectors together
function Dot(vector1, vector2)
    expect(1, vector1, "table")
    expect(2, vector2, "table")

    for i = 1, #vector1 do
        expect(1, vector1[i], "number")
    end

    for i = 1, #vector2 do
        expect(2, vector2[i], "number")
    end

    assert(#vector1 == #vector2, "Vector.Dot: vectors must have the same size")

    return Vector.Dot(vector1, vector2)
end

-- Dot a vector with a matrix
function DotMatrix(matrix, vector)
    expect(1, matrix, "table")
    expect(2, vector, "table")

    for i = 1, #matrix do
        for j = 1, #matrix[i] do
            expect(1, matrix[i][j], "number")
        end
    end

    for i = 1, #vector do
        expect(2, vector[i], "number")
    end

    assert(#matrix[1] == #vector, "Vector.DotMatrix: matrix and vector must have the same size")

    return Vector.DotMatrix(matrix, vector)
end

-- Divide a vector by its w component
function DivideByW(vector)
    expect(1, vector, "table")

    for i = 1, #vector do
        expect(1, vector[i], "number")
    end

    assert(#vector == 4, "Vector.DivideByW: vector must have a size of 4")

    return Vector.DivideByW(vector)
end
