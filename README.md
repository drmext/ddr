# DDR/IIDX ARCADE

## Decryption
[drmfs](https://github.com/YoshihikoAbe/eapki)

[extdrm](https://github.com/YoshihikoAbe/extdrm)

[archives](https://github.com/YoshihikoAbe/packagetool)

## Loader / IO Emulation
[spice2x](https://github.com/spice2x/spice2x.github.io)

[Bemanitools 5](https://github.com/djhackersdev/bemanitools)

## Server Emulation
[MonkeyBusiness](https://github.com/drmext/MonkeyBusiness)

[Asphyxia](https://github.com/asphyxia-core/core) [+ ddr plugin](https://github.com/22vv0/asphyxia_plugins/tree/mdx) [+ iidx plugin](https://github.com/duel0213/asphyxia-plugins/tree/stable)

[bemaniutils](https://github.com/DragonMinded/bemaniutils)

## Hex Edit Mod Patches
[Forbidden BemaniPatcher/sp2xpatcher](https://github.com/drmext/BemaniPatcher/tree/nopr)

[Original BemaniPatcher](https://github.com/mon/BemaniPatcher)

## Modding DDR
[arc](https://github.com/drmext/arc)

[ifs](https://github.com/mon/ifstools)

[ifs_layeredfs](https://github.com/mon/ifs_layeredfs)

[documentation](https://github.com/SaxxonPike/rhythm-game-formats)

[ssq](https://github.com/SaxxonPike/scharfrichter)

[ssq](https://github.com/SaxxonPike/RhythmCodex)

[automate example](https://github.com/drmext/ddr-datatools)

[texconv.exe](https://github.com/microsoft/DirectXTex/releases) `-nologo -w 192 -h 192 -dx9 -f DXT1 -m 1`

[vgmstream-cli.exe](https://github.com/vgmstream/vgmstream/releases) `bgm_menu.xwb -i -w -o ?n -S 0`

[XACT v2.0](https://archive.org/details/dxsdk_aug2007):
```
File -> New Project -> (name it whatever)
Right click Compression Presets -> New Compression Preset (leave it default - Windows ADPCM 128 Samples Per Block)
Right click Wave Banks -> New Wave Bank (name it bgm_menu, or whatever else matches what you are modding)
Bottom left when the Wave Bank is selected, Check Friendly Names, Type -> Streaming, Compression -> Compression Preset (that you just created)
the order in which you add the files to the sound bank matters for the index? (drag and drop the files extracted with vgmstream-cli, in the right order of the index - you can also rename and change the file later)
to find the index order, run vgmstream-cli.exe bgm_menu.xwb -i -w -o ?n -S 0 -m -I
File -> Build (F7)
this output bgm_menu.xwb should play in game
```

## Modding IIDX
[mdb](https://github.com/drmext/iidx-datatools)

[s3p](https://github.com/mon/s3p_extract)

[omnifix](https://github.com/aixxe/omnifix)

[2dx-gsm](https://github.com/aixxe/2dx-gsm)
