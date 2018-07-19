# dotfiles

## Installation
``` bash
$ git clone https://github.com/notlmn/.dotfiles.git
$ cd .dotfiles
$ ./src/os/setup.sh
```

## Configuration

### Local settings
The `dotfiles` can be easily extended to run additional commands to be run at the end of setup by
adding them to `./src/os/sensible/main.sh` file.

### Colors
* Vim uses [one-dark](https://github.com/AlexMax/.vim/blob/master/colors/one.vim) theme by AlexMax.
* Terminal colors ([snazzy](https://github.com/sindresorhus/hyper-snazzy) theme by Sindre Sorhus)

  Color        | Hex           | RGB
  -------------|---------------|----------------
  Black        | `#282a36`     | `40, 42, 54`
  Blue         | `#57c7ff`     | `87, 199, 255`
  Green        | `#5af78e`     | `90, 247, 142`
  Cyan         | `#9aedfe`     | `154, 237, 254`
  Red          | `#ff5c57`     | `255, 92, 87`
  Magenta      | `#ff6ac1`     | `255, 106, 193`
  Yellow       | `#f3f99d`     | `243, 249, 157`
  Light Black  | `#686868`     | `104, 104, 104`
  Dark Black   | `#808080`     | `128, 128, 128`
  White        | `#f1f1f0`     | `241, 241, 240`

## Screenshots

### Installation and Vim
<table>
  <tbody>
    <tr>
      <td>
        <img src="media/init.png" alt="Screenshot of installation process" width="100%">
      </td>
      <td>
        <img src="media/vim.png" alt="Screenshot of Vim" width="100%">
      </td>
    </tr>
    <tr align="center">
      <td>Installation</td>
      <td>Vim</td>
    </tr>
  </tbody>
</table>

### tmux
<table>
  <tbody>
    <tr>
      <td>
        <img src="media/tmux.png" alt="Screenshot of tmux" width="100%">
      </td>
    </tr>
    <tr align="center">
      <td>Vim</td>
    </tr>
  </tbody>
</table>

## Acknowledgements
Inspiration and code was intentionally stolen from many sources, including:

* [Cătălin Mariș dotfiles](https://github.com/alrra/dotfiles)
* [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Paul Irish's dotfiles](https://github.com/paulirish/dotfiles)
* ... and other forgotten sources on the Internet

## License
Licensed under [MIT](LICENSE)
