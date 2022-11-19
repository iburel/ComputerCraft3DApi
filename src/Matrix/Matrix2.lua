-- Specific maxtrix API for matrix of size 2x2 using generic maxtrix API

-------------------------------------------------------------------

-- Matrix2.Create(float...) -> matrix2
-- Matrix2.Dot(matrix2, matrix2) -> matrix2

-------------------------------------------------------------------

os.loadAPI("Matrix.lua")

-- Create a matrix2 object with the given values
function Create(m11, m12, m21, m22)
    return Matrix.Create(2, 2, m11, m12, m21, m22)
end

-- Multiply a matrix2 by another matrix2
Dot = Matrix.Dot
