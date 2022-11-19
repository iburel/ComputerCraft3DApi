-- Specific vector API for vectors of size 2 using generic vector API

-------------------------------------------------------------------

-- Vector2.Create(float, float) -> vector2
-- Vector2.Add(vector2, vector2) -> vector2
-- Vector2.Subtract(vector2, vector2) -> vector2
-- Vector2.Multiply(vector2, float) -> vector2
-- Vector2.Divide(vector2, float) -> vector2
-- Vector2.Dot(vector2, vector2) -> int
-- Vector2.DotWithMatrix(vector2, matrix) -> vector2

-------------------------------------------------------------------

os.loadAPI("Vector.lua")

-- Create a vector2 object with the given values
function Create(x, y)
    return Vector.Create(2, x, y)
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
