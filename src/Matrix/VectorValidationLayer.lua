-- An overload of the Vector API that check if data is valid and throw an error if not.
-- Useful for debugging.

-------------------------------------------------------------------

-- Vector.Add(vector, vector) -> vector
-- Vector.Subtract(vector, vector) -> vector
-- Vector.Multiply(vector, float) -> vector
-- Vector.Divide(vector, float) -> vector
-- Vector.Dot(vector, vector) -> int
-- Vector.DotWithMatrix(vector, matrix) -> vector
-- Vector.DivideByW(vector) -> vector

-------------------------------------------------------------------

os.loadAPI("/Biou3D/src/Matrix/Vector.lua")

-- Add two vectors together
function Add(vector1, vector2)
    expect(vector1, "table")
    expect(vector2, "table")

    for i = 1, #vector1 do
        expect(vector1[i], "number")
    end

    for i = 1, #vector2 do
        expect(vector2[i], "number")
    end

    assert(#vector1 == #vector2, "Vector.Add: vectors must have the same size")

    return Vector.Add(vector1, vector2)
end

-- Subtract two vectors
function Subtract(vector1, vector2)
    expect(vector1, "table")
    expect(vector2, "table")

    for i = 1, #vector1 do
        expect(vector1[i], "number")
    end

    for i = 1, #vector2 do
        expect(vector2[i], "number")
    end

    assert(#vector1 == #vector2, "Vector.Subtract: vectors must have the same size")

    return Vector.Subtract(vector1, vector2)
end

-- Multiply a vector by a scalar
function Multiply(vector, scalar)
    expect(vector, "table")
    expect(scalar, "number")

    for i = 1, #vector do
        expect(vector[i], "number")
    end

    return Vector.Multiply(vector, scalar)
end

-- Divide a vector by a scalar
function Divide(vector, scalar)
    expect(vector, "table")
    expect(scalar, "number")

    for i = 1, #vector do
        expect(vector[i], "number")
    end

    return Vector.Divide(vector, scalar)
end

-- Dot two vectors together
function Dot(vector1, vector2)
    expect(vector1, "table")
    expect(vector2, "table")

    for i = 1, #vector1 do
        expect(vector1[i], "number")
    end

    for i = 1, #vector2 do
        expect(vector2[i], "number")
    end

    assert(#vector1 == #vector2, "Vector.Dot: vectors must have the same size")

    return Vector.Dot(vector1, vector2)
end

-- Dot a vector with a matrix
function DotWithMatrix(vector, matrix)
    expect(vector, "table")
    expect(matrix, "table")

    for i = 1, #vector do
        expect(vector[i], "number")
    end

    for i = 1, #matrix do
        expect(matrix[i], "table")
        for j = 1, #matrix[i] do
            expect(matrix[i][j], "number")
        end
    end

    assert(#vector == #matrix, "Vector.DotWithMatrix: vector's size must be equal to matrix's rows count")

    return Vector.DotWithMatrix(vector, matrix)
end

-- Divide a vector by its w component
function DivideByW(vector)
    expect(vector, "table")

    for i = 1, #vector do
        expect(vector[i], "number")
    end

    assert(#vector == 4, "Vector.DivideByW: vector must have a size of 4")

    return Vector.DivideByW(vector)
end
