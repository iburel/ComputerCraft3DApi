-- Specific vector API for vectors of size 4 using generic vector API

-------------------------------------------------------------------

-- Vector4.Create(float, float, float, float) -> vector4
-- Vector4.Add(vector4, vector4) -> vector4
-- Vector4.Subtract(vector4, vector4) -> vector4
-- Vector4.Multiply(vector4, float) -> vector4
-- Vector4.Divide(vector4, float) -> vector4
-- Vector4.Dot(vector4, vector4) -> int
-- Vector4.DotWithMatrix(vector4, matrix) -> vector4
-- Vector4.DivideByW(vector4) -> vector3

-------------------------------------------------------------------

os.loadAPI("Vector.lua")

-- Create a vector4 object with the given values
function Create(x, y, z, w)
    return Vector.Create(4, x, y, z, w)
end

-- Add two vectors together
Add = Vector.Add

-- Subtract two vectors
Subtract = Vector.Subtract

-- Multiply a vector by a scalar
Multiply = Vector.Multiply

-- Divide a vector by a scalar
Divide = Vector.Divide

-- Dot product of two vectors
Dot = Vector.Dot

-- Dot product of a vector and a matrix
DotWithMatrix = Vector.DotWithMatrix

-- Divide a vector4 by its w component to get a vector3
function DivideByW(vector)
    return Vector.Create(3, vector[1] / vector[4], vector[2] / vector[4], vector[3] / vector[4])
end
