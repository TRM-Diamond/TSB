# TSB Dash Overlay
A lightweight AutoHotkey overlay that displays real-time cooldown indicators for dash moves


 <!-- you can add a real screenshot later -->

Features
Always-on-top semi-transparent bars that don’t block mouse clicks

Two independent timers:

Side Dash (2 s cooldown) – right/left dash (A+Q / D+Q)

Front/Back Dash (5 s cooldown) – forward/backward dash (Q / W+Q / S+Q)

Only activates when Roblox window is in focus – safe to type or alt-tab

Spam‑proof: built‑in animation blocking prevents false triggers (adjustable duration)

Minimal CPU usage, runs silently in the system tray

How it works
The script monitors the Q key and checks which movement keys are held down.
When a valid dash combo is detected and the cooldown is ready, the corresponding progress bar resets and refills over its cooldown period.
If the dash is on cooldown or still blocked by its own animation, the keypress is ignored.

The overlay is drawn using AutoHotkey’s native GUI – no external dependencies.

Setup!

Install AutoHotkey v1.1 (https://www.autohotkey.com/download/ahk-install.exe)

Download TSB_Dash_Overlay.ahk and double‑click to run or just download the compiled .exe file

Launch Roblox (windowed or borderless) – the bars appear at the top-centre of your screen

Press Insert or right‑click the tray icon to exit
