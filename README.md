# amstrad-diagnostics
A suite of diagnostic tests for the Amstrad CPC, Amstrad Plus and Amstrad GX4000.

It performs several diagnostic tests:
* Lower 64KB RAM
* Upper RAM
* System ROMs
* Keyboard
* Detect CRTC model

![image](/images/MainMenu.png)

[Check the Wiki for details](https://github.com/llopis/amstrad-diagnostics/wiki)

# Downloading
More information in the [download page](https://github.com/llopis/amstrad-diagnostics/wiki/Downloads)

# Support and Development
Come join the Discord server https://discord.gg/ETcCh6J﻿ and look for the amstrad-diagnostics channel.


# Credits

Project created and maintained by Noel Llopis. Many people contributed code and ideas to this project: Brendan Alford, Gérald Vincent, Kevin Thacker, Rhino, KaosOverride, Spirax.

# Build Instructions
## Required build environment
- https://github.com/z00m128/sjasmplus
- A linux system to build the roms, Ubuntu for Windows works well on Windows10, but you can do that also with MacOS or Window natively (not covered here)
- The development toolchain (Ubuntu: sudo apt-get build-essential)
- install git (Ubuntu: sudo apt-get git)

## Prepare sjasmplus
Download the sources of sjasmplus from github.
Extract tarball archive and go to extracted folder. Edit install path `PREFIX` in file `Makefile` according your preferences (default `/usr/local`). Run following commands:

	make clean
	make

Then run as root or use sudo:

	sudo make install

## Build the images
1. Clone the repository
```
git clone https://github.com/llopis/amstrad-diagnostics.git
```
2. Compile the assembler sources
```  
  cd amstrad-diagnostics
  ./build.sh
```

  The output should look like that:
```
amstrad-diagnostics$ ./build.sh
>Upper ROM build
> Lower ROM build
> RAM build
> Lower ROM build
> Total size: 0x37A5
> RAM size: 0x0443
```
3. You can also build specific Roms, like the lower ROM only:
```
mkdir build

sjasmplus --nologo --msg=war -DLowerROMBuild=1 -DPRINT_PROGRAM_SIZE=1 -DOutFile=build/AmstradDiagLower.rom \
  --lst=build/AmstradDiagLower_list.txt  src/Main.asm
```
  
## Other build options:
1. Upper ROM build (started via RSX command |DIAG)

  ```
  sjasmplus --nologo --msg=war -DUpperROMBuild=1 -DOutFile=build/AmstradDiagUpper.rom \
    --lst=build/AmstradDiagUpper_list.txt src/Main.asm
  ```
  
2. Cartridge build
```
sjasmplus --nologo --msg=war -DCartridgeBuild=1 -DOutFile=build/AmstradDiag.cpr --lst=build/AmstradDiagCPR_list.txt src/Main.asm
```

3. RAM build
  This file can be loaded from disk or tape to CPC memory and called via run "diag.bin"
```
sjasmplus --nologo --msg=war -DRAMBuild=1 -DOutFile=build/diag.bin --lst=build/AmstradDiagDSK_list.txt src/Main.asm
```  
  
