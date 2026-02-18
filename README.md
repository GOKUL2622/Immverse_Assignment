# AppChat — Modern Flutter Chat Application

A high-performance, clean-coded chat application built with Flutter using the **MVVM (Model-View-ViewModel)** design pattern. 

## 🛠️ Project Setup Instructions

Follow these steps to get the project running on your local machine:

1.  **Clone the Repository**:
    ```bash
    git clone <repository-url>
    cd immverse
    ```

2.  **Install Dependencies**:
    Ensure you have Flutter installed, then run:
    ```bash
    flutter pub get
    ```

3.  **Run the Application**:
    Connect an emulator or physical device and run:
    ```bash
    flutter run
    ```

4.  **Analyze Code** (Optional):
    To verify code quality and lack of errors:
    ```bash
    flutter analyze
    ```

## 🧠 State Management: Provider + MVVM

The application uses the **Provider** package for state management and dependency injection. This is paired with the **MVVM architecture** to ensure a clean separation between the UI and business logic:

-   **ChangeNotifierViewModels**: All ViewModels (`AuthViewModel`, `ChannelViewModel`, `DmViewModel`) extend `ChangeNotifier`.
-   **MultiProvider**: Located in `main.dart`, it provides all ViewModels to the entire widget tree.
-   **Consumer & context.read**: Views reactively listen to changes using `Consumer` widgets or access methods directly via `context.read()`.
-   **Repository Pattern**: A central `ChatRepository` abstracts the data source, allowing for easy transitions between in-memory storage, local databases, or remote APIs.

## 🌟 Bonus Features Implemented

Beyond the basic requirements, several premium features were added:

1.  **Full MVVM Implementation**: Not just a flat structure; it uses a professional-grade architecture with distinct layers for Models, Views, ViewModels, and Repositories.
2.  **Dynamic Search**: A real-time filtering system in the Direct Messages tab to find users instantly.
3.  **Presence System**: Visual "Online/Offline" status indicators for all DM users.
4.  **Smart Unread Counters**: Channels automatically display unread message counts that reset when the channel is opened.
5.  **Premium Aesthetics**:
    -   Custom glassmorphism-inspired UI elements.
    -   Smooth gradient backgrounds on Login and Splash screens.
    -   Initial-based avatars for a consistent, modern professional look.
    -   Interactive message bubbles with smart border rounding based on sender.
6.  **Navigation Flow**: A full specialized navigation flow including a Splash screen timer and authenticated session simulation.

## 📂 Project Structure

```text
lib/
├── models/         # Pure data models (User, Message, Channel)
├── repositories/   # Data layer & In-memory storage logic
├── viewmodels/     # Business logic & ChangeNotifier state
├── views/          # Pure UI screens & extracted sub-widgets
└── main.dart       # App entry & Provider wiring
```

---

*Built with ❤️ using Flutter, Provider, and MVVM.*
