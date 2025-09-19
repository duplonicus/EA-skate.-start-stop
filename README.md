# EA Skate Start/Stop Script

A PowerShell script that intelligently toggles between starting and stopping EA Skate while managing an AutoHotkey monitor switching script.

## Features

- **Smart Toggle**: Automatically detects if Skate is running and performs the appropriate action
- **AutoHotkey Management**: Coordinates with your monitor switching script
- **Error Handling**: Validates file paths and provides clear feedback
- **Colored Output**: Easy-to-read status messages with color coding

## How It Works

### When Skate is NOT running:
1. ✋ Force closes all AutoHotkey processes
2. 🚀 Launches EA Skate via EAAntiCheat launcher
3. ✅ Confirms successful startup

### When Skate IS running:
1. ⏹️ Force closes Skate process
2. 🔄 Starts the AutoHotkey monitor switching script
3. ✅ Confirms AutoHotkey script is running

## File Paths

The script uses these default paths:

- **Skate Launcher**: `D:\SteamLibrary\steamapps\common\Skate\EAAntiCheat.GameServiceLauncher.exe`
- **AutoHotkey Script**: `C:\Users\dup\dev\monitor_switcher\switch.ahk`

## Usage

### Method 1: PowerShell Terminal
```powershell
.\EA_skate_start_stop.ps1
```

### Method 2: Right-click Context Menu
Right-click on the `.ps1` file and select "Run with PowerShell"

### Method 3: Create a Desktop Shortcut
1. Right-click on desktop → New → Shortcut
2. Enter: `powershell.exe -ExecutionPolicy Bypass -File "path\to\EA_skate_start_stop.ps1"`
3. Name it "Toggle Skate"

## Prerequisites

- **PowerShell**: Windows PowerShell 5.1 or PowerShell 7+
- **Execution Policy**: May need to allow script execution:
  ```powershell
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
  ```

## Customization

To modify the paths, edit these variables at the top of the script:

```powershell
$skatePath = "D:\SteamLibrary\steamapps\common\Skate\EAAntiCheat.GameServiceLauncher.exe"
$ahkPath = "C:\Users\dup\dev\monitor_switcher\switch.ahk"
```

## Troubleshooting

### Common Issues

**"Execution Policy" Error**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**"File not found" Errors**
- Verify the Skate installation path
- Check that the AutoHotkey script exists
- Ensure file paths use correct slashes (`\`)

**Skate won't launch**
- Try running Steam as administrator
- Verify the EAAntiCheat launcher works manually
- Check if antivirus is blocking the script

### Script Behavior

- **Process Detection**: Looks for process named "Skate" (not the launcher)
- **Force Close**: Uses `-Force` flag to ensure processes terminate
- **Timing**: Includes small delays to allow processes to start/stop properly
- **Feedback**: Provides colored console output for all operations

## Output Examples

```
=== EA Skate Start/Stop Script ===
Skate is not running. Starting it...
Stopping AutoHotkey processes...
Starting EA Skate...
EA Skate started successfully!
Script completed!
```

```
=== EA Skate Start/Stop Script ===
Skate is currently running. Stopping it...
Stopping EA Skate...
Starting AutoHotkey script...
AutoHotkey script started successfully!
Script completed!
```

## Author

Created for managing EA Skate and AutoHotkey monitor switching workflow.