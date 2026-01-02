# Path to battery info
BATTERY_PATH="/sys/class/power_supply/BAT0"

# Get battery percentage and status
PERCENT=$(cat "$BATTERY_PATH/capacity")
STATUS=$(cat "$BATTERY_PATH/status")

# Only notify if discharging
if [ "$STATUS" != "Discharging" ]; then
  exit 0
fi

# File to store last notified threshold
STATE_FILE="$HOME/.battery_notify_state"

# Read last threshold notified (default 100)
LAST_NOTIFIED=$(cat "$STATE_FILE" 2>/dev/null || echo 100)

# Determine current threshold
if [ "$PERCENT" -le 10 ]; then
  CURRENT_THRESHOLD=10
elif [ "$PERCENT" -le 15 ]; then
  CURRENT_THRESHOLD=15
elif [ "$PERCENT" -le 20 ]; then
  CURRENT_THRESHOLD=20
else
  CURRENT_THRESHOLD=100
fi

# Notify only if we crossed a threshold
if [ "$CURRENT_THRESHOLD" -lt "$LAST_NOTIFIED" ]; then
  case $CURRENT_THRESHOLD in
  10)
    notify-send -u critical "Battery critically low!" "$PERCENT% remaining"
    ;;
  15)
    notify-send -u normal "Battery very low" "$PERCENT% remaining"
    ;;
  20)
    notify-send -u low "Battery low" "$PERCENT% remaining"
    ;;
  esac
  echo "$CURRENT_THRESHOLD" >"$STATE_FILE"
elif [ "$CURRENT_THRESHOLD" -gt "$LAST_NOTIFIED" ]; then
  # Reset threshold if battery went back up
  echo "$CURRENT_THRESHOLD" >"$STATE_FILE"
fi
