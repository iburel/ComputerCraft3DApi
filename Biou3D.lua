-- This is the main file for the Biou3D Api

-------------------------------------------------------------------

-- Biou3D.Init(int windowWidth, int windowHeight) -> void

-- Biou3D.CreateDataBuffer(vector<float[n]> datas) -> int id
-- Biou3D.DestroyDataBuffer(int id) -> void

-- Biou3D.CreateVertexShader(function shader) -> int id
-- Biou3D.DestroyVertexShader(int id) -> void

-- Biou3D.CreateFragmentShader(function shader) -> int id
-- Biou3D.DestroyFragmentShader(int id) -> void

-- Biou3D.BindVertexBuffer(int id) -> void
-- Biou3D.UnbindVertexBuffer() -> void

-- Biou3D.BindDataBuffer(int id) -> void
-- Biou3D.UnbindDataBuffer() -> void

-- Biou3D.BindVertexShader(int id) -> void
-- Biou3D.UnbindVertexShader() -> void

-- Biou3D.BindFragmentShader(int id) -> void
-- Biou3D.UnbindFragmentShader() -> void

-- Biou3D.Draw() -> int[]

-------------------------------------------------------------------

os.loadAPI("/Biou3D/src/Matrix/Vector.lua")

-- Internal variables
local winX = 0
local winY = 0

local dataBuffers = {}
local dataBuffersLastID = 1
local vertexBufferIndex = 1
local dataBufferIndexes = {}

local vertexShaders = {}
local vertexShadersLastID = 1
local vertexShaderIndex = 1

local fragmentShaders = {}
local fragmentShadersLastID = 1
local fragmentShaderIndex = 1

-- Set empty data buffer to index 1
dataBuffers[1] = {}

-- Set default vertex shader to index 1
local function defaultVertexShader(winX, winY, vertice, dataBuffers)
    return vertice
end

vertexShaders[1] = defaultVertexShader

-- Set default fragment shader to index 1
local function defaultFragmentShader(winX, winY, x, y, z, dataBuffers)
    return colors.gray
end

fragmentShaders[1] = defaultFragmentShader

-- Function to initialize the Biou3D Api
function Init(windowWidth, windowHeight)
    winX = windowWidth
    winY = windowHeight
end

-- Function to create a data buffer object with the given vectors and return its ID
function CreateDataBuffer(datas)
    dataBuffersLastID = dataBuffersLastID + 1
    dataBuffers[dataBuffersLastID] = datas
    return dataBuffersLastID
end

-- Function to destroy a data buffer object with the given ID
function DestroyDataBuffer(id)
    dataBuffers[id] = nil
end

-- Function to create a vertex shader object with the given function and return its ID
function CreateVertexShader(func)
    vertexShadersLastID = vertexShadersLastID + 1
    vertexShaders[vertexShadersLastID] = func
    return vertexShadersLastID
end

-- Function to destroy a vertex shader object with the given ID
function DestroyVertexShader(id)
    vertexShaders[id] = nil
end

-- Function to create a fragment shader object with the given function and return its ID
function CreateFragmentShader(func)
    fragmentShadersLastID = fragmentShadersLastID + 1
    fragmentShaders[fragmentShadersLastID] = func
    return fragmentShadersLastID
end

-- Function to bind a vertex buffer using a data array ID
function BindVertexBuffer(dataArrayID)
    vertexBufferIndex = dataArrayID
end

-- Function to unbind the vertex buffer
function UnbindVertexBuffer()
    vertexBufferIndex = 1
end

-- Function to bind a data buffer using a data array ID to a specific slot
function BindDataBuffer(dataArrayID, slot)
    dataBufferIndexes[slot] = dataArrayID
end

-- Function to unbind a data buffer from a specific slot
function UnbindDataBuffer(slot)
    dataBufferIndexes[slot] = nil
end

-- Function to bind a vertex shader using a vertex shader ID
function BindVertexShader(vertexShaderID)
    vertexShaderIndex = vertexShaderID
end

-- Function to unbind the vertex shader
function UnbindVertexShader()
    vertexShaderIndex = 1
end

-- Function to bind a fragment shader using a fragment shader ID
function BindFragmentShader(fragmentShaderID)
    fragmentShaderIndex = fragmentShaderID
end

-- Function to unbind the fragment shader
function UnbindFragmentShader()
    fragmentShaderIndex = 1
end

