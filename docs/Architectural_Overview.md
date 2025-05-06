## 🧱 Architectural Overview

The **SelfCareChecklist** app follows a lightweight **MVVM (Model-View-ViewModel)** architecture combined with **local data persistence** using `UserDefaults`. The architecture is intentionally simple and clean to prioritize clarity, maintainability, and prototyping speed.

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

### ✅ App Flow Summary

1. **On App Launch**  
   - Loads tasks and streak data from `UserDefaults`
   - Checks if a new day has started → if so, resets tasks

2. **User Interaction**  
   - Tapping a task toggles completion and updates streaks
   - Some tasks trigger timers (e.g., breathing, walking)

3. **Notification Reminders**  
   - `UNUserNotificationCenter` triggers a daily reminder (e.g., for "Get Enough Rest")

4. **Data Persistence**  
   - Task states and streaks are saved using `UserDefaults`
   - No backend/server is required — fully offline

---

### 🧪 Why MVVM?

- **SwiftUI-friendly**: View updates are reactive via `@StateObject` and `@Published`.
- **Separation of Concerns**: UI logic stays in Views, while data/state is managed in ViewModels.
- **Testability**: ViewModels can be tested independently of the UI.
- **Scalability**: This structure can be expanded with additional modules or CoreData in future releases.
