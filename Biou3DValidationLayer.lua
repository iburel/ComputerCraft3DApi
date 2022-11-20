-- An overload of the Biou3D API that check if data is valid and throw an error if not.
-- Useful for debugging.

-------------------------------------------------------------------

-- ValidationLayer.Init(int windowWidth, int windowHeight) -> void

-- ValidationLayer.CreateDataBuffer(vector<float[n]> datas) -> int id
-- ValidationLayer.DestroyDataBuffer(int id) -> void

-- ValidationLayer.CreateVertexShader(function shader) -> int id
-- ValidationLayer.DestroyVertexShader(int id) -> void

-- ValidationLayer.CreateFragmentShader(function shader) -> int id
-- ValidationLayer.DestroyFragmentShader(int id) -> void

-- ValidationLayer.BindVertexBuffer(int id) -> void
-- ValidationLayer.UnbindVertexBuffer() -> void

-- ValidationLayer.BindDataBuffer(int id, int slot) -> void
-- ValidationLayer.UnbindDataBuffer(int slot) -> void

-- ValidationLayer.BindVertexShader(int id) -> void
-- ValidationLayer.UnbindVertexShader() -> void

-- ValidationLayer.BindFragmentShader(int id) -> void
-- ValidationLayer.UnbindFragmentShader() -> void

-- ValidationLayer.Draw() -> int[]

-------------------------------------------------------------------

local expect = dofile("rom/modules/main/cc/expect.lua").expect
os.loadAPI("/Biou3D/Biou3D.lua")

local winX = 0
local winY = 0

function Init(windowWidth, windowHeight)
    expect(1, windowWidth, "number")
    expect(2, windowHeight, "number")

    assert(windowWidth > 0, "windowWidth must be greater than 0")
    assert(windowHeight > 0, "windowHeight must be greater than 0")

    winX = windowWidth
    winY = windowHeight

    Biou3D.Init(windowWidth, windowHeight)
end

function CreateDataBuffer(datas)
    expect(1, datas, "table")

    for i = 1, #datas do
        expect(1, datas[i], "table")
        assert(#datas[i] == #datas[1], "All datas must have the same size")
        for j = 1, #datas[i] do
            expect(1, datas[i][j], "number")
        end
    end

    return Biou3D.CreateDataBuffer(datas)
end

function DestroyDataBuffer(id)
    expect(1, id, "number")

    Biou3D.DestroyDataBuffer(id)
end

function CreateVertexShader(shader)
    expect(1, shader, "function")

    return Biou3D.CreateVertexShader(shader)
end

function DestroyVertexShader(id)
    expect(1, id, "number")

    Biou3D.DestroyVertexShader(id)
end

function CreateFragmentShader(shader)
    expect(1, shader, "function")

    return Biou3D.CreateFragmentShader(shader)
end

function DestroyFragmentShader(id)
    expect(1, id, "number")

    Biou3D.DestroyFragmentShader(id)
end

function BindVertexBuffer(id)
    expect(1, id, "number")

    Biou3D.BindVertexBuffer(id)
end

function UnbindVertexBuffer()
    Biou3D.UnbindVertexBuffer()
end

function BindDataBuffer(id, slot)
    expect(1, id, "number")
    expect(2, slot, "number")

    Biou3D.BindDataBuffer(id, slot)
end

function UnbindDataBuffer(slot)
    expect(1, slot, "number")

    Biou3D.UnbindDataBuffer(slot)
end

function BindVertexShader(id)
    expect(1, id, "number")

    Biou3D.BindVertexShader(id)
end

function UnbindVertexShader()
    Biou3D.UnbindVertexShader()
end

function BindFragmentShader(id)
    expect(1, id, "number")

    Biou3D.BindFragmentShader(id)
end

function UnbindFragmentShader()
    Biou3D.UnbindFragmentShader()
end

function Draw()
    assert(winX > 0, "windowWidth must be greater than 0")
    assert(winY > 0, "windowHeight must be greater than 0")

    return Biou3D.Draw()
end
