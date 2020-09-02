# Chuck Norris Quotes

It is a tech challenge interview for Mobile Enginieer as iOS or Android native.
I've decided to do it in Flutter (this repo) and later also in iOS + Android (in this moment I dont know almost nothing!)

The description about the challenge is [challenge.md](https://github.com/GabrielRozendo/ChuckNorris_Flutter/challenge/challenge.md)

TODO:
[ ] Finalyze it
[ ] Update this readme with approach solution

## Theme

### Colors

- Colors palette generated in random mode from [coolors](https://coolors.co/eaefbd-c9e3ac-90be6d-ea9010-37371f-191919)
- Material colors generated to dart from [Material Color Generator - MCG mbitson](http://mcg.mbitson.com/#!?greenmunsell=%2300a878&lightyellow=%23f0fadc&goldcrayola=%23f3c178&orangesoda=%23fe5e41&eerieblack=%23191919&themename=PrimaryTheme)

### Fonts

- [Montserrat](https://fonts.google.com/specimen/Montserrat) for titles
- [Arvo](https://fonts.google.com/specimen/Arvo) for text

### Dark mode

Created checking color contrast: <https://coolors.co/contrast-checker>

### Some notes

test coverages...

LINUX
sudo apt-get update -qq -y
sudo apt-get install lcov -y

MAC
brew install lcov

WINDOWS
Install WSL + LINUX Commands

flutter test --coverage
(if run on Windows, need change \ for /)
cp coverage/lcov.info coverage/lcov2.info && sed 's/\\/\//g' coverage/lcov2.info > coverage/lcov.info && rm coverage/lcov2.info

genhtml coverage/lcov.info -o coverage/html
