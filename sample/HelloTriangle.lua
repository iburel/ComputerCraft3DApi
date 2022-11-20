-- Sample to test a simple triangle

os.loadAPI("/Biou3D/Biou3D.lua")

-- Init Biou3D
winX, winY = term.getSize()

-- Create a vertex buffer
local vertexBuffer = Biou3D.CreateDataBuffer({
    {-0.5, -0.5, -0.5},
    {0.5, -0.5, -0.5},
    {-0.5, 0.5, -0.5}
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
term.Clear()
for i = 1, #image do
    term.SetCursorPos(i % winX, math.floor(i / winX))
    term.SetBackgroundColor(image[i])
    term.Write(" ")
end


