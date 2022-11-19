-- Specific maxtrix API for matrix of size 3x3 using generic maxtrix API

-------------------------------------------------------------------

-- Matrix3.Create(float...) -> matrix3
-- Matrix3.Dot(matrix3, matrix3) -> matrix3

-------------------------------------------------------------------

os.loadAPI("Matrix.lua")

-- Create a matrix3 object with the given values
function Create(m11, m12, m13, m21, m22, m23, m31, m32, m33)
    return Matrix.Create(3, 3, m11, m12, m13, m21, m22, m23, m31, m32, m33)
end

-- Multiply a matrix3 by another matrix3
Dot = Matrix.Dot
