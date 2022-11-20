-- An overload of the Matrix API that check if data is valid and throw an error if not.
-- Useful for debugging.

-------------------------------------------------------------------

-- Matrix.CreateIdentity(size) -> matrix
-- Matrix.Dot(matrix, matrix) -> matrix
-- Matrix.Translate(matrix4x4, vector3) -> matrix4x4
-- Matrix.Scale(matrix4x4, vector3) -> matrix4x4
-- Matrix.Rotate(matrix4x4, vector3, radian) -> matrix4x4

-------------------------------------------------------------------

local expect = dofile("rom/modules/main/cc/expect.lua").expect
os.loadAPI("/Biou3D/src/Matrix/Matrix.lua")

-- Create an identity matrix
function CreateIdentity(size)
    expect(1, size, "number")
    return Matrix.CreateIdentity(size)
end

-- Multiply two matrices together
function Dot(matrix1, matrix2)
    expect(1, matrix1, "table")
    expect(2, matrix2, "table")

    for i = 1, #matrix1 do
        expect(1, matrix1[i], "table")
        for j = 1, #matrix1[i] do
            expect(1, matrix1[i][j], "number")
        end
    end

    for i = 1, #matrix2 do
        expect(2, matrix2[i], "table")
        for j = 1, #matrix2[i] do
            expect(2, matrix2[i][j], "number")
        end
    end

    assert(#matrix1[1] == #matrix2, "Matrix.Dot: matrix1's columns count must be equal to matrix2's rows count")

    return Matrix.Dot(matrix1, matrix2)
end

-- Translate a matrix 4x4
function Translate(matrix, vector)
    expect(1, matrix, "table")
    expect(2, vector, "table")

    assert(#matrix == 4, "Matrix.Translate: matrix must be a 4x4 matrix")
    assert(#vector == 3, "Matrix.Translate: vector must be a 3D vector")
    for i = 1, #matrix do
        expect(1, matrix[i], "table")

        assert(#matrix[i] == 4, "Matrix.Translate: matrix must be a 4x4 matrix")
        for j = 1, #matrix[i] do
            expect(1, matrix[i][j], "number")
        end
    end

    for i = 1, #vector do
        expect(2, vector[i], "number")
    end

    return Matrix.Translate(matrix, vector)
end

-- Scale a matrix 4x4
function Scale(matrix, vector)
    expect(1, matrix, "table")
    expect(2, vector, "table")

    assert(#matrix == 4, "Matrix.Scale: matrix must be a 4x4 matrix")
    assert(#vector == 3, "Matrix.Scale: vector must be a 3D vector")
    for i = 1, #matrix do
        expect(1, matrix[i], "table")

        assert(#matrix[i] == 4, "Matrix.Scale: matrix must be a 4x4 matrix")
        for j = 1, #matrix[i] do
            expect(1, matrix[i][j], "number")
        end
    end

    for i = 1, #vector do
        expect(2, vector[i], "number")
    end

    return Matrix.Scale(matrix, vector)
end

-- Rotate a matrix 4x4
function Rotate(matrix, vector, radian)
    expect(1, matrix, "table")
    expect(2, vector, "table")
    expect(3, radian, "number")

    assert(#matrix == 4, "Matrix.Translate: matrix must be a 4x4 matrix")
    assert(#vector == 3, "Matrix.Translate: vector must be a 3D vector")
    for i = 1, #matrix do
        expect(1, matrix[i], "table")

        assert(#matrix[i] == 4, "Matrix.Translate: matrix must be a 4x4 matrix")
        for j = 1, #matrix[i] do
            expect(1, matrix[i][j], "number")
        end
    end

    for i = 1, #vector do
        expect(2, vector[i], "number")
    end

    return Matrix.Rotate(matrix, vector, radian)
end
