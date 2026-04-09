#!/bin/bash
# =============================================
# Generate Image Lists for Taim Des Website
# =============================================

echo "🚀 Generating image file lists..."

# Logo folder
echo "window.FILE_LIST = [" > logo-list.js
find logo -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.svg" \) 2>/dev/null \
  | sed 's|logo/||' | sort | sed 's|^|  "|;s|$|",|' >> logo-list.js
echo "];" >> logo-list.js

# Packages folder
echo "window.BGS_LIST = [" > bgs-list.js
find packages-photos -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.svg" \) 2>/dev/null \
  | sed 's|packages-photos/||' | sort | sed 's|^|  "|;s|$|",|' >> bgs-list.js
echo "];" >> bgs-list.js

# Posters folder
echo "window.STORIS_LIST = [" > stories-list.js
find posters -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.svg" \) 2>/dev/null \
  | sed 's|posters/||' | sort | sed 's|^|  "|;s|$|",|' >> stories-list.js
echo "];" >> stories-list.js

echo "✅ File lists generated successfully!"
echo "   - logo-list.js     ($(wc -l < logo-list.js) lines)"
echo "   - bgs-list.js      ($(wc -l < bgs-list.js) lines)"
echo "   - stories-list.js  ($(wc -l < stories-list.js) lines)"