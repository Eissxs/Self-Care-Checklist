## Architectural Overview – SelfCareChecklist

The app follows a simplified SwiftUI-first architecture without the abstraction of MVVM.  
State, logic, and UI are directly managed within the views to streamline development for this prototype.

---

### Layers Overview

![Architecture Diagram](https://github.com/user-attachments/assets/fb77f4e5-c97e-422c-acd5-58b4d4481a58)

---

### Components

#### 1. **Views (UI Layer)**
The SwiftUI views are responsible for rendering the user interface and reacting to state changes.

- **HomeView.swift**: Displays the main self-care checklist, streak chart, and progress indicators.
- **BreathTimerView.swift**: UI for the deep breathing task timer.
- **SleepReminderView.swift**: Interface for configuring bedtime reminders.

#### 2. **ViewModels (Logic Layer)**
Manages the task logic, daily resets, and binds data to views.

- **TaskManager.swift**: An `ObservableObject` that handles the task list, streak tracking, and logic for completing tasks and triggering timers.

#### 3. **Models (Data Layer)**
Contains simple data structures representing self-care tasks and streaks.

- **Task.swift**: A struct that holds properties of a task (title, completion status, timer presence, etc.).
- **StreakDay.swift**: A struct that tracks completed streaks for each date.

#### 4. **Persistence Layer**
Manages the saving and restoring of state between app launches using system frameworks.

- **UserDefaults**: Stores task completion state, streak information, and reminder times.
- **NotificationManager.swift**: Responsible for managing local push notifications.
- **DateManager.swift**: Handles date-based logic, such as daily task resets.

---

### How It Works

- **State Management**:  
  The app does not use complex models or view models. Instead, it relies on `@State`, `@AppStorage`, and simple structs within the views to handle state.
  
- **Persistence**:  
  `UserDefaults` is utilized via `@AppStorage` to store the task completion state, streak data, and reminder settings.
  
- **Timers**:  
  Custom timers are implemented using `Timer.publish` or `DispatchQueue`, depending on the task type.

- **Notifications**:  
  Local notifications are scheduled using `UNUserNotificationCenter` to manage sleep reminders and daily check-in prompts.

- **UI Transitions**:  
  The transition from the splash screen to the content view is managed by `RootView.swift`.

---

### Why This Structure?

This architecture is optimized for rapid prototyping and beginner-level SwiftUI development:
- Simple and easy to follow
- Direct state binding reduces complexity
- Lightweight with no external dependencies

---

### Scaling Considerations

As the app expands, the following adjustments are recommended:
- Refactor views and their associated logic into reusable components.
- Adopt MVVM using `ObservableObject` and `@StateObject` for better separation of concerns and scalability.
- Move constants, colors, and notification logic into separate helper files to maintain code clarity.
