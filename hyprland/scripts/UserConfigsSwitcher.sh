#!/usr/bin/env bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script to manage configs backups

HYPR_CONFIG_DIR="$HOME/.config/hypr"
CONFIGS="$HYPR_CONFIG_DIR/configs"
CONFIGS_BAK="$HYPR_CONFIG_DIR/configsBak"

if [ -d "$CONFIGS" ] && [ ! -d "$CONFIGS_BAK" ]; then
  echo "Moving configs to configsBak..."
  mv "$CONFIGS" "$CONFIGS_BAK"
  echo "Done. Your configs are now in configsBak."
elif [ ! -d "$CONFIGS" ] && [ -d "$CONFIGS_BAK" ]; then
  echo "Moving configsBak to configs..."
  mv "$CONFIGS_BAK" "$CONFIGS"
  echo "Done. Your backup has been restored to configs."
elif [ -d "$CONFIGS" ] && [ -d "$CONFIGS_BAK" ]; then
  echo "Both configs and configsBak exist."
  echo "Please choose what to do:"
  PS3="Enter your choice: "
  select option in "Backup current configs (move to configsBak)" "Restore backup (move configsBak to configs)" "Swap them" "Do nothing"; do
    case $REPLY in
    1)
      echo "Backing up configs..."
      rm -rf "$CONFIGS_BAK"
      mv "$CONFIGS" "$CONFIGS_BAK"
      echo "Done. configs moved to configsBak."
      break
      ;;
    2)
      echo "Restoring backup..."
      rm -rf "$CONFIGS"
      mv "$CONFIGS_BAK" "$CONFIGS"
      echo "Done. configsBak moved to configs."
      break
      ;;
    3)
      echo "Swapping..."
      mv "$CONFIGS" "$HYPR_CONFIG_DIR/configs.tmp"
      mv "$CONFIGS_BAK" "$CONFIGS"
      mv "$HYPR_CONFIG_DIR/UserConfigs.tmp" "$CONFIGS_BAK"
      echo "Done. configs and configsBak have been swapped."
      break
      ;;
    4)
      echo "No changes made."
      break
      ;;
    *)
      echo "Invalid option. Please try again."
      ;;
    esac
  done
else
  echo "Neither configs nor configsBak directory found. Nothing to do."
fi
