#!/bin/bash

# Canvas Validation Script
# Validates all .canvas files in the current directory

set -e

echo "🔍 Validating Canvas files..."
echo "=============================="

canvas_count=0
valid_count=0
invalid_count=0

for file in *.canvas; do
  # Skip if no .canvas files exist
  if [ ! -f "$file" ]; then
    echo "No .canvas files found in current directory"
    exit 0
  fi

  canvas_count=$((canvas_count + 1))
  echo ""
  echo "Testing: $file"

  # Check if file is valid JSON
  if node -e "JSON.parse(require('fs').readFileSync('$file', 'utf8'))" 2>/dev/null; then
    echo "  ✓ Valid JSON"
    valid_count=$((valid_count + 1))

    # Additional checks
    node -e "
      const canvas = JSON.parse(require('fs').readFileSync('$file', 'utf8'));
      const colors = new Set();
      (canvas.nodes || []).forEach(node => {
        if (node.color) colors.add(node.color);
      });
      if (colors.size < 3) {
        console.log('  ⚠️  Warning: Uses only ' + colors.size + ' color(s). Canvas should use at least 3 different colors.');
      } else {
        console.log('  ✓ Uses ' + colors.size + ' different colors');
      }
    " 2>/dev/null || true

  else
    echo "  ✗ Invalid JSON"
    echo "  └─ Run: node -e \"JSON.parse(require('fs').readFileSync('$file', 'utf8'))\""
    echo "  └─ For syntax reference, see: syntax/json-canvas.md"
    invalid_count=$((invalid_count + 1))
  fi
done

echo ""
echo "=============================="
echo "Summary:"
echo "  Total files: $canvas_count"
echo "  Valid: $valid_count"
echo "  Invalid: $invalid_count"

if [ $invalid_count -gt 0 ]; then
  echo ""
  echo "❌ Validation failed for $invalid_count file(s)"
  exit 1
else
  echo ""
  echo "✅ All Canvas files are valid!"
  exit 0
fi
