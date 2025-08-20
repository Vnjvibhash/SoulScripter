# SoulScripter

<p align="center">
  <img src="assets/images/logo.png?raw=true" alt="SoulScripter Logo" height="400"/>
</p>

SoulScripter - A beautiful, user-friendly Flutter app empowering users to craft, style, and share quotes, poetry, and micro-stories. Its elegant interface allows creative writers to express themselves, add unique backgrounds and fonts, and share their works with an engaged community.

## ✨ Features
- Compose Quotes & Stories
    - Write and edit your creative content with live WYSIWYG font preview.

- Rich Styling
    - Choose from a curated list of gorgeous Google Fonts.
    - Pick text color (with advanced color picker) and background color.
    - Add background images—crop them to a perfect square for aesthetic uniformity.

- Personalization
    - Drag-and-drop to position your text anywhere within a perfectly square preview.
    - Instantly adjust font size and alignment with intuitive controls.

- Multi-step Creation
    - Step 1: Write your quote/story.
    - Step 2: Preview & fine-tune its style, position, and background.
    - Step 3: Add captions and hashtags for context and social sharing.

- Modern Theming
    - Thoughtful light and dark mode palettes with SoulScripter’s unique color branding.

- Easy Sharing & Community
    - (Planned) Save artworks, share to gallery, and engage with a creative community via Firebase.

## 🖌️ Theme
```bash
Primary Color: Deep Purple #673AB7
Accent: Aesthetic Peach #FFC1A1
Background: Whisper White (Light) / Charcoal (Dark)
Highlight: Rich Coral Pink #FF5E81
```
(See theme.dart for the full palette.)

## 🛠 Setup & Installation
1. Clone this repository:

```bash
git clone https://github.com/yourusername/soulscripter.git
cd soulscripter
Install dependencies:
```
```bash
flutter pub get
Run the app:
```
```bash
flutter run
```

**Note:**
- Make sure you have the latest Flutter SDK (3.8.1+).
- Android/iOS image permissions must be enabled for image picking/cropping.

## 📸 Screenshots
*(App screenshots here for a strong visual impression will get added soon)*

## 🗂️ Project Structure
```bash
└── lib
    ├── data
        ├── intro_content.dart
        └── sample_data.dart
    ├── main.dart
    ├── models
        └── intro_model.dart
    ├── providers
        ├── auth_provider.dart
        └── quotes_provider.dart
    ├── screens
        ├── caption_screen.dart
        ├── home_screen.dart
        ├── intro_screen.dart
        ├── login_screen.dart
        ├── main_screen.dart
        ├── preview_screen.dart
        ├── profile_screen.dart
        ├── quote_composer.dart
        ├── quote_details_screen.dart
        ├── signup_screen.dart
        └── splash_screen.dart
    ├── theme.dart
    └── widgets
        ├── bg_color_picker.dart
        ├── bg_image_picker.dart
        ├── color_picker_dialog.dart
        ├── comment_card.dart
        ├── font_family_selector.dart
        ├── font_size_selector.dart
        ├── gradient_button.dart
        ├── intro_clipper.dart
        ├── quote
            ├── quote_card.dart
            ├── quote_footer.dart
            ├── quote_post.dart
            └── quote_preview.dart
        ├── shimmer_bg.dart
        └── text_aligner.dart
```

## 🚀 Roadmap / TODO
-  Community features: Like, share, and comment using Firebase
-  Save & export image for social media
-  Discover, follow, and interact with other writers
-  Advanced typography and gradient backgrounds

## ❤️ Contributing
Want to add more features or fix a bug?
Contributions and PRs are welcome! Please raise an issue before starting major changes.

## © 2024 SoulScripter
Crafted with Flutter.
Unleash your soul—one story at a time.

