# Code-Melli Checker Desktop

Desktop (Qt/Cross-platform) tool for validation Iranian National code.

## Features

- Easily check a code-melli is correct or no
- Cross paltform desktops (Windows, macOS, Linux)
- Soon...

### Preview

| Correct        | Wrong          |
| -------------- | -------------- |
| ![](screenshots/success.jpg) | ![](screenshots/error.jpg) |

### Supported and Tested platforms

- [x] macOS
- [x] Windows
- [x] Linux

### Requirements

- C++17
- Qt6 [Make sure you have Qt6]

### Installing

Use the following commands:

- PLATFORM_OS = [Windows, macOS, Linux]

```
cd build
cmake -DPLATFORM_OS="macOS" ..
make
./CodeMelli-Checker
```
