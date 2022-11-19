-- Specific vector API for vectors of size 3 using generic vector API

-------------------------------------------------------------------

-- Vector3.Create(float, float, float) -> vector3
-- Vector3.Add(vector3, vector3) -> vector3
-- Vector3.Subtract(vector3, vector3) -> vector3
-- Vector3.Multiply(vector3, float) -> vector3
-- Vector3.Divide(vector3, float) -> vector3
-- Vector3.Dot(vector3, vector3) -> int
-- Vector3.DotWithMatrix(vector3, matrix) -> vector3

-------------------------------------------------------------------

os.loadAPI("Vector.lua")

-- Create a vector3 object with the given values
function Create(x, y, z)
    return Vector.Create(3, x, y, z)
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
