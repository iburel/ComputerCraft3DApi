-- An overload of the Matrix API that check if data is valid and throw an error if not.
-- Useful for debugging.

-------------------------------------------------------------------

-- Matrix.Dot(matrix, matrix) -> matrix

-------------------------------------------------------------------

os.loadAPI("/Biou3D/src/Matrix/Matrix.lua")

-- Multiply two matrices together
function Dot(matrix1, matrix2)
    expect(matrix1, "table")
    expect(matrix2, "table")

    for i = 1, #matrix1 do
        expect(matrix1[i], "table")
        for j = 1, #matrix1[i] do
            expect(matrix1[i][j], "number")
        end
    end

    for i = 1, #matrix2 do
        expect(matrix2[i], "table")
        for j = 1, #matrix2[i] do
            expect(matrix2[i][j], "number")
        end
    end

    assert(#matrix1[1] == #matrix2, "Matrix.Dot: matrix1's columns count must be equal to matrix2's rows count")

    return Matrix.Dot(matrix1, matrix2)
end
