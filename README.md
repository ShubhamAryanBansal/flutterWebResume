# Shubham Bansal - Resume Web Page

A professional resume web page built with Flutter, showcasing experience, projects, skills, and achievements.

## Features

- Responsive design that works on mobile, tablet, and desktop
- Dark and light theme support
- Interactive sections with hover effects
- Skills organized by categories with animated chips
- Timeline-based experience section with company logos
- Project cards with Play Store links
- Contact dialog with email and GitHub links
- Material Design 3 UI

## Getting Started

### Prerequisites

- Flutter SDK (3.7.0 or higher)
- Dart SDK
- A code editor (VS Code, Android Studio, or IntelliJ)

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run -d chrome
   ```
   Or for other platforms:
   ```bash
   flutter run -d macos
   flutter run -d windows
   flutter run -d linux
   ```

### Building for Web

To build for web deployment:

```bash
flutter build web
```

The output will be in the `build/web` directory.

## Project Structure

```
lib/
├── core/
│   ├── models/          # Data models
│   ├── providers/       # Riverpod providers
│   ├── routing.dart     # App routing
│   └── theme.dart       # Theme configuration
├── features/
│   ├── home/
│   │   └── presentation/
│   │       └── home_page.dart
│   └── contact/
│       └── presentation/
│           ├── sections/
│           │   ├── skills_section.dart
│           │   ├── experience_section.dart
│           │   ├── projects_section.dart
│           │   ├── achievements_section.dart
│           │   └── education_section.dart
│           └── contact_dialog.dart
└── main.dart
```

## Customization

To customize with your own information:

1. Edit `lib/core/models/resume_data.dart` with your details
2. Replace images in `assets/images/` with your own
3. Update the theme colors in `lib/core/theme.dart`

## Technologies Used

- Flutter 3.7+
- Riverpod for state management
- go_router for navigation
- url_launcher for external links
- Material Design 3

## License

This project is open source and available for personal use.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
