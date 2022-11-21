-- Sample to test a simple cube

os.loadAPI("/Biou3D/Biou3D.lua")
os.loadAPI("/Biou3D/src/Matrix/Vector.lua")
os.loadAPI("/Biou3D/src/Matrix/Matrix.lua")
os.loadAPI("/Biou3D/sample/Image.lua")

-- Init Biou3D
local monitor = peripheral.find("monitor")
if monitor ~= nil then
    monitor.setTextScale(0.5)
    term.redirect(monitor)
end

local winX, winY = term.getSize()
Biou3D.Init(winX, winY)

-- Create a vertex buffer
local vertexBuffer = Biou3D.CreateDataBuffer({
    { -1.0, -1.0, -1.0, 1.0 },
    { -1.0, -1.0, 1.0, 1.0 },
    { -1.0, 1.0, 1.0, 1.0 },
    { 1.0, 1.0, -1.0, 1.0 },
    { -1.0, -1.0, -1.0, 1.0 },
    { -1.0, 1.0, -1.0, 1.0 },
    { 1.0, -1.0, 1.0, 1.0 },
    { -1.0, -1.0, -1.0, 1.0 },
    { 1.0, -1.0, -1.0, 1.0 },
    { 1.0, 1.0, -1.0, 1.0 },
    { 1.0, -1.0, -1.0, 1.0 },
    { -1.0, -1.0, -1.0, 1.0 },
    { -1.0, -1.0, -1.0, 1.0 },
    { -1.0, 1.0, 1.0, 1.0 },
    { -1.0, 1.0, -1.0, 1.0 },
    { 1.0, -1.0, 1.0, 1.0 },
    { -1.0, -1.0, 1.0, 1.0 },
    { -1.0, -1.0, -1.0, 1.0 },
    { -1.0, 1.0, 1.0, 1.0 },
    { -1.0, -1.0, 1.0, 1.0 },
    { 1.0, -1.0, 1.0, 1.0 },
    { 1.0, 1.0, 1.0, 1.0 },
    { 1.0, -1.0, -1.0, 1.0 },
    { 1.0, 1.0, -1.0, 1.0 },
    { 1.0, -1.0, -1.0, 1.0 },
    { 1.0, 1.0, 1.0, 1.0 },
    { 1.0, -1.0, 1.0, 1.0 },
    { 1.0, 1.0, 1.0, 1.0 },
    { 1.0, 1.0, -1.0, 1.0 },
    { -1.0, 1.0, -1.0, 1.0 },
    { 1.0, 1.0, 1.0, 1.0 },
    { -1.0, 1.0, -1.0, 1.0 },
    { -1.0, 1.0, 1.0, 1.0 },
    { 1.0, 1.0, 1.0, 1.0 },
    { -1.0, 1.0, 1.0, 1.0 },
    { 1.0, -1.0, 1.0, 1.0 }
})

-- Create a color buffer
local colorBuffer = Biou3D.CreateDataBuffer({
    { 1 }, { 1 }, { 1 },
    { 2 }, { 2 }, { 2 },
    { 3 }, { 3 }, { 3 },
    { 2 }, { 2 }, { 2 },
    { 1 }, { 1 }, { 1 },
    { 3 }, { 3 }, { 3 },
    { 4 }, { 4 }, { 4 },
    { 5 }, { 5 }, { 5 },
    { 5 }, { 5 }, { 5 },
    { 6 }, { 6 }, { 6 },
    { 6 }, { 6 }, { 6 },
    { 4 }, { 4 }, { 4 },
})

-- Create vertex shader
local matrix = Matrix.CreateIdentity(4)
matrix = Matrix.Scale(matrix, { 0.2, 0.2, 0.2 })
matrix = Matrix.Rotate(matrix, Vector.Normalize({ 1, 1, 1 }), math.pi / 4)
local function vertexShaderFunc(winX, winY, vertice, dataBuffers)
    return Vector.DotMatrix(matrix, vertice)
end

local vertexShader = Biou3D.CreateVertexShader(vertexShaderFunc)

-- Create fragment shader
local function fragmentShaderFunc(winX, winY, x, y, z, dataBuffers)
    local color = dataBuffers[1][1]
    return color, z
end

local fragmentShader = Biou3D.CreateFragmentShader(fragmentShaderFunc)

while true do
    -- Bind the vertex buffer
    Biou3D.BindVertexBuffer(vertexBuffer)

    -- Bind the color buffer
    Biou3D.BindDataBuffer(colorBuffer, 1)

    -- Bind the vertex shader
    Biou3D.BindVertexShader(vertexShader)

    -- Bind the fragment shader
    Biou3D.BindFragmentShader(fragmentShader)

    -- Draw the cube
    matrix = Matrix.Rotate(matrix, Vector.Normalize({ 1, 1, 1 }), math.pi / 30)
    local image = Biou3D.Draw()

    -- Unbind the fragment shader
    Biou3D.UnbindFragmentShader()

    -- Unbind the vertex shader
    Biou3D.UnbindVertexShader()

    -- Unbind the color buffer
    Biou3D.UnbindDataBuffer(1)

    -- Unbind the vertex buffer
    Biou3D.UnbindVertexBuffer()

    -- Display the image
    Image.Display(term, image)

    sleep(0.016)
end
