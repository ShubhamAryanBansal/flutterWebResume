# Resume Web Page Features

## Recent Updates

### Theme Switcher
- **Location**: Top-right corner of the app bar (next to Contact button)
- **Icon**: Animated sun/moon icon that rotates when switching
- **Functionality**: Toggle between light and dark themes
- **State Management**: Uses Riverpod for theme state persistence

### Enhanced Footer
- **Flutter Logo**: Official Flutter logo displayed in the footer
- **Styling**: "Powered by Flutter" text with logo in between
- **Responsive**: Centered layout that works on all screen sizes

### Theme Enhancements
- **Light Theme**: Clean, professional look with green accent color
- **Dark Theme**: Easy on the eyes with matching green accent
- **Material Design 3**: Modern UI components with elevation and rounded corners
- **Consistent**: All sections adapt to the selected theme

## Complete Feature List

### Hero Section
- Profile image with rounded corners
- Name and professional tagline
- M.Tech education badge with BITS Pilani logo
- Contact and GitHub buttons
- Responsive layout (stacks on mobile)

### Skills Section
- Three categories: Languages & Core, Technologies & Frameworks, Tools & Platforms
- Interactive skill chips with hover effects
- Color-coded by category
- Animated transitions

### Experience Section
- Timeline layout with company logos
- Hover effects on experience cards
- Detailed bullet points for each role
- Visual connection lines between experiences

### Projects Section
- Grid layout (2 columns on desktop, 1 on mobile)
- Project cards with descriptions
- Play Store links for published apps
- Hover animations

### Achievements Section
- Clean list format
- Card-based layout

### Footer
- Flutter logo with "Powered by Flutter" text
- Centered and styled

## Technical Stack
- Flutter 3.7+
- Riverpod for state management
- go_router for navigation
- url_launcher for external links
- Material Design 3

## Running the App

```bash
# Install dependencies
flutter pub get

# Run on web
flutter run -d chrome

# Build for production
flutter build web
```

## Customization

To customize the theme colors, edit `lib/core/theme.dart`:
```dart
static const _seed = Color(0xFF2E7D32); // Change this color
```
