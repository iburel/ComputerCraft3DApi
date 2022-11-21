-- Sample to test a simple triangle

os.loadAPI("/Biou3D/Biou3D.lua")
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
    {0, -0.5, 0, 1},
    {-0.5, 0.5, 0, 1},
    {0.5, 0.5, 0, 1}
})

-- Bind the vertex buffer
Biou3D.BindVertexBuffer(vertexBuffer)

-- Draw the triangle
local image = Biou3D.Draw()

-- Unbind the vertex buffer
Biou3D.UnbindVertexBuffer()

-- Delete the vertex buffer
Biou3D.DestroyDataBuffer(vertexBuffer)

-- Display the image
Image.Display(term, image)

