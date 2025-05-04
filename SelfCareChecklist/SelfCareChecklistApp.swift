//
//  SelfCareChecklistApp.swift
//  SelfCareChecklist
//
//  Created by Michael Eissen San Antonio on 5/3/25.
//

import SwiftUI
import UserNotifications

@main
struct SelfCareChecklistApp: App {
    @State private var showSplash = true

    init() {
        requestNotification()
        scheduleDailyReminder()
    }

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }

    func requestNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
            if granted {
                print("Notification permission granted.")
            }
        }
    }

    func scheduleDailyReminder() {
        let content = UNMutableNotificationContent()
        content.title = "🌿 Self-Care Time"
        content.body = "Remember to complete your self-care checklist today!"
        content.sound = .default

        var dateComponents = DateComponents()
        dateComponents.hour = 9

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "dailyReminder", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
