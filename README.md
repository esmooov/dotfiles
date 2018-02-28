# ~/.dotfiles

[![Built with Spacemacs](https://cdn.rawgit.com/syl20bnr/spacemacs/442d025779da2f62fc86c2082703697714db6514/assets/spacemacs-badge.svg)](http://spacemacs.org)

> Dotfiles for my development environment. Managed with [fresh]!

## Usage

```
git clone https://github.com/nate-wilkins/.dotfiles ~/.dotfiles
chmod +x ~/.dotfiles/install.sh
sudo bash ~/.dotfiles/install.sh --user nate-wilkins
```

## *Note*

These scripts assume you are `nate-wilkins`.

It is highly recommended you clone this repository if you're using it with [EvE.Ubuntu]
if not it's okay to replace `nate-wilkins` with `<your-ubuntu-user>` (which assumes is your github username.)

These scripts also contain encrypted files that won't be relevant.
To bypass these use `install.sh --skip-encrypted`.

[script]: http://get.freshshell.com
[fresh]: http://freshshell.com
[EvE.Ubuntu]: https://github.com/nate-wilkins/EvE.Ubuntu
