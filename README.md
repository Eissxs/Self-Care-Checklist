# **Self-Care Checklist v1.0 (Prototype)**  
*ITEL315 – Elective iOS Development*

**Self-Care Checklist** is a lightweight iOS prototype developed in **SwiftUI** to promote consistent wellness habits such as walking, hydration, and mindfulness. It features a daily checklist, streak tracking, local notifications, and built-in timers to help users build healthy routines in a focused and gentle manner.

> **Note:** This is a **prototype-level project** designed for learning purposes, showcasing SwiftUI capabilities, and exploring wellness-oriented app concepts.

---

## **Key Features**

- **Daily Checklist:** Track wellness activities like hydration, walking, rest, and deep breathing  
- **Streak Tracking:** Automatically resets daily; visualizes consistency  
- **Weekly Progress Chart:** Displays user progress using **Swift Charts**  
- **Timers:** Includes a 20-minute walk timer and a 5–10 minute breathing session timer  
- **Notifications:** Local reminder for “Sleep Early” task  
- **UI Design:** Minimalist, Zen-inspired interface with soft green accent tones  
- **Walk History:** Displays the user’s last 7 walking sessions  
- **Persistence:** Uses `UserDefaults` to persist state and reset at the start of a new day

---

## **Tech Stack**

- **Swift**
- **SwiftUI**
- **Swift Charts**
- **AVFoundation** – for feedback audio cues  
- **UserNotifications** – for local reminders  
- **UserDefaults** – for lightweight data persistence

---

## **App Screenshots**

<div align="center">
  <img src="https://github.com/user-attachments/assets/cbf7b521-8f87-4585-89db-e0b26d88d9bb" width="45%" />
  <img src="https://github.com/user-attachments/assets/bd81cdc8-408a-45a7-96ce-82d32e2945fb" width="45%" />
</div>
<br/>
<div align="center">
  <img src="https://github.com/user-attachments/assets/3f60296a-1ef4-459e-8836-f4c3d2c8ed16" width="45%" />
  <img src="https://github.com/user-attachments/assets/d6d5ad95-7842-4c2c-90d7-f9355b89af7f" width="45%" />
</div>
<br/>
<div align="center">
  <img src="https://github.com/user-attachments/assets/e473886c-cb20-4de2-8f4c-951df059ed7d" width="45%" />
</div>

---

## **Project Objectives**

This prototype showcases the following:

- Development of reusable SwiftUI components  
- Task state persistence and automatic daily reset  
- Integration of sheets, timers, and view logic using SwiftUI  
- Usage of `@AppStorage` and `UserDefaults` for simple state management  
- Implementation of clean, user-friendly UI/UX for habit-forming experiences

---

## **Installation Instructions**

1. Clone the repository:  
   ```bash
   git clone https://github.com/Eissxs/self-care-checklist.git
   ```

2. Open `SelfCareChecklist.xcodeproj` in Xcode  
3. Run on a simulator or physical iOS device (**iOS 16+ recommended**)

---

## **Areas for Improvement (Toward Production Readiness)**

### **1. File Organization**

- All logic is currently in `ContentView.swift`  
- **Recommended refactor:**  
  - Move task logic into `TaskManager.swift` or a dedicated ViewModel  
  - Create a `Models/` directory for data types like `Task`, `StreakDay`  
  - Extract timer views into a `Views/Timers/` subfolder  
  - Use `Assets.xcassets` consistently for color and image management  

### **2. State Management**

- Uses `@State` and `@AppStorage` directly within views  
- Consider migrating to `ObservableObject` with `@StateObject` for scalable and modular state control (MVVM architecture)  
- This improves testability and separation of concerns  

### **3. Hardcoded Strings**

- Repetitive use of strings such as “Drink water” and “Take deep breaths”  
- Use constants or enums to support localization and reduce risk of inconsistency  

### **4. Data Persistence**

- Currently relies solely on `UserDefaults`  
- For more scalable data handling, consider using `CoreData` or shared state management with `@ObservableObject` and `AppStorage`

---

## **Documentation**

- [**UI Flow Diagram**](docs/UI_Flow_Diagram.png) *(Note: Created using Eraser AI; not fully accurate)*  
- [**Architecture Overview**](docs/Architecture_Overview.png)  
- [**Developer Setup Guide**](docs/DEV_SETUP.md)

---

## **Author**

Developed by **Eissxs**  
*“When I wrote this code, only God and I understood what I did. Welp, now only God knows.”*
