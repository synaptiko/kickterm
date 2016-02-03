What it is?
===========
- Replacement for heavy-weight drop-down terminals like Guake/Terminator
- Simple bash script which uses `wmctrl` and `xprop` utilities
- Uses `gnome-terminal` (but can be teoretically used with any application)

What it isn't?
===============
- Full replacement of drop-down terminals
- Ambitious project

Why I did it?
=============
I've been using Guake for a long time but it wasn't perfect. I ended up with configuration which seems unnecessary to me, especially I have to keep in sync colors between Guake and Gnome Terminal (see my dotfiles). Even with this carefully assembled configuration the appearance of both terminals still looks different. It's especially visible when using Neovim.

Recently I've noticed that my usage of Guake was somehow reduced. I don't need transparency (it's nice feature but not necessary), huge amount of keybindings, width/height configuration etc. I just need to press `Ctrl+/` and see my terminal appear/disappear on the current workspace.

So I was doing research, find another heavy-weight (in the terms of dependencies) drop-down terminals with lot of options to be configured before I can use it effectively. It turned out that something really simple and minimalistic would satisfy me. It should "just work" in Gnome 3 and could use `gnome-terminal`.

Tadá, my kickterm was born.

Dependencies:
=============
- [`wmctrl` compiled with `-Y` option](https://github.com/geekless/wmctrl)
- `xprop` from `xorg-xprop` package
- `bash` and `gnome-terminal`

How to use it?
==============
- Add keybinding which will start the `kickterm.sh` script
- Press this keybinding, if terminal wasn't running in current session, new terminal window will be started and cursor will change to crosshair and let you select this new window (it's poor solution but I wasn't able to figure out better/automatic way, maybe later)
- After terminal is bound to kickterm, pressing the keybinding will toggle the state
- I would recommend to switch off the default Gnome's animations because they slow you down when toggling the terminal

Resources:
==========
- http://stackoverflow.com/questions/13280131/hexadecimal-to-decimal-in-shell-script
- http://stackoverflow.com/questions/1014822/how-to-know-which-window-has-focus-and-how-to-change-it
- http://stackoverflow.com/questions/7427262/how-to-read-a-file-into-a-variable-in-shell
- http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html
- http://stackoverflow.com/questions/17066250/create-timestamp-variable-in-bash-script
