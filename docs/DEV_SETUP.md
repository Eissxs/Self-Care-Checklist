# Developer Setup – SelfCareChecklist

This guide provides instructions to set up and run the **SelfCareChecklist** SwiftUI prototype locally for development and testing.

---

## System Requirements

- Xcode 15 or later  
- macOS Ventura or later  
- iOS Simulator (iOS 16 or newer recommended)  
- Apple Developer Account (required only for deployment to physical devices)

---

## Getting Started

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-username/SelfCareChecklist.git
   cd SelfCareChecklist
   ```

2. Open the Project in Xcode
Open `SelfCareChecklist.xcodeproj` using Xcode.

3. Run the Application
- Select an iOS simulator (e.g., iPhone 16e)
- Press `Cmd + R` to build and launch the app

---

## Permissions and Setup Notes

### Local Notifications
The app uses `UNUserNotificationCenter` to send local daily reminders (e.g., for sleep).  
Ensure you allow notification permissions when prompted on first launch.

### Data Persistence
All data is stored locally using `UserDefaults`. No backend or internet access is required.

### Deploying to a Physical Device
- Configure your Apple Developer Team in:  
  **Signing & Capabilities → Team**
- Ensure push notifications capability is enabled (used for local notifications only)

---

## Debugging Tips

### Daily Reset Not Working
Check the logic in `DateManager.swift` to verify date comparison and reset behavior.

### Notifications Not Triggering
- Verify that notification permissions are enabled in **Settings → Notifications**
- In the iOS Simulator, use **Features → Trigger Notification** to manually test notifications

---

For additional support or bug reports, please open an Issue in the repository.
