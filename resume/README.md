# Resume PDF Generator

This script automatically generates a PDF version of your resume from the live GitHub Pages site.

## Prerequisites

- Google Chrome (headless mode)
- img2pdf (`sudo apt-get install img2pdf`)

## Usage

```bash
cd resume
./regenerate-pdf.sh
```

This will:
1. Capture screenshots of all 6 resume slides
2. Convert them to a single PDF file
3. Output: `Maruthi_Reddy_Resume.pdf`

## After Generation

Commit and push the updated PDF:

```bash
git add Maruthi_Reddy_Resume.pdf
git commit -m "Update resume PDF"
git push origin main
```

## Notes

- The script captures from the live site: https://maruthireddyo.github.io/resume
- Make sure your changes are deployed to GitHub Pages before regenerating
- PDF size is typically ~800KB-1MB
