# ramlmn's dotfiles
A slightly strip down customized dotfiles by [alrra](https://github.com/alrra),
[mathias](https://github.com/mathiasbynens), and [paulirish](https://github.com/paulirish)
specifically tailored for use in Bash-on-Windows (aka. Linux Sub-System for Windows, aka.
Bash-on-Ubuntu-on-Windows, aka. WSL, whatever...).

## Installation
``` bash
$ git clone https://github.com/ramlmn/.dotfiles.git
$ cd .dotfiles
$ ./init.sh
```

## Configuration

### Sensible
The `sensible/` directory contains `init.sh` which is used to run some sensitive tasks (like
configuring Git and adding GPG keys). So, mine are excluded (😉) and so should be yours.

### Colors
* Vim is preconfigured to use [one-dark](https://github.com/AlexMax/.vim/blob/master/colors/one.vim)
  theme by AlexMax.
* Suggested colors for customizing `cmd.exe`

  Color        | Hex           | RGB
  -------------|---------------|----------------
  Black        | `#282c34`     | `40, 44, 52`
  Blue         | `#61afef`     | `97, 175, 239`
  Green        | `#68de8a`     | `104, 222, 138`
  Cyan         | `#1ec2c8`     | `30, 194, 200`
  Red          | `#d65a51`     | `214, 90, 81`
  Magenta      | `#f45cb8`     | `244, 92, 184`
  Yellow       | `#e5d75b`     | `229, 215, 91`
  Light Black  | `#d0d0d0`     | `208, 208, 208`
  Dark Black   | `#808080`     | `128, 128, 128`
  White        | `#ffffff`     | `255, 255, 255`

### Screenshots
| Installation                                                                | Vim                                                      |
| --------------------------------------------------------------------------- | -------------------------------------------------------- |
| ![Screenshot of installation](media/init.png "Screenshot of installation")  | ![Screenshot of vim](media/vim.png "Screenshot of vim")  |

| tmux                                                       |
| ---------------------------------------------------------- |
| ![Screenshot of tmux](media/tmux.png "Screenshot of tmux") |

## Acknowledgements
Inspiration and code was intentionally stolen from many sources, including:

* [Cătălin Mariș dotfiles](https://github.com/alrra/dotfiles)
* [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Paul Irish's dotfiles](https://github.com/paulirish/dotfiles)
* ...and other forgotten sources on the internet

## License
Licensed under [MIT](LICENSE)
