# EA Skate Start/Stop Script
# Toggles between starting and stopping Skate game
# Also manages AutoHotkey script accordingly

# Define paths
# $skatePath = "D:\SteamLibrary\steamapps\common\Skate\EAAntiCheat.GameServiceLauncher.exe"
$ahkPath = "C:\Users\dup\dev\monitor_switcher\switch.ahk"

# Function to check if Skate is running
function Test-SkateRunning {
    $skateProcess = Get-Process -Name "Skate" -ErrorAction SilentlyContinue
    return $null -ne $skateProcess
}

# Function to force close AutoHotkey
function Stop-AutoHotkey {
    Write-Host "Stopping AutoHotkey processes..." -ForegroundColor Yellow
    Get-Process -Name "AutoHotkey*" -ErrorAction SilentlyContinue | Stop-Process -Force
    Start-Sleep -Seconds 1
}

# Function to start Skate
function Start-Skate {
    Write-Host "Starting EA Skate..." -ForegroundColor Green
    
    # Check if Skate executable exists
    <# if (-not (Test-Path $skatePath)) {
        Write-Host "ERROR: Skate executable not found at: $skatePath" -ForegroundColor Red
        return
    } #>
    
    # Force close AutoHotkey first
    Stop-AutoHotkey
    
    # Start Skate
    Start-Process "steam://run/3354750"
    Write-Host "EA Skate started successfully!" -ForegroundColor Green
}

# Function to stop Skate and start AutoHotkey
function Stop-Skate {
    Write-Host "Stopping EA Skate..." -ForegroundColor Yellow
    
    # Stop Skate process
    Get-Process -Name "Skate" -ErrorAction SilentlyContinue | Stop-Process -Force
    Start-Sleep -Seconds 2
    
    # Start AutoHotkey script
    Write-Host "Starting AutoHotkey script..." -ForegroundColor Green
    
    # Check if AutoHotkey script exists
    if (-not (Test-Path $ahkPath)) {
        Write-Host "WARNING: AutoHotkey script not found at: $ahkPath" -ForegroundColor Yellow
        return
    }
    
    Start-Process -FilePath $ahkPath
    Write-Host "AutoHotkey script started successfully!" -ForegroundColor Green
}

# Main logic
Write-Host "=== EA Skate Start/Stop Script ===" -ForegroundColor Cyan

if (Test-SkateRunning) {
    Write-Host "Skate is currently running. Stopping it..." -ForegroundColor Yellow
    Stop-Skate
} else {
    Write-Host "Skate is not running. Starting it..." -ForegroundColor Green
    Start-Skate
}

Write-Host "Script completed!" -ForegroundColor Cyan
Start-Sleep -Seconds 2