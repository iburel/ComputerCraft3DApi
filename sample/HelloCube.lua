-- Sample to test a simple cube

os.loadAPI("/Biou3D/Biou3DValidationLayer.lua")
Biou3D = Biou3DValidationLayer

os.loadAPI("/Biou3D/src/Matrix/VectorValidationLayer.lua")
Vector = VectorValidationLayer

-- Init Biou3D
monitor = peripheral.find("monitor")
if monitor ~= nil then
    monitor.setTextScale(0.5)
    term.redirect(monitor)
end

winX, winY = term.getSize()
Biou3D.Init(winX, winY)

-- Create a vertex buffer
local vertexBufferDatas = {
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
}

for i = 1, #vertexBufferDatas do
    vertexBufferDatas[i] = Vector.DivideByScalar(vertexBufferDatas[i], 2)
end

vertexBuffer = Biou3D.CreateDataBuffer(vertexBufferDatas)

-- Bind the vertex buffer
Biou3D.BindVertexBuffer(vertexBuffer)

-- Draw the cube
image = Biou3D.Draw()

-- Unbind the vertex buffer
Biou3D.UnbindVertexBuffer()

-- Delete the vertex buffer
Biou3D.DestroyDataBuffer(vertexBuffer)

-- Display the image
term.clear()
for i = 1, #image do
    paintutils.drawPixel(i % winX, math.floor(i / winX), image[i])
end
