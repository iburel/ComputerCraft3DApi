-- Installer for all lua files

fs.delete("/Biou3D")

local files = {
    "Biou3D.lua",
    "Biou3DValidationLayer.lua",
    "sample/HelloCube.lua",
    "sample/HelloTriangle.lua",
    "sample/Image.lua",
    "src/Matrix/Matrix.lua",
    "src/Matrix/MatrixValidationLayer.lua",
    "src/Matrix/Vector.lua",
    "src/Matrix/VectorValidationLayer.lua",
    "test/MatrixTests.lua",
    "test/VectorTests.lua",
}

local folders = {
    "sample",
    "src",
    "src/Matrix",
    "test",
}

fs.makeDir("/Biou3D")
for i, folder in ipairs(folders) do
    fs.makeDir("/Biou3D/" .. folder)
end

for i, file in ipairs(files) do
    print("Downloading " .. file .. "...")
    local response = http.get("https://raw.githubusercontent.com/iburel/ComputerCraft3DApi/v1.0.0/" .. file)
    if response == nil then
        error("Error while downloading " .. file)
    end
    local f = fs.open("/Biou3D/" .. file, "w")
    f.write(response.readAll())
    f.close()
    response.close()
end

