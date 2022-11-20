-- Sample to test a simple triangle

os.loadAPI("/Biou3D/Biou3D.lua")

-- Init Biou3D
monitor = peripheral.find("monitor")
if monitor ~= nil then
    monitor.setTextScale(0.5)
    term.redirect(monitor)
end

winX, winY = term.getSize()
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


