# ~/.dotfiles
[![status](https://img.shields.io/travis/Nate-Wilkins/dotfiles.svg?style=flat-square&longCache=true)](https://travis-ci.org/Nate-Wilkins/dotfiles)
[![license](https://img.shields.io/github/license/nate-wilkins/dotfiles.svg?style=flat-square&longCache=true)](https://github.com/Nate-Wilkins/dotfiles/blob/master/LICENSE)
[![spacemacs](https://img.shields.io/badge/color-spacemacs-927cba.svg?label=built%20with%20&style=flat-square&logo=spacemacs&longCache=true)](http://spacemacs.org)

> Dotfiles for my development environment. Managed with [fresh]!

## Usage

```
git clone https://github.com/nate-wilkins/.dotfiles ~/.dotfiles

chmod +x ~/.dotfiles/install.sh

sudo bash ~/.dotfiles/install.sh start
```

I've also included a container. If you're into those.

Mostly using this docker file to test against a CI server.

```
git clone https://github.com/nate-wilkins/.dotfiles ~/.dotfiles

cd ~/.dotfiles

docker build --build-arg user=nate-wilkins -t nate-wilkins/dotfiles .
```

## *Notes*

These scripts assume you are `nate-wilkins`.
It is highly recommended you clone this repository or call yourself `nate-wilkins`.

These scripts also assume a GitHub repository and a GitHub username that matches your `$(logname)` or the supplied `--user`.

These scripts also contain encrypted files that won't be relevant.
To bypass these use `install.sh --skip-encrypted`.

## TODO

- Maybe make a bit more friendlier for people who aren't me.

[script]: http://get.freshshell.com
[fresh]: http://freshshell.com
[EvE.Ubuntu]: https://github.com/nate-wilkins/EvE.Ubuntu
