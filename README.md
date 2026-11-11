# SheRise – Women Entrepreneurs Profile Platform
### Academic Practical Examination: Experiment 6(a)
**Sustainable Development Goal: SDG 5 – Gender Equality**

---

## 📌 Project Overview
**SheRise** is a modern, responsive, and aesthetically refined Flutter application designed to showcase, connect, and empower women entrepreneurs across diverse economic sectors. Developed for **Academic Practical Examination Experiment 6(a)** (*"Design a Custom Women Entrepreneur Profile Card Widget with Styled Text and Buttons"*), the platform addresses **UN Sustainable Development Goal 5: Gender Equality** by enhancing the digital visibility of women-led businesses, promoting economic independence, and providing direct avenues for customer engagement and B2B partnerships.

---

## 🎯 Evaluation Rubric Alignment

| Rubric Component | Max Marks | Implementation Highlights in SheRise |
| :--- | :---: | :--- |
| **Functionality** | **8 Marks** | Dynamic real-time search, interactive multi-category filtering, persistent favorites bookmarking, working modal dialogs (Contact Founder, Partnership Proposal), social link actions, and navigation across Home, Explore Directory, and Detailed Profile. |
| **Flutter Concepts** | **4 Marks** | Proper implementation of `StatelessWidget`, `StatefulWidget`, `MaterialApp`, `Scaffold`, `AppBar`, `Container`, `Card`, `Padding`, `Column`, `Row`, `Stack`, `Positioned`, `CircleAvatar`, `Image.network` with fallback `errorBuilder`, `BoxDecoration`, `LinearGradient`, `BorderRadius`, `BoxShadow`, `Text`/`TextStyle`, `ElevatedButton`, `OutlinedButton`, `IconButton`, `ListView`, `SingleChildScrollView`, `Navigator`, `setState`, and Material 3 theming. |
| **UI/UX Design** | **3 Marks** | Designed with a feminine-inspired professional palette: Deep Purple (`#673AB7`), Lavender (`#B39DDB`), Coral (`#FF8A80`), Soft Lavender (`#F8F5FF`), and Pure White (`#FFFFFF`). Zero overflow errors (`RenderFlex` safe), smooth elevation shadows, responsive breakpoints, and tactile feedback. |
| **Code Quality** | **2 Marks** | Modular clean architecture (`screens/`, `widgets/`, `models/`, `data/`, `theme/`). Zero external third-party dependencies required beyond the Flutter SDK. Highly maintainable, self-documenting code. |
| **SDG Relevance** | **1 Mark** | Prominently embeds SDG 5 Gender Equality banner, official justification quote, and the five pillars of women's economic empowerment. |
| **Documentation & Demo** | **2 Marks** | Clear run commands, comprehensive Viva Voce questions & answers, step-by-step screenshot capture guidance, and component architecture breakdown. |

---

## 🎨 Color Palette & Design System

- **Primary Brand Color:** Deep Purple (`#673AB7`) – Represents ambition, leadership, and visionary enterprise.
- **Secondary Accent:** Soft Lavender (`#B39DDB`) – Represents elegance, inclusivity, and harmony.
- **Warm Accent:** Coral (`#FF8A80`) – Highlights CTAs, bookmarks, and innovative achievements.
- **Background:** Soft Tinted Lavender (`#F8F5FF`) – High readability, gentle on eyes.
- **Card Surfaces:** Pure White (`#FFFFFF`) with subtle purple drop shadows (`#673AB7` at 12% opacity).
- **Typography:** Dark Charcoal (`#292438`) for headlines and Slate Gray (`#6B657B`) for body/subtitles.
- **Status Green:** Fresh Green (`#4CAF50`) for verified achievements and metrics.

---

## 📂 Project Architecture

