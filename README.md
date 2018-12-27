# KANJI - Mobile Quiz Game

[![N|Solid](https://github.com/Brend0n/kanjis-quiz/blob/master/graphics/flutter_logo.png?raw=true)](https://flutter.io)

![Flutter Version](https://img.shields.io/badge/Flutter-1.0.1-green.svg) ![Dart Version](https://img.shields.io/badge/Dart-2.21.1-green.svg) [![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

This mobile application has been build using the Dart Language, and the Flutter Framework.

# The APP!

Test your Japanese vocabulary knowledge and train for the Japanese 'JLPT' test.
![N|Solid](https://github.com/Brend0n/kanjis-quiz/blob/master/graphics/kanji_app_screenshots.png?raw=true)]

# Prerequisite

Before starting using this project I highly recommends you to use VSCode editor for development. The following Setup uses VSCode as example, but note that you can also uses Android Studio as well (.

# Setup

### Install the Flutter SDK

```sh
$ cd ~/development
$ unzip ~/Downloads/flutter_macos_v1.0.0-stable.zip
```

Then add the Flutter path to your environement:

```
$ export PATH=$PATH:`pwd`/flutter/bin
```

To check your installation you can now use the flutter doctor command:

```
$ flutter doctor
```

### Setting up your code editor

[![N|Solid](https://github.com/Brend0n/kanjis-quiz/blob/master/graphics/VSCode.png?raw=true)](https://code.visualstudio.com/)
Install the Dart and Flutter plugin for VSCode:

- Start VS Code.
- Invoke View > Command Palette….
- Type “install”, and select Extensions: Install Extensions.
- Type “flutter” in the extensions search field, select Flutter in the list, and click Install. This also installs the required Dart plugin.
- Click Reload to Activate to reload VS Code.

You can check if the Plugins are correctly working by:

- Invoke View > Command Palette… (or Cmd + Shift + P)
- Type “doctor”, and select the Flutter: Run Flutter Doctor.
- Review the output in the OUTPUT pane for any issues.

# To run the application

You need to either start an emulator (ios or android), or connect a phone with the developper mode enabled to your computer.
You can check if you see the phone connected on the bottom right corner of the VSCode window. You can also click this area to start an emulator.

```
$ flutter run
```

# Data

The data that this app uses to run, are sored in the JSON format and the files are accessible in the assets folder.

> This app doesn't require any internet connection to run.

# Useful Ressources:

- https://www.dartlang.org/
- https://flutter.io/docs/get-started/install
- https://youtu.be/jBBl1tYkUnE
