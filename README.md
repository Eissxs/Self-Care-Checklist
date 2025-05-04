# 🌿 Self-Care Checklist (Prototype)

**Self-Care Checklist** is a simple iOS prototype app built in SwiftUI to encourage consistent wellness habits like walking, drinking water, and practicing mindfulness. It uses daily checklists, streak tracking, local notifications, and timers to help users build self-care routines in a gentle, focused way.

> ⚠️ This is a **prototype project** – perfect for learning, showcasing SwiftUI features, and exploring wellness-focused app ideas.

---

## Features

- ✅ Daily self-care task checklist (e.g., hydration, walking, rest, breathing)
- 📅 Streak tracking system with automatic reset each day
- 📊 Bar chart visualizing weekly progress (using Swift Charts)
- ⏱️ Built-in 20-minute walk timer and 5–10 minute breathing timer
- 🔔 Local notification for a "Sleep Early" reminder
- 🧘 Zen-inspired minimalist UI with light green accents
- 📆 Walk history log (last 7 walk sessions)
- 💾 State persistence with `UserDefaults` (resets when a new day begins)

---

## 🛠️ Tech Stack

- Swift
- SwiftUI
- Swift Charts
- AVFoundation (for feedback sounds)
- UserNotifications (for reminders)
- UserDefaults (for state persistence)

---

## 📸 Screenshots

> *(Add screenshots of the checklist view, streak chart, timer screens, etc.)*

---

## 🧪 Project Goals

This prototype demonstrates:

- Creating reusable SwiftUI components
- Persisting and resetting daily task state
- Managing sheets and timers in SwiftUI
- Using `@AppStorage` and `UserDefaults` for lightweight data storage
- Applying clean UI/UX patterns for habit-building apps

---

## 📦 Installation

1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/self-care-checklist.git
2.	Open SelfCareChecklist.xcodeproj in Xcode
3.	Run on simulator or iOS device (iOS 16+ recommended)

---

⚠️ What Could Improve (to make it more “production-ready”)

⚠️ File Organization
	•	All logic is inside ContentView.swift. For scalability:
	•	Move task-related logic into a separate TaskManager.swift or ViewModel.
	•	Create a Models/ folder for Task, StreakDay.
	•	Move timer-related views to a Views/Timers/ folder.
	•	Use Assets.xcassets for named colors and images consistently.

⚠️ State Management
	•	Currently uses @State and @AppStorage directly in the view.
	•	Consider using ObservableObject + @StateObject for more scalable state management (MVVM pattern).
	•	This keeps UI logic reactive and testable.

⚠️ Hardcoded Strings
	•	Strings like "Drink water" or "Take deep breaths..." are repeated in multiple places.
	•	Use an enum or constant file to avoid errors and allow localization later.

⚠️ Persistence
	•	Uses UserDefaults for everything, which is fine for prototyping.
	•	For scaling, consider using CoreData or AppStorage with shared @ObservableObject.

---

🧑‍💻 Author

Created by Eissxs – Not Cowboy, Not Guru.
