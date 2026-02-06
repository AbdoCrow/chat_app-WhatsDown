<h1 align="center">What'sDown (I am tired of looking up)</h1>


<p align="center">
  <img src="https://github.com/user-attachments/assets/db5095ae-4028-422f-9e20-34600209331d" width="247" height="249" />
</p>

## Screenshots
<p align="center">
  <img src="https://github.com/user-attachments/assets/5fbd233a-a65b-447a-9fd1-d12c43cad243" width="250"/>
  <img src="https://github.com/user-attachments/assets/400039fa-c050-490a-b12c-f9af17724ecf" width="250"/>
  <img src="https://github.com/user-attachments/assets/d9867ad4-fe67-4822-9b50-3ca8bd975fec" width="250"/>
</p>

## Features

### Implemented

- **Authentication**
  - User registration with email, username, and password
  - User login with JWT token authentication
  - Secure token storage using Flutter Secure Storage

- **Navigation**
  - GoRouter for declarative routing

- **UI/UX**
  - WhatsApp-inspired (it's literally what's app lol but yeah inspired)
  - Custom app icon (flipped what'sapp icon)

- **Architecture**
  - Clean Architecture (Domain, Data, Presentation layers)
  - Riverpod for state management
  - GetIt + Injectable for dependency injection
  - Freezed for immutable data classes
  - Dio for HTTP networking

### In Progress

- Chat messaging with WebSocket
- Real-time message delivery
- User profile management
- Status updates
- Voice/Video calls <skull emoji>

## Project Structure

```
lib/
├── main.dart
├── core/
│   ├── constants/       # API endpoints, app constants
│   ├── di/              # Dependency injection setup
│   ├── error/           # Custom exceptions and failures
│   ├── router/          # GoRouter configuration
│   ├── theme/           # App theme and colors
│   ├── validation/      # Form validators
│   └── widgets/         # Reusable widgets
└── feature/
    ├── auth/            # Authentication feature
    │   ├── domain/      # Entities, repositories, datasources
    │   └── presentation/# Screens, controllers
    ├── chat/            # Chat feature
    ├── profile/         # User profile
    ├── settings/        # App settings
    ├── status/          # Status updates
    └── calls/           # Voice/Video calls
```

## Tech Stack

| Category         | Technology                                |
| ---------------- | ----------------------------------------- |
| Framework        | Flutter                                   |
| State Management | Riverpod                                  |
| Routing          | GoRouter                                  |
| DI               | GetIt + Injectable                        |
| Networking       | Dio                                       |
| Local Storage    | Flutter Secure Storage, SharedPreferences |
| Code Generation  | Freezed, JSON Serializable                |
| Backend          | Spring Boot (Java)                        |

## Getting Started

### Prerequisites

- Flutter SDK ^3.8.1
- Dart SDK ^3.8.1
- Android Studio / VS Code
- Running backend server (link https://github.com/AFaseeh/WhatsDown-Main)

### Installation

1. Clone the repository

```bash
git clone https://github.com/yourusername/chat_app.git
cd chat_app
```

2. Install dependencies

```bash
flutter pub get
```

3. Generate code (Freezed, Injectable, etc.)

```bash
dart run build_runner build --delete-conflicting-outputs
```

4. Update API base URL in `lib/core/constants/api_endpoints.dart`

5. Run the app

```bash
flutter run
```

## Dependencies

### Main Dependencies

- `flutter_riverpod` - State management
- `go_router` - Navigation
- `get_it` & `injectable` - Dependency injection
- `dio` - HTTP client
- `freezed_annotation` - Immutable classes
- `dartz` - Functional programming (Either type)
- `flutter_secure_storage` - Secure token storage
- `web_socket_channel` - WebSocket for real-time chat

### Dev Dependencies

- `build_runner` - Code generation
- `freezed` - Code generator for Freezed
- `json_serializable` - JSON serialization
- `injectable_generator` - DI code generator
- `flutter_launcher_icons` - App icon generator

## Configuration

### Changing App Icon

1. Replace `assets/icon/app_icon.png` with your icon
2. Run:

```bash
dart run flutter_launcher_icons
```

### Backend API

Update the base URL in `lib/core/constants/api_endpoints.dart`:

```dart
static const String baseUrl = 'http://YOUR_SERVER_IP:8081/api';
```

## Author

Dank_Fungus

---
