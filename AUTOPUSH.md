# 🤖 Automatic GitHub Backups (autopush.sh)

This repository is automatically backed up to GitHub from the printer using a small file-watcher script (`autopush.sh`) and a systemd user service.

Any change inside `printer_data/config` (add, edit, move, delete) is detected and automatically:

1. Staged  
2. Committed with a descriptive message (➕ added, ✏️ updated, 🗑️ removed)  
3. Pushed to GitHub  

This provides continuous backups and a full history of configuration changes.

---

## 🔧 How It Works

- **inotifywait** watches `printer_data/config` for filesystem changes  
- Changes are **debounced** to group rapid edits into one commit  
- Git diffs are parsed to detect:
  - ➕ Added files  
  - ✏️ Modified files  
  - 🗑️ Removed files  
- A readable commit message with emojis is generated  
- Changes are pushed to GitHub using **SSH auth** (no passwords)

---

## 🛠️ Setup (Replicate This on Your Printer)

### 1) Prerequisites

```bash
sudo apt-get update
sudo apt-get install -y git inotify-tools


Ensure your Git remote uses SSH:

git remote -v
# Should be: git@github.com:USER/REPO.git


If it’s HTTPS, switch it:

git remote set-url origin git@github.com:USER/REPO.git


Add your printer’s SSH public key to GitHub:

cat ~/.ssh/id_ed25519.pub


(GitHub → Settings → SSH and GPG keys → New SSH key)

2) Create autopush.sh

Create the script at:

~/printer_data/autopush.sh


Make it executable:

chmod +x ~/printer_data/autopush.sh


The script watches printer_data/config and auto-commits/pushes changes.
See autopush.sh in this repo for the current implementation.

3) Create the systemd User Service

Create:

~/.config/systemd/user/klipper-config-autopush.service


Example service file:

[Unit]
Description=Auto commit & push Klipper config to GitHub

[Service]
ExecStart=%h/printer_data/autopush.sh
Restart=always
RestartSec=3
WorkingDirectory=%h/printer_data

[Install]
WantedBy=default.target


Enable and start:

systemctl --user daemon-reload
systemctl --user enable --now klipper-config-autopush.service


Check status:

systemctl --user status klipper-config-autopush.service


You should see: Active: active (running).

🧪 Test
mkdir -p ~/printer_data/config/_autopush_test
touch ~/printer_data/config/_autopush_test/test.txt


Within a few seconds, the change should appear on GitHub.
Clean up:

rm -rf ~/printer_data/config/_autopush_test

⚠️ Notes & Caveats

Git does not track empty folders (use a file like .gitkeep if needed)

Only printer_data/config is tracked by design

Avoid placing autopush.sh inside config/ (prevents self-trigger loops)

If GitHub is temporarily unreachable, pushes retry on the next change

Commit spam can be reduced by increasing the debounce delay in autopush.sh

🧯 Troubleshooting

Service not running

systemctl --user status klipper-config-autopush.service
journalctl --user -u klipper-config-autopush.service --no-pager -n 50


inotifywait not found

sudo apt-get install -y inotify-tools


git push fails

Ensure SSH remote is used (git@github.com:...)

Ensure the printer’s SSH key is added to GitHub

Folder changes not committing

Git does not track empty folders; add a file inside

💡 Why This Is Useful

Automatic off-printer backups

Full version history of config changes

Easy rollback when tuning breaks things

Quick recovery after SD card failures
