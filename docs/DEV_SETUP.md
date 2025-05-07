# 🛠️ Developer Setup – SelfCareChecklist

This guide helps you set up and run the **SelfCareChecklist** SwiftUI prototype on your local machine.

---

## ✅ Requirements

- Xcode 15 or later
- macOS Ventura or later
- iOS Simulator (iOS 16+ recommended)
- Apple Developer Account (only needed if building on a real device)

---

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/SelfCareChecklist.git
   cd SelfCareChecklist

2. **Open the project in Xcode**

Open `SelfCareChecklist.xcodeproj` using Xcode.

3. **Run on Simulator or iOS Device**

- Select an iPhone simulator (e.g., iPhone 16e).
- Press `Cmd + R` to build and run.

---

## ⚠️ Permissions & Setup Notes

- **Notifications Permission**  
  The app uses `UNUserNotificationCenter` to send local reminders (e.g., for sleep reminders).  
  Make sure to allow notifications when prompted on first launch.

- **No Backend Required**  
  This app runs entirely offline using `UserDefaults` for local data persistence.

- **Running on Real Devices**
  - You may need to configure your Apple Developer Team in:  
    *Signing & Capabilities → Team*
  - Enable push notifications (for local notification testing, no server needed)

---

## 🧪 Debugging Tips

- If data isn’t resetting daily, check `DateManager.swift` logic.
- If notifications don’t show:
  - Confirm permissions were granted in device **Settings → Notifications**
  - Use the simulator menu: **Features → Trigger Notification** to test

---

If you run into issues, feel free to create an Issue in this repo.
