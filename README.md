# AppChat — Modern Flutter Chat Application

A high-performance, clean-coded chat application built with Flutter using the **MVVM (Model-View-ViewModel)** design pattern. This app provides a seamless messaging experience with channels and direct messaging (DMs).

## 🚀 Architecture: MVVM

The project follows a strict separation of concerns to ensure maintainability and testability:

-   **Models**: Pure data classes (Channel, Message, User) that define the structure of our data.
-   **Views**: UI screens and widgets. They are "dumb" and only responsible for rendering data provided by ViewModels.
-   **ViewModels**: Act as a bridge between the View and Repository. They handle business logic, state management, and user interaction.
-   **Repositories**: Centralized data layer that abstracts data sources (currently using in-memory arrays to simulate a database/API).

## ✨ Key Features

-   **Authentication**: Simple login flow with personalized user identities.
-   **Channels**: Public chat rooms with unread message indicators and last message previews.
-   **Direct Messages (DMs)**: Private 1-on-1 conversations with online/offline status tracking.
-   **Real-time Simulation**: Interactive message sending with automatic UI updates.
-   **Modern UI**: 
    -   Initial-based avatars for a clean, consistent look.
    -   Gradient-themed login and splash screens.
    -   Responsive message bubbles with timestamp formatting.
    -   Bottom navigation for easy switching between Channels and DMs.

## 🛠️ Tech Stack

-   **Flutter**: Cross-platform UI toolkit.
-   **Provider**: State management and dependency injection.
-   **MVVM Pattern**: For scalable and maintainable codebase.

## 📂 Project Structure

```text
lib/
├── models/         # Pure data models
├── repositories/   # Data source & storage logic
├── viewmodels/     # Business logic & state management
├── views/          # UI screens & components
└── main.dart       # App entry & Provider setup
```

## 🏁 Getting Started

### Prerequisites
-   Flutter SDK installed
-   An Android/iOS emulator or physical device

### Running the App
1.  Clone or download the repository.
2.  Open the project directory in your terminal.
3.  Run `flutter pub get` to install dependencies.
4.  Run `flutter run` to launch the application.

---

*Built with ❤️ using Flutter & MVVM.*
