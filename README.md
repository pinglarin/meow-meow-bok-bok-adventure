# MeowMeow BokBok Advanture

ITCS424's term project. A mobile application written in Flutter that uses Unity in the game part.

## Getting started

### Dependencies

- Flutter (tested on 3.7.0 on Dart 2.19.0)
- Unity3D (tested on 2021.3.22f1)
- Whole Android build tools (NDK, JAVA)
- Firebase
- A lot of time (because you gonna failed to build it a lot)

### Installation process

#### Unity app compilation

1. Clone our Unity project from [this link](https://drive.google.com/drive/folders/14BXlUp-Io1uhbDFLayVoEXiOd-QqsBtY?usp=share_link).
2. Follow the Setup of [juicycleff/flutter-unity-view-widget](https://github.com/juicycleff/flutter-unity-view-widget) for android to get `android/unityLibrary`.

#### Firebase Realtime database setup

You may open Firebase Realtime database yourself, have a look in [realtime database tutorial for flutter](https://firebase.google.com/docs/database/flutter/start).

#### Run

(We recommended to) Connect the android phone to the computer.

For debug build

```bash
flutter run
```

The application can't ran on system with x86 architecture (if you persist, you can run on arm64 emulator from android studio which is painfully slow).

## Authors

- 6388003 Phuriwat Angkoondittaphong
- 6388102 Napahatai Sittirit
