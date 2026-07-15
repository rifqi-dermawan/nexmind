# 🎓 StudyMate - Mobile Application

StudyMate is a modern educational mobile application built with **Flutter**. This project is designed with a strong emphasis on clean architecture, highly modular UI components, and an **Offline-First** data strategy to ensure seamless user experience even without an internet connection.

## 🛠️ Tech Stack & Environment

- **Frontend:** Flutter (Dart)
- **Local Cache / Database:** SQLite (`sqflite`)
- **Backend Communication:** REST API (Laravel)
- **Local Dev Environment:** Laragon / Laravel Herd (**Strictly NO XAMPP**)

## 🏗️ Architecture & Core Principles

This project strictly adheres to modern software engineering best practices:

1. **Offline-First Synchronization:** 
   The app reads data from the local SQLite database to prevent loading screens or crashes when offline. When connected to the internet, it fetches the latest data from the Laravel API and syncs it with the local cache via the Repository Pattern.
2. **Separation of Concerns (SoC):** 
   UI widgets (screens) are strictly separated from business logic and data fetching (services/repositories). 
3. **Modular UI Components:** 
   Repeated UI elements (e.g., `CustomInputField`, `CustomBottomNav`) are extracted into reusable widgets to maintain a DRY (Don't Repeat Yourself) codebase.
4. **Memory Optimization:** 
   Extensive use of `const` constructors for static widgets to reduce memory footprint and prevent unnecessary UI re-rendering.

## ✨ Strict UI/UX Guidelines

Any developer or AI agent contributing to this repository MUST follow these design rules:
- **Buttons:** `SizedBox(width: double.infinity)` with `BorderRadius.circular(30)` for a modern pill shape.
- **Layouts:** Use `Column` for vertical stacking. Never force vertical elements into a `Row`.
- **Forms:** Labels are placed *outside and above* the `TextFormField` using a `Column`.

## 🚀 Getting Started

Follow these steps to run the StudyMate mobile app locally.

### Prerequisites
1. Install [Flutter SDK](https://docs.flutter.dev/get-started/install).
2. Ensure the Laravel API server is running locally via **Laragon** or **Herd**.
3. Connect an Android device (via USB Debugging) or start an emulator.

### Installation

1. Clone this repository:
   ```bash
   git clone [https://github.com/yourusername/studymate-mobile.git](https://github.com/yourusername/studymate-mobile.git)
