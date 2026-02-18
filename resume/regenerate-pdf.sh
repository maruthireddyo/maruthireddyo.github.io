#!/bin/bash
# Script to regenerate resume PDF from live website
# Usage: ./regenerate-pdf.sh

set -e

RESUME_URL="https://maruthireddyo.github.io/resume"
OUTPUT_PDF="Maruthi_Reddy_Resume.pdf"

echo "🚀 Generating PDF from $RESUME_URL"
echo ""

# Generate screenshots for each slide
for i in {1..6}; do
  echo "📸 Capturing slide $i..."
  google-chrome --headless=new \
    --disable-gpu \
    --no-sandbox \
    --window-size=1280,720 \
    --screenshot="slide${i}.png" \
    --virtual-time-budget=10000 \
    "${RESUME_URL}/slide${i}.html" 2>/dev/null
  sleep 1
done

echo ""
echo "📄 Converting screenshots to PDF..."

# Convert screenshots to PDF
img2pdf slide1.png slide2.png slide3.png slide4.png slide5.png slide6.png -o "$OUTPUT_PDF"

# Cleanup
rm slide*.png

echo ""
echo "✅ PDF generated successfully: $(ls -lh $OUTPUT_PDF | awk '{print $5}')"
echo ""
echo "To commit and push:"
echo "  git add $OUTPUT_PDF"
echo "  git commit -m 'Update resume PDF'"
echo "  git push origin main"
