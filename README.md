# Developer Server
---

## Flexible remote development environment

Dev Server is built off of the Code Server released from Linux Servers.

The core image is a relatively lightweight Visual Studio Code instance that has access to python3 and R, with some simple, general libraries.

Each branch, maintained separately, indicate a different niche toolkit that are desired. Easily customizable, forking the repository and adding your own packages to the image is simple by editing the package lists. Editing the VSCode settings is also simple with the provided settings.json file. All VSCode extensions are installed during image building so any extension added in the extensions file can be modified in the settings file.
