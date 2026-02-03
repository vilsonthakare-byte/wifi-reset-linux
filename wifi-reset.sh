#!/usr/bin/env bash
set -e

echo "[+] Resetting Wi-Fi and network services..."

sudo rfkill unblock all || true
sudo systemctl stop NetworkManager || true
sudo systemctl start NetworkManager || true

sudo nmcli networking off || true
sleep 2
sudo nmcli networking on || true

sudo systemctl restart wpa_supplicant || true

echo "[✓] Wi-Fi reset complete."

