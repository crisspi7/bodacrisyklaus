# Hero image assets
Please add your original photo (the one you uploaded in the chat) to this repository at `assets/hero.jpg`.
Then run the conversion script to generate optimized variants (webp + optional JPGs):
chmod +x scripts/convert-images.sh
./scripts/convert-images.sh
This will create:
- assets/hero-480.webp
- assets/hero-800.webp
- assets/hero-1200.webp
The `index.html` already references these optimized images via a `<picture>` element and falls back to `assets/hero.jpg` if the webp variants are not present.
If you prefer, reply here with the image file attached (as `hero.jpg`) and I can create the webp variants and push them to the repo for you.
