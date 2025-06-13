#!/bin/bash

# Script to properly restart Godot and fix language server issues

echo "Fixing Godot Language Server Error..."
echo "======================================"

# Step 1: Kill all Godot processes
echo "Step 1: Stopping all Godot processes..."
pkill -f Godot || echo "No Godot processes to kill"
sleep 2

# Step 2: Clear language server cache
echo "Step 2: Clearing language server cache..."
rm -rf ~/Library/Caches/Godot/script_lsp/ 2>/dev/null || echo "No cache to clear"

# Step 3: Clear temporary files
echo "Step 3: Clearing temporary files..."
rm -rf ~/.local/share/godot/tmp/ 2>/dev/null || echo "No tmp files to clear"

# Step 4: Wait a moment
echo "Step 4: Waiting for cleanup..."
sleep 3

# Step 5: Restart Godot
echo "Step 5: Restarting Godot editor..."
/Applications/Godot.app/Contents/MacOS/Godot --path /Users/gagelaporta/Desktop/NeuroVision-Repo --editor &

echo ""
echo "Godot has been restarted. The language server error should be resolved."
echo "If the error persists, try:"
echo "  1. Editor → Editor Settings → Network → Language Server"
echo "  2. Disable 'Enable Language Server'"
echo "  3. Restart Godot"
echo "  4. Re-enable Language Server"