```
flutterwomen/
├── pubspec.yaml                  # Project dependencies and Flutter asset config
├── analysis_options.yaml         # Linter rules for clean Dart style
├── README.md                     # Comprehensive academic report and run instructions
├── web/
│   └── index.html                # Responsive web template
└── lib/
    ├── main.dart                 # Application entry point & MaterialApp configuration
    ├── theme/
    │   └── app_theme.dart        # Central Material 3 design system, colors, gradients
    ├── models/
    │   └── entrepreneur.dart     # Strong data model for entrepreneur profiles & statistics
    ├── data/
    │   └── entrepreneur_data.dart# Rich dataset with 6 diverse women entrepreneurs
    ├── widgets/
    │   ├── gradient_header.dart  # Custom LinearGradient card header with overlay badges
    │   ├── statistic_card.dart   # Reusable metric card (Experience, Employees, etc.)
    │   ├── category_chip.dart    # Interactive category filtering chip with icons
    │   ├── custom_buttons.dart   # Primary, Secondary, and Social media button widgets
    │   ├── sdg_banner.dart       # Dedicated SDG 5 Gender Equality showcase card
    │   └── entrepreneur_profile_card.dart # Core Custom Widget for Experiment 6(a)
    └── screens/
        ├── home_screen.dart      # Dashboard with search, filter, featured card, SDG banner
        ├── explore_screen.dart   # Full searchable directory and category catalog
        └── profile_screen.dart   # Comprehensive detailed biographical & milestone journey
```

---

## 🌟 Core Custom Widget: `EntrepreneurProfileCard`

The `EntrepreneurProfileCard` widget implements all 8 required architectural elements:
1. **Gradient Header**: Custom `LinearGradient` background (`#673AB7` to `#9575CD`) with rounded top corners, decorative circular accents, and an SDG 5 status badge.
2. **Profile Avatar**: Overlapping circular photograph rendered via `Stack` and `Positioned`, protected with white borders, soft drop shadows, and an `errorBuilder` fallback.
3. **Entrepreneur Details**: Displays Name (*Ananya Sharma*), Designation (*Founder & CEO*), Business Name (*GreenGlow*), Industry (*Sustainability*), and Location (*Hyderabad, India*).
4. **About Me Section**: Professional biography summarizing her entrepreneurial journey, environmental commitment, and grassroots impact.
5. **Business Information**: Company founding year, mission statement, and key awards.
6. **Statistics Grid**: Four responsive `StatisticCard` widgets highlighting Years of Experience, Team Size, Customers Served, and National Awards.
7. **Action Buttons**:
   - `PrimaryActionButton` ("Contact") – Triggers a interactive contact message dialog.
   - `SecondaryActionButton` ("Partner") – Launches a bottom sheet for partnership inquiries.
   - `TextButton` ("View Full Profile & Journey") – Navigates to `DetailedProfileScreen`.
8. **Social Channels & Bookmark**: Interactive buttons for LinkedIn, Instagram, and Website, alongside a dynamic heart icon for favoriting profiles.

---

## 🌍 Alignment with UN SDG 5: Gender Equality

### Official Justification Quote:
> *"SheRise supports SDG 5 – Gender Equality by providing a digital platform to showcase women entrepreneurs, promote women-led businesses, and create opportunities for collaboration and economic empowerment."*

### Key SDG 5 Drivers Embedded in SheRise:
1. **Visibility**: Counteracts the underrepresentation of female founders in traditional tech and venture ecosystems.
2. **Economic Opportunities**: Direct access to customers and enterprise buyers without intermediaries.
3. **Inclusive Leadership**: Celebrates female role models across STEM, Agriculture, Sustainable Manufacturing, and Healthcare.
4. **Grassroots Upliftment**: Showcases enterprises that provide living wages and skill training to rural women artisans.

---

## 🚀 How to Run the Application

### Prerequisites:
- Flutter SDK (version 3.0.0 or higher)
- Google Chrome (for Flutter Web) or an Android Emulator / Physical Device
- Visual Studio Code or Android Studio

