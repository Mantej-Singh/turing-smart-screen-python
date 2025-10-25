# ![Icon](https://raw.githubusercontent.com/mathoudebine/turing-smart-screen-python/main/res/icons/monitor-icon-17865/24.png) Mantej's Fork of turing-smart-screen-python

## ⚠️ DISCLAIMER - PLEASE READ ⚠️

I am not affiliated with the original creators of this project or any of the hardware manufacturers mentioned. This fork is a personal project to customize the software for my own use. I am sharing my modified version of the theme and the associated code changes for anyone who might find them useful. This is not a promotion of any product or project.

This is a fork of the original [turing-smart-screen-python](https://github.com/mathoudebine/turing-smart-screen-python) repository. Please refer to the original repository for initial setup and instructions.

---

![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logoColor=white&logo=data:image/svg%2bxml;base64,PHN2ZyByb2xlPSJpbWciIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48dGl0bGU+V2luZG93czwvdGl0bGU+PHBhdGggZmlsbCA9ICIjRkZGRkZGIiBkPSJNMCwwSDExLjM3N1YxMS4zNzJIMFpNMTIuNjIzLDBIMjRWMTEuMzcySDEyLjYyM1pNMCwxMi42MjNIMTEuMzc3VjI0SDBabTEyLjYyMywwSDI0VjI0SDEyLjYyMyIvPjwvc3ZnPg==) ![Python](https://img.shields.io/badge/Python-3.9/3.13-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54) [![Licence](https://img.shields.io/github/license/mathoudebine/turing-smart-screen-python?style=for-the-badge)](./LICENSE)
  

## 💓 My Setup

I am using this forked project for my **Turing Smart Screen 3.5"** which I purchased from AliExpress.


<!--  resized display using HTML -->
<img src="res/themes/LandscapeMagicBlue/sample%20images/Screenshot2-AliExpress.png" alt="AliExpress Cart" width="420" />


*   **Device:** [Turing Smart Screen 3.5"](https://www.aliexpress.us/item/3256806984423143.html)
*   **Theme:** `LandscapeMagicBlue`

Instead of using the seller's software, I have forked this project to make my own customizations.

## My Customizations

This fork focuses on a single theme, `LandscapeMagicBlue`, with the following modifications:

*   **Drive Letter:** Changed the drive letter display to "Jarvis(C)".
*   **M.2 Drives:** Added monitoring for M.2 drives.
*   **RAM Usage:** Displays RAM usage.
*   **GPU RAM Usage:** Displays GPU RAM usage.
*   **Startup Time:** Added a display for system startup time.
*   **Network Graph:** Included a line graph for network activity.
*   **CPU Load Graph:** Included a line graph for CPU load.
*   **Units:** Changed memory units from MB to GB for a clearer reading.

### Theme Preview

![LandscapeMagicBlue Theme Preview](res/themes/LandscapeMagicBlue/sample%20images/Screenshot1.png)

## How to Run

To run the monitor with my customizations, I use the `start-turing-monitor.bat` file. This batch file executes the `main.py` script with the necessary parameters, my complete project is under `C:\Tweeks\3.5inch mini Display` folder

For convenience, I have also created a shortcut to this batch file which is configured to "Run as administrator". This is required for the script to access hardware information.

Alternatively, the `main.py` script can be compiled into an `.exe` file for easier execution using PyInstaller.




<!--> python configure.py -->
<img src="res/themes/LandscapeMagicBlue/sample%20images/Screenshot3-Myconfig.png" alt="My Configuration" width="750" />


## Technical Decisions

### Local `LibreHardwareMonitor` DLLs

This project relies on the `LibreHardwareMonitor` library to gather hardware sensor data. To ensure portability and avoid issues with external dependencies and long file paths on Windows, the required DLLs are included directly in this repository under the `external/LibreHardwareMonitor` directory.

The `sensors_librehardwaremonitor.py` script has been modified to load these DLLs using an absolute path at runtime. This makes the project self-contained and removes the need for any separate installation of `LibreHardwareMonitor` or other applications like `FanControl`.

The following DLLs are used:

*   **`LibreHardwareMonitorLib.dll`**: The core library for accessing hardware sensors.
*   **`HidSharp.dll`**: Used for communication with USB HID devices, which can include some hardware monitoring components.
*   **`RAMSPDToolkit-NDD.dll`**: Provides functionality to read SPD (Serial Presence Detect) data from RAM modules, allowing for detailed memory information.
*   **`System.Memory.dll`, `System.Buffers.dll`, `System.Runtime.CompilerServices.Unsafe.dll`, `System.Numerics.Vectors.dll`**: These are fundamental .NET libraries that `LibreHardwareMonitorLib.dll` depends on for its operation.


## How Stuff works

Here is a simplified tree diagram of the main files and directories required to run this project, with a short explanation of each item:


```
C:\Tweeks\3.5inch mini Display\
├── main.py                      # Main script to start the application (requires admin)
├── start-turing-monitor.bat     # Shortcut to run main.py as administrator
├── requirements.txt             # Python dependencies
├── config.yaml                  # Primary configuration file
├── library\
│   ├── display.py               # Manages drawing on the screen
│   ├── stats.py                 # Gathers system statistics to display
│   └── sensors\
│       └── sensors_librehardwaremonitor.py  # Loads LibreHardwareMonitor DLLs and reads sensors
├── res\
│   └── themes\
│       └── LandscapeMagicBlue\  # Custom theme files used by the monitor
└── external\
    └── LibreHardwareMonitor\    # Bundled DLLs required for hardware monitoring
```

  In essence, main.py starts the application, reads the config.yaml and theme files, and then uses the code in the library directory to get system stats and draw them on the display. The external directory provides the necessary hardware monitoring capabilities.


## Troubleshooting
If you have trouble running the program as described in the wiki, please check [open/closed issues](https://github.com/mathoudebine/turing-smart-screen-python/issues) & [the wiki Troubleshooting page](https://github.com/mathoudebine/turing-smart-screen-python/wiki/Troubleshooting) from the main project 

A `log.log` file is also created by the application's own logging system, which is configured in `library/log.py`

```
1 RotatingFileHandler("log.log", maxBytes=1000000, backupCount=0),  # Log in textfile max 1MB
```

 This is a standard way for Python applications to keep a record of their operations, warnings, and errors.