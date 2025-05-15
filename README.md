# **Self-Care Checklist v1.0**

![Swift](https://img.shields.io/badge/Swift-5.0%2B-orange)
![Platform](https://img.shields.io/badge/Platform-iOS%2016.0%2B-blue)
![License](https://img.shields.io/badge/License-Apache--2.0-green)
![Status](https://img.shields.io/badge/Status-Prototype-yellow)

*ITEL315 – Elective iOS Development*

Self-Care Checklist is a lightweight iOS app built with SwiftUI that helps users establish and maintain daily wellness habits such as walking, hydration, and mindfulness. With features like daily activity tracking, streak visualization, and built-in timers, Self-Care Checklist makes forming healthy routines simple and rewarding.

> **Note:** This is a **prototype-level project** designed for learning purposes, showcasing SwiftUI capabilities, and exploring wellness-oriented app concepts.

## **Key Features**

- **Daily Checklist**
  - Track essential wellness activities
  - Water intake monitoring
  - Walking session tracking
  - Deep breathing exercise log
  - Rest period documentation
  - Automatic daily reset

- **Streak Tracking**
  - Visual consistency indicators
  - Daily and weekly statistics
  - Motivational milestone messages
  - Progress visualization
  - Historical performance data

- **Built-in Timers**
  - 20-minute walk timer with haptic feedback
  - 5-10 minute breathing exercise timer
  - Audio cues for session progress
  - Minimalist countdown interface
  - Background mode support

- **Progress Visualization**
  - Weekly progress chart using Swift Charts
  - Walking history for the past 7 sessions
  - Daily completion percentage
  - Trend analysis visualization
  - Customizable display options

- **User Experience**
  - Minimalist, distraction-free design
  - Zen-inspired interface elements
  - Soft green accent color palette
  - Intuitive single-tap interactions
  - Focus on simplicity and clarity

## **Tech Stack**

- **Framework:** SwiftUI
- **Data Visualization:** Swift Charts
- **Audio:** AVFoundation
- **Data Persistence:** UserDefaults
- **Notifications:** UserNotifications
- **Design:** SF Symbols, Custom Color Palette

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

## **Project Structure**

```
SelfCareChecklist/
├── BreathTimerView.swift        # Timer view for breathing exercises (5/10 min)
├── ContentView.swift            # Main screen with daily task checklist and streaks
├── RootView.swift               # Entry view that switches between splash and home
├── SelfCareChecklistApp.swift   # App entry point (@main), handles launch logic
├── SleepReminderView.swift      # View to configure sleep reminder time
├── SplashScreenView.swift       # Minimal splash animation on launch
├── WalkTimerView.swift          # 20-minute walk timer with haptics and logic
└── WaterChecklistView.swift     # Water intake tracking (morning/lunch/dinner)
```

## **Requirements**

- iOS 16.0+
- Xcode 14.0+
- Swift 5.0+

## **Installation**

1. Clone the repository:
   ```bash
   git clone https://github.com/Eissxs/self-care-checklist.git
   ```

2. Open `SelfCareChecklist.xcodeproj` in Xcode

3. Build and run the project

## **Features in Detail**

### Daily Activity Tracking
- Simple checklist interface
- Automatic daily reset
- Visual completion indicators
- Progress statistics
- Consistency tracking

### Timer Functionality
- Guided walk timer (20 minutes)
- Breathing exercise timer (5-10 minutes)
- Audio and haptic feedback
- Session completion tracking
- Background mode support

### Progress Visualization
- Weekly activity charts
- Walking session history
- Visual streak indicators
- Daily completion rate
- Trend visualization

### Wellness Reminders
- Sleep time notifications
- Hydration reminders
- Configurable alert times
- Non-intrusive messaging
- Daily schedule support

## **Privacy Permissions**

The app requires the following permissions:
- Notifications (for wellness reminders)

## **Contributing**

Feel free to submit issues and enhancement requests!

## **License**

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## **Documentation**

- [**UI Flow Diagram**](docs/UI_Flow_Diagram.png) *(Note: Created using Eraser AI; not fully accurate)*  
- [**Architecture Overview**](docs/Architecture_Overview.png)  
- [**Developer Setup Guide**](docs/DEV_SETUP.md)

## **Areas for Improvement (Toward Production Readiness)**

### Architecture & Code Quality
- Move task logic into dedicated managers or ViewModels
- Create a structured Models directory for data types
- Extract reusable components into separate files
- Implement comprehensive unit tests and UI tests
- Add CI/CD pipeline for automated testing and deployment
- Enhance error handling and logging mechanisms
- Add comprehensive code documentation

### State Management
- Refactor from direct `@State` and `@AppStorage` to more scalable patterns
- Implement proper state separation and management
- Improve data flow architecture
- Consider MVVM for better separation of concerns

### Data Persistence
- Evaluate migration from `UserDefaults` to CoreData for robust persistence
- Implement proper data backup and sync mechanisms
- Add user profile and settings persistence
- Implement data export and reporting features

### Features & UX
- Add achievement and milestone system
- Implement social sharing capabilities
- Enhance accessibility features
- Add localization support for multiple languages
- Implement advanced analytics for habit tracking
- Add customizable reminder schedules
- Create personalized wellness recommendations

### Infrastructure
- Set up proper monitoring and crash reporting
- Implement analytics for user behavior tracking
- Add proper versioning and update mechanism
- Prepare for App Store submission requirements

## **Project Objectives**

This prototype demonstrates:
- Development of reusable SwiftUI components
- Task state persistence and automatic daily reset
- Integration of sheets, timers, and view logic
- Usage of `@AppStorage` and `UserDefaults` for simple state management
- Implementation of clean, user-friendly UI/UX for habit-forming experiences

## **Author**

Developed by **Eissxs**

## **Acknowledgments**

- Apple SwiftUI Framework
- Swift Charts
- AVFoundation
- UserNotifications Framework

---

*"Build healthy habits one check at a time with Self-Care Checklist!"* 

---
