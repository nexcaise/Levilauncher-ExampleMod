LLMod Template

This repository is a template for creating LLMod (LeviLaunchroid Mod) using C++ and xmake, with automatic building and packaging into a ".llmod" file using GitHub Actions.

The ".llmod" file is essentially a packaged archive containing the mod metadata and compiled native library.

---

Repository Structure

.
├ .github/workflows
│   └ build.yml
├ manifest.json
├ default_mod_icon.png
├ src
│   └ main.cpp
├ xmake.lua
└ README.md

Explanation

Path| Description
".github/workflows/build.yml"| GitHub Actions workflow that builds the mod and packages it into ".llmod"
"manifest.json"| Contains mod metadata
"default_mod_icon.png"| Icon used for the mod
"src/"| C++ source code for the mod
"xmake.lua"| xmake build configuration

---

Editing Mod Information

Open:

Repository/manifest.json

Example:

{
  "name": "Example Mod",
  "description": "Example LL mod",
  "version": "1.0.0",
  "author": "YourName",
  "icon": "default_mod_icon.png"
}

Field Explanation

Field| Description
"name"| Name of the mod
"description"| Short description of the mod
"version"| Mod version
"author"| Mod creator
"icon"| Icon filename

---

Changing the Mod Icon

Replace the file:

Repository/default_mod_icon.png

Requirements:

- File name must remain default_mod_icon.png
- Recommended size: 128×128 or 256×256
- Format: PNG

---

Writing Your Mod Code

Your C++ code should be placed inside:

src/

Example:

src/main.cpp

Example code:

#include <jni.h>
#include <pl/Mod.h>
#include <pl/api/Macro.h>
#include <pl/Logger.h>

PLCAPI void LeviMod_Load(JavaVM* vm, Mod mod) {
    auto& logger = pl::log::Logger::getOrCreate("Example Mod");
    logger.info("Mod {} Active", mod.getFileName());
};

---

Building the Mod

The mod is automatically built by GitHub Actions when you:

- push to the repository
- create a pull request
- manually run the workflow

The workflow will:

1. Install xmake
2. Setup Android NDK
3. Build the arm64-v8a ".so" library
4. Create a ".llmod" package
5. Upload it as a GitHub Artifact

---

Downloading the Built Mod

After the workflow finishes:

1. Go to the Actions tab
2. Open the latest workflow run
3. Download the artifact
4. Extract the ".llmod" file

---

LLMod Package Structure

The generated ".llmod" file contains:

example_mod.llmod
├ manifest.json
├ icon.png
└ libs
    └ libexample_mod.so

---

Requirements

To build locally you need:

- xmake
- Android NDK
- C++23 compatible compiler

Install xmake:

curl -fsSL https://xmake.io/shget.text | bash

---

License

You are free to use this template for your own mods.