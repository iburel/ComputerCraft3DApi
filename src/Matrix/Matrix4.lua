-- Specific maxtrix API for matrix of size 4x4 using generic maxtrix API

-------------------------------------------------------------------

-- Matrix4.Create(float...) -> matrix4
-- Matrix4.Dot(matrix4, matrix4) -> matrix4

-------------------------------------------------------------------

os.loadAPI("Matrix.lua")

-- Create a matrix4 object with the given values
function Create(m11, m12, m13, m14, m21, m22, m23, m24, m31, m32, m33, m34, m41, m42, m43, m44)
    return Matrix.Create(4, 4, m11, m12, m13, m14, m21, m22, m23, m24, m31, m32, m33, m34, m41, m42, m43, m44)
end

-- Multiply a matrix4 by another matrix4
Dot = Matrix.Dot
