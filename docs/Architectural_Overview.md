## 🧱 Architectural Overview – SelfCareChecklist

This app follows a simplified SwiftUI-first architecture without MVVM abstraction.  
All state, logic, and UI are primarily handled directly within the views.

---

### 🧱 Layers Overview

<img width="629" alt="Screenshot 2025-05-07 at 4 15 19 PM" src="https://github.com/user-attachments/assets/fb77f4e5-c97e-422c-acd5-58b4d4481a58" />

---

### 📦 Components

#### 1. **Views (UI Layer)**
SwiftUI views responsible for rendering UI and reacting to changes in state.

- `HomeView.swift`: Main screen with self-care checklist, streak chart, and progress.
- `BreathTimerView.swift`: Timer UI for deep breathing task.
- `SleepReminderView.swift`: UI to configure bedtime reminders.

#### 2. **ViewModels (Logic Layer)**
Handles task logic, daily resets, and binds data to views.

- `TaskManager.swift`: ObservableObject managing task list, streak tracking, and logic for completing tasks and triggering timers.

#### 3. **Models (Data Layer)**
Simple data structures representing self-care tasks and streaks.

- `Task.swift`: Struct holding task properties (title, isCompleted, hasTimer, etc).
- `StreakDay.swift`: Struct for tracking completed streaks per date.

#### 4. **Persistence Layer**
Handles saving and restoring state between launches using system frameworks.

- `UserDefaults`: Stores task completion state and streaks.
- `NotificationManager.swift`: Manages local push notifications.
- `DateManager.swift`: Handles date-based logic, such as daily resets.

---

### 🧩 How It Works

- **No ViewModels / Models**: Logic is managed using `@State`, `@AppStorage`, and simple structs inside the views.
- **Persistence**:  
  - `UserDefaults` is used via `@AppStorage` for task completion, streak tracking, and reminder times.
- **Timers**:  
  - Custom timers are built using SwiftUI `Timer.publish` or `DispatchQueue`, depending on task type.
- **Notifications**:  
  - Local notifications are scheduled via `UNUserNotificationCenter` for sleep and daily scan reminders.
- **UI Transitions**:  
  - `RootView.swift` handles switching from `SplashScreen` to `ContentView`.

---

### ✅ Why This Structure?

This layout is optimized for fast prototyping and beginner SwiftUI development:
- Easy to follow
- Direct state binding
- Lightweight and no external dependencies

---

### ⚠️ Scaling Note

As the app grows:
- Refactor views with logic into reusable components
- Introduce MVVM using `ObservableObject` and `@StateObject` for better separation of concerns
- Move constants, colors, and notification logic into helper files
