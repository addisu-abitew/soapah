# 🧼 Soap Maker App

A Flutter + Firebase mobile application for hobbyists and professionals to create, manage, and track their soap making recipes and inventory.

---
## Screens

<div style="display: flex; flex-wrap: wrap; gap: 10px; justify-content: center;">
  <img src="screenshots/s1.png" alt="Screenshot 1" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s2.png" alt="Screenshot 2" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s3.png" alt="Screenshot 3" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s4.png" alt="Screenshot 4" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s5.png" alt="Screenshot 5" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s6.png" alt="Screenshot 6" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s7.png" alt="Screenshot 7" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s8.png" alt="Screenshot 8" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s9.png" alt="Screenshot 9" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s10.png" alt="Screenshot 10" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s11.png" alt="Screenshot 11" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s12.png" alt="Screenshot 12" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s13.png" alt="Screenshot 13" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s14.png" alt="Screenshot 14" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s15.png" alt="Screenshot 15" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s16.png" alt="Screenshot 16" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s17.png" alt="Screenshot 17" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s18.png" alt="Screenshot 18" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s19.png" alt="Screenshot 19" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s20.png" alt="Screenshot 20" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s21.png" alt="Screenshot 21" style="width: 100%; max-width: 200px; height: auto;">
  <img src="screenshots/s22.png" alt="Screenshot 22" style="width: 100%; max-width: 200px; height: auto;">
</div>

## 📲 Features

### 🧪 Soap Recipe Calculator
- Create custom soap recipes using oils, additives, and superfat percentage
- Calculates precise lye and water ratios based on SAP values

### 📖 Recipe Builder
- Save and edit recipes
- Add notes, ingredients, and process instructions

### 📆 Production Calendar
- Schedule soap batches and track curing times
- Set reminders for important dates

### 📋 Batch Logging
- Record and review past batches
- Maintain consistency and quality control

### 📦 Inventory Management
- Track available oils, additives, and materials
- Get notified when stocks run low

### 🔐 Authentication
- Secure login with Firebase Email/Password Auth
- (Optional) Google Sign-In

### 📚 Learning Center
- Access tutorials and articles on soap making
- Bookmark and read offline

---

## 🚀 Getting Started

### Prerequisites
- [Flutter](https://flutter.dev/docs/get-started/install) installed
- [Firebase CLI](https://firebase.google.com/docs/cli) installed
- Android Studio or Xcode for running on devices

### Setup Instructions

1. **Clone the repository:**

```bash
git clone https://github.com/addisu-abitew/soap-maker-app.git
cd soap-maker-app
```

2. **Install dependencies:**

```bash
flutter pub get
```

3. **Set up Firebase:**
  - Create a project on Firebase Console
  - Add Android and iOS apps
  - Download google-services.json (Android) and GoogleService-Info.plist (iOS)
  - Place them in the appropriate directories:

        android/app/google-services.json
        ios/Runner/GoogleService-Info.plist

4. **Run Firebase configuration:**

```bash
flutterfire configure
```

5. **Run the app:**

```bash
flutter run
```

### Project Structure
```bash
lib/
├── models/             # Data models (Recipe, Batch, Inventory)
├── services/           # Firebase services and utilities
├── providers/          # State management with Provider
├── pages/                        # Main app screens and their subcomponents
├── router/                       # App routing and navigation configuration
├── theme/                        # App-wide styling, colors, and text themes
├── utils/                        # Helper functions, constants, formatters, and extensions
└── widgets/                      # Reusable UI widgets shared across multiple pages
```


### 🧪 Tech Stack
  - Frontend: Flutter (Dart)
  - Backend: Firebase
    - Firestore (Database)
    - Firebase Auth (Authentication)
    - Firebase Storage (Images & files)
    - Firebase Cloud Messaging (Push notifications)
  - Local Storage: Hive

### 🙌 Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.