### Running in VS Code:
1. Open Visual Studio Code.
2. Click **File > Open Folder...** and select `flutterwomen` (`c:\Users\tellu\Downloads\flutterwomen`).
3. Open the integrated terminal (`Ctrl + ~` or **Terminal > New Terminal**).
4. Fetch dependencies (if needed):
   ```bash
   flutter pub get
   ```
5. Choose your target device (press `F1` and type `Flutter: Select Device`, then choose **Chrome** or **Android Emulator**).
6. Press `F5` or run:
   ```bash
   flutter run -d chrome
   ```
   *(For Android devices, run `flutter run -d android`)*.

---

## 📸 Examination Screenshot Guidance

During your laboratory or practical examination, capture the following four screenshots:

- **Screenshot 1: Home Screen with Welcome Banner & Featured Founder**
  - *How to capture:* Launch the app on Home tab. Ensure the purple-coral gradient banner ("Empowering Women. Inspiring Innovation") and the top of Ananya Sharma's featured profile card are clearly visible.
- **Screenshot 2: Complete Custom Entrepreneur Profile Card**
  - *How to capture:* Scroll to view the entire `EntrepreneurProfileCard` showing the gradient header, circular avatar, name (*Ananya Sharma*), designation, verified badge, and the "About Me & Entrepreneurial Journey" section.
- **Screenshot 3: Business Information, Key Achievements & Statistics**
  - *How to capture:* Scroll slightly further down on the card to capture the 4 metric cards (*Experience, Employees, Customers, Awards*), the mission statement card, and social links.
- **Screenshot 4: Working Interactions, Search, & Category Filtering**
  - *How to capture:* Type `"Tech"` or `"Green"` into the search box or tap the **"Technology"** category chip to show dynamic filtering, or open the **"Contact Founder"** modal dialog with a `ScaffoldMessenger` confirmation SnackBar visible.

---

## 🎓 Viva Voce Questions & Answers

### Q1. What was the objective of Experiment 6(a)?
**Answer:** The objective was to design a reusable custom Flutter widget named `EntrepreneurProfileCard` demonstrating styled typography, linear gradients, card layouts, action buttons, circular image rendering with fallback handling, and responsive state management aligned with UN SDG 5 (Gender Equality).

### Q2. How is the circular profile avatar layered over the gradient header?
**Answer:** We used a `Stack` widget with `Positioned` children inside a `SizedBox`. The `GradientHeader` is rendered as the base, and the circular avatar inside a `ClipRRect` and decorated `Container` is positioned with a negative bottom offset to create a modern overlapping profile aesthetic.

### Q3. How did you handle network image failures?
**Answer:** In `Image.network`, we implemented the `errorBuilder` parameter. If the network image fails to load or offline execution occurs, it gracefully renders a fallback container displaying the entrepreneur's name initials and theme background, preventing runtime exceptions.

### Q4. How is state managed when filtering entrepreneurs?
**Answer:** In both `HomeScreen` and `ExploreScreen`, we used a `StatefulWidget` with `setState()`. When the user types into the `TextField` or selects a `CategoryChip`, `setState()` recalculates the `_filteredEntrepreneurs` getter in memory and re-renders the `ListView`.

### Q5. What Flutter widgets were utilized to satisfy Material 3 design?
**Answer:** We utilized `ThemeData(useMaterial3: true)`, `NavigationBar`, `CardThemeData`, `ColorScheme.fromSeed`, `ElevatedButton`, `OutlinedButton`, `IconButton`, and custom `LinearGradient` containers with rounded corner radiuses (`BorderRadius.circular(20)`).

### Q6. How does this project directly contribute to SDG 5 (Gender Equality)?
**Answer:** SheRise provides a dedicated digital platform to showcase women entrepreneurs, celebrate female leadership, highlight women-owned micro-enterprises, and facilitate direct commercial collaborations and mentorship, advancing Target 5.5 (ensuring women's full and effective participation and equal opportunities for leadership).
