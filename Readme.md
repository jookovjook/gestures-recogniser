![Gestures recongiser](https://raw.githubusercontent.com/jookovjook/gestures-recogniser/master/images/Art.png)

Ultimate cursor gestures recogniser.

- [Introduction](#introduction)
- [Features](#features)
- [Requirements](#requirements)
- [Communication](#communication)
- [Installation](#installation)
- [Overview](#overview)
    - [Run program](#run-program)
    - [Move cursor](#move-cursor)
    - [Notification](#notification) 
- [Add Own Patterns](#add-own-patterns)
- [Credits](#credits)
- [Donations](#donations)
- [License](#license)

## Introduction


Gesture Recognizer (GR) is a program that tracks all movements of your cursor and indicates prescripted patterns of cursor movements (such as circled movement, zig-zag movement, etc.). GR can be installed on macOS X.

## Features

- [x] Background monitoring all movements of your cursor
- [x] Finding prescripted patterns of cursor movements
- [x] You can add unlimited amount of your own patterns
- [x] Showing notifications when a pattern was spotted

## Requirements

- macOS 10.11 +
- xCode 9.0 +

## Communication

- If you **need help**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/jookovjook). (Tag 'jookovjook')
- If you'd like to **ask a general question**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/jokovjook).
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Installation

Firstly clone [gestures-recognizer](https://github.com/jookovjook/gestures-recogniser) to your Mac.

```bash
$ git clone https://github.com/jookovjook/gestures-recogniser
```

`Build` project and `Run` it.

## Overview

### Run program

• Run GR program

<img src="https://raw.githubusercontent.com/jookovjook/gestures-recogniser/master/images/mainwindow.png" width="592">

••• (!!!) Minimise GR and focus cursor on any other window or Desktop.

### Move cursor

• Make one of the prescript movements with your cursor

<img src="https://raw.githubusercontent.com/jookovjook/gestures-recogniser/master/images/gesture4.png" width="592">

### Notification

• After you made one of the prescripted gestures, you will see a notification with gesture recognised.

<img src="https://raw.githubusercontent.com/jookovjook/gestures-recogniser/master/images/notif.png" width="480">

## Add Own Patterns

There are 4 patterns (gestures) created in current project, but can add your own. As many as you wish!

To add your own pattern, edit `Utils.swift` the next way:

Add `x` and `y` arrays of your pattern. In these arrays nodes of a pattern are encoded.

```Swift
let gn_x : [CGFloat] = [1, 0.5, 0.5, 0]
let gn_y : [CGFloat] = [0, 1, 0, 1]
```

Add the constant for your gesture ro enum `Gestures`:

```Swift
case g1
```

Add your patter to `compare` and `compareWith` functions.

Add your pattern to `movementHandler` function.

DONE.


## Credits

Created by [jookovjook](https://github.com/jookovjook).

[vk.com/jookovjook](https://vk.com/jookovjook)

[fb.com/jookovjook](https://fb.com/jookovjook)

[t.me/jookovjook](https://t.me/jookovjook)
    
You are welcome to participate the project!

## Donations

I'll be gratefull if you donate some funds to my `Etherium wallet`:

```
0x9B9a7B954E4c634b200Be98aa602b7ee9006b05B
```

## License

Gestures Recogniser is released under the Apache 2.0 license.

    Copyright 2018 JookovJook
    
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    
        http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
