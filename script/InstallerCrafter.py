# Script to create a lua program to download all lua files in a Biou3D folder

import os
import sys

# constant URL
URL = "https://raw.githubusercontent.com/iburel/ComputerCraft3DApi/"

# first argument is the tag or master
def main():
    if len(sys.argv) < 2:
        print("Usage: python script/InstallerCrafter.py <tag or master>")
        return

    url = URL + sys.argv[1] + "/"

    # Remove the old installer
    if os.path.exists("installer.lua"):
        os.remove("installer.lua")

    # Get the path of the parent folder
    path = os.path.dirname(os.path.realpath(__file__))
    path = os.path.dirname(path)

    # Get the list of all lua files recursively with relative path
    lua_files = []
    for root, dirs, files in os.walk(path):
        for file in files:
            if file.endswith(".lua"):
                lua_files.append(os.path.relpath(os.path.join(root, file), path))

    # Get the list of all intermediate folders
    folders = []
    for file in lua_files:
        # Get all parent folders of file
        file_folders = os.path.dirname(file).split(os.sep)
        for i in range(len(file_folders)):
            # Add folders separated by /
            folder = "/".join(file_folders[:i+1])
            if folder not in folders:
                folders.append(folder)
    folders.remove("")

    # Create the installer file
    installer = open(os.path.join(path, "Installer.lua"), "w")

    # Write the header
    installer.write("-- Installer for all lua files\n")
    installer.write("\n")

    # Write the remove of the old files
    installer.write("fs.delete(\"/Biou3D\")\n")
    installer.write("\n")

    # Write the list of files
    installer.write("local files = {\n")
    for f in lua_files:
        installer.write('    "' + f.replace("\\", "/") + '",\n')
    installer.write("}\n")
    installer.write("\n")

    # Write the list of intermidiate folders
    installer.write("local folders = {\n")
    for f in folders:
        installer.write('    "' + f + '",\n')
    installer.write("}\n")
    installer.write("\n")

    # Write the Creation of intermidiate folders
    installer.write("fs.makeDir(\"/Biou3D\")\n")
    installer.write("for i, folder in ipairs(folders) do\n")
    installer.write("    fs.makeDir(\"/Biou3D/\" .. folder)\n")
    installer.write("end\n")
    installer.write("\n")

    # Write the download of files using http.get
    installer.write("for i, file in ipairs(files) do\n")
    installer.write("    print(\"Downloading \" .. file .. \"...\")\n")
    installer.write("    local response = http.get(\"" + url + "\" .. file)\n")
    installer.write("    if response == nil then\n")
    installer.write("        error(\"Error while downloading \" .. file)\n")
    installer.write("    end\n")
    installer.write("    local f = fs.open(\"/Biou3D/\" .. file, \"w\")\n")
    installer.write("    f.write(response.readAll())\n")
    installer.write("    f.close()\n")
    installer.write("    response.close()\n")
    installer.write("end\n")
    installer.write("\n")

__name__ == "__main__" and main()
