#!/usr/bin/env bash
#
# bluetooth_status.sh
#
# Checks if any Bluetooth device is currently connected (via bluetoothctl).
# Prints a “connected” icon + device name if so; otherwise prints a “disconnected” icon.
#
# Make sure this file is executable: chmod +x ~/.config/polybar/scripts/bluetooth_status.sh

# ──────── Icons ───────────────────────────────────────────────────────────────
# You can replace these with whichever glyphs your font supports.
ICON_CONNECTED=""      # e.g. a Bluetooth‐on icon (Font Awesome / Nerd Font)
ICON_DISCONNECTED=""   # e.g. a Bluetooth‐off icon

# ──────── 1) Gather all “known” devices (MAC → friendly name) ───────────────────
# We'll use an associative array dev_names[MAC]="name"
declare -A dev_names

while IFS=" " read -r keyword mac rest_of_line; do
  # Expect lines like: "Device AA:BB:CC:DD:EE:FF My_Speaker_Name"
  #   • keyword should be “Device”
  #   • mac should look like XX:XX:XX:XX:XX:XX
  #   • rest_of_line is everything after the MAC (the device’s “friendly” name)
  if [[ "$keyword" != "Device" ]]; then
    continue
  fi

  # Basic sanity check: mac must be nonempty and match Bluetooth MAC pattern
  if [[ -z "$mac" || ! "$mac" =~ ^([[:xdigit:]]{2}:){5}[[:xdigit:]]{2}$ ]]; then
    continue
  fi

  dev_names["$mac"]="$rest_of_line"
done < <(bluetoothctl devices 2>/dev/null)

# ──────── 2) For each MAC, check if it’s currently “Connected: yes” ────────────
for mac in "${!dev_names[@]}"; do
  # Get the “info” block for this MAC; suppress errors if it’s not known to bluetoothctl
  info_out=$(bluetoothctl info "$mac" 2>/dev/null)

  # If “Connected: yes” appears in that info text, we've found a connected device
  if grep -q "Connected: yes" <<< "$info_out"; then
    # Print the “connected” icon + (optional) device name
    printf "%s %s\n" "$ICON_CONNECTED" "${dev_names[$mac]}"
    exit 0
  fi
done

# ──────── 3) If we reach here, no device is connected ──────────────────────────
printf "%s\n" "$ICON_DISCONNECTED"
exit 0
