# 🖨️ Voron 2.4 – Klipper Configuration (Stealthburner)

This repository contains my personal **Klipper configuration** for my **Formbot Voron 2.4** running a **Stealthburner** toolhead.  
The structure mirrors my printer’s `printer_data/config` directory and is automatically backed up to GitHub whenever changes are made on the printer.

<!-- STATS:START -->

## 📊 Live Printer Stats

- ⏱️ **Total print time:** 586h 22m 40s
- 🏁 **Longest print:** 28h 15m 13s
- ⚖️ **Average print:** 1h 56m 29s
- 🧵 **Total filament used:** 4540.5 m
- 🧾 **Total jobs:** 302

_Last updated: 2026-03-12 21:15:01

<!-- STATS:END -->

## 🧰 Background Services

<!-- HEARTBEAT:START -->

- 🔄 Config AutoPush: ⏳ unchanged
- 📊 Stats Snapshot: ✅ last seen 2026-03-12 21:15:01

<!-- HEARTBEAT:END -->


## 🛣️ Roadmap

Planned upgrades and wishlist items are tracked as GitHub Issues with the `roadmap` label:  
👉 https://github.com/holewijn/Formbot-Voron-2.4-350/issues?q=label:roadmap

## 📁 Repository Structure

config/
├── printer.cfg
├── mainsail.cfg
├── moonraker.conf
├── crowsnest.conf
├── KlipperScreen.conf
├── toolhead.cfg
├── fans.cfg
├── bedfans.cfg
├── bed_mesh.cfg
├── object-exclude.cfg
├── TM3950.cfg
├── sonar.conf
├── stealthburner-0.4.cfg
├── stealthburner_leds.cfg
├── KAMP_Settings.cfg
├── KAMP/
└── macros/


> At the moment, only **macros** are organized into a subfolder.  
> The rest of the configuration files are kept at the root of `config/` for simplicity and gradual refactoring.

## 🔄 Automatic Backups

This repository is automatically kept in sync from the printer:

- Changes inside `printer_data/config` are auto-committed and pushed to GitHub  
- Commit messages indicate whether files were ➕ added, ✏️ updated, or 🗑️ removed  
- Provides a full change history of tuning, hardware changes, and macro edits  

This makes it easy to roll back changes or recover configs after a crash or SD card failure.

md
## 🤖 Auto Backups

This repo is automatically backed up from the printer.  
See **[AUTOPUSH.md](./AUTOPUSH.md)** for setup details

## 🧰 Hardware & Mods

- **Printer:** Voron 2.4  
- **Toolhead:** Stealthburner  
- **Screen/UI:** KlipperScreen + Mainsail  
- **Bed Leveling:** Bed mesh  
- **Extras:**  
  - KAMP (adaptive meshing)  
  - Stealthburner LEDs  
  - Object Exclude  
  - Sonar (if enabled)

## ⚠️ Disclaimer

These configurations are **hardware-specific** and tuned for my machine.  
If you use anything from this repo as reference:

- Double-check pin assignments  
- Verify thermistors, heaters, and safety limits  
- Review stepper directions and endstops  
- Do **not** blindly copy PID values or probe offsets  

Use as reference, not as plug-and-play.

## 💡 Why This Repo Exists

- Automatic backups of Klipper configs  
- Track configuration changes over time  
- Easy recovery after failures or upgrades  
- Share macros and configuration patterns  

## 🗺️ Future Organization (Planned)

Over time, this repo may be further organized into folders like:

hardware/
calibration/
ui/


For now, only `macros/` is grouped to keep changes low-risk while the setup evolves.