-- Function to draw and return an image as an int array
function Draw()
    local vertex = dataBuffers[vertexBufferIndex]
    local buffers = {}
    for i = 1, #dataBufferIndexes do
        buffers[i] = dataBuffers[dataBufferIndexes[i]]
    end
    local vertexShader = vertexShaders[vertexShaderIndex]
    local fragmentShader = fragmentShaders[fragmentShaderIndex]

    -- Call vertex shader on each vertice
    local transformedVertex = {}
    for i = 1, #vertex do
        transformedVertex[i] = vertexShader(winX, winY, vertex[i], buffers)
    end

    -- Divide by w
    local finalVertex = {}
    for i = 1, #transformedVertex do
        finalVertex[i] = Vector.DivideByW(transformedVertex[i])
    end

    -- Form triangles from vertex
    local triangles = {}
    local buffersTriangles = {}
    for i = 1, #finalVertex, 3 do
        triangles[#triangles + 1] = { finalVertex[i], finalVertex[i + 1], finalVertex[i + 2] }
        for j = 1, #buffers do
            buffersTriangles[#buffersTriangles + 1] = { buffers[j][i], buffers[j][i + 1], buffers[j][i + 2] }
        end
    end

    -- Remove triangles if all vertices is outside the screen
    local validTriangles = {}
    local validBuffersTriangles = {}
    for i = 1, #triangles do
        local triangle = triangles[i]
        local valid = true
        for j = 1, 3 do
            if triangle[1][j] < -1 and triangle[2][j] < -1 and triangle[3][j] < -1 then
                valid = false
                break
            end
            if triangle[1][j] > 1 and triangle[2][j] > 1 and triangle[3][j] > 1 then
                valid = false
                break
            end
        end
        if valid then
            validTriangles[#validTriangles + 1] = triangle
            validBuffersTriangles[#validBuffersTriangles + 1] = buffersTriangles[i]
        end
    end

    -- TODO: Cut triangles into smaller triangles if they are outside the screen

    -- Rasterization
    local image = {}
    for i = 1, winX * winY do
        image[i] = colors.black
    end
    for i = 1, #validTriangles do
        local triangle = validTriangles[i]
        local buffersTriangle = validBuffersTriangles[i]

        -- Find bounding box
        local minX = math.floor((math.min(triangle[1][1], triangle[2][1], triangle[3][1]) + 1) * winX / 2)
        local maxX = math.floor((math.max(triangle[1][1], triangle[2][1], triangle[3][1]) + 1) * winX / 2)
        local minY = math.floor((math.min(triangle[1][2], triangle[2][2], triangle[3][2]) + 1) * winY / 2)
        local maxY = math.floor((math.max(triangle[1][2], triangle[2][2], triangle[3][2]) + 1) * winY / 2)

        -- Loop through pixels in bounding box
        for x = minX, maxX do
            for y = minY, maxY do
                -- Keep only x and y from triangle
                local triangle2D = {}
                for j = 1, 3 do
                    triangle2D[j] = { triangle[j][1], triangle[j][2] }
                end

                -- Calculate barycentric coordinates
                local p = { x / winX * 2 - 1, y / winY * 2 - 1 }
                local v0 = Vector.Subtract(triangle2D[2], triangle2D[1])
                local v1 = Vector.Subtract(triangle2D[3], triangle2D[1])
                local v2 = Vector.Subtract(p, triangle2D[1])
                local dot00 = Vector.Dot(v0, v0)
                local dot01 = Vector.Dot(v0, v1)
                local dot02 = Vector.Dot(v0, v2)
                local dot11 = Vector.Dot(v1, v1)
                local dot12 = Vector.Dot(v1, v2)
                local invDenom = 1 / (dot00 * dot11 - dot01 * dot01)
                local u = (dot11 * dot02 - dot01 * dot12) * invDenom
                local v = (dot00 * dot12 - dot01 * dot02) * invDenom

                -- If pixel is inside triangle
                if u >= 0 and v >= 0 and u + v < 1 then
                    -- Interpolate z
                    local z = triangle[1][3] * (1 - u - v) + triangle[2][3] * u + triangle[3][3] * v

                    -- Interpolate buffers
                    local interpolatedBuffers = {}
                    for j = 1, #buffersTriangle[1] do
                        local a = Vector.Multiply(buffersTriangle[1][j], (1 - u - v))
                        local b = Vector.Multiply(buffersTriangle[2][j], u)
                        local c = Vector.Multiply(buffersTriangle[3][j], v)
                        interpolatedBuffers[j] = Vector.Add(a, Vector.Add(b, c))
                    end

                    -- Call fragment shader
                    local color = fragmentShader(winX, winY, x, y, z, interpolatedBuffers)

                    -- Draw pixel
                    image[y * winX + x] = color
                end
            end
        end
    end

    return image
end
