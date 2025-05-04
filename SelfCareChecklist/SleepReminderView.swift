//
//  SleepReminderView.swift
//  SelfCareChecklist
//
//  Created by Michael Eissen San Antonio on 5/3/25.
//

import SwiftUI
import UserNotifications

struct SleepReminderView: View {
    let onComplete: () -> Void

    @Environment(\.dismiss) private var dismiss
    @State private var selectedHour: Int = 22
    @State private var selectedMinute: Int = 0
    @State private var reminderExists = false
    @State private var existingTimeString: String?

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Sleep Reminder")
                    .font(.title3)
                    .bold()

                if let time = existingTimeString {
                    Text("⏰ Scheduled for: \(time)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                DatePicker("Time", selection: sleepTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()

                Button("Set Reminder") {
                    removeSleepReminder() // Remove existing if any
                    scheduleSleepReminder()
                    onComplete()
                    dismiss()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("GreenLight"))
                .foregroundColor(.white)
                .cornerRadius(12)

                if reminderExists {
                    Button("Cancel Reminder") {
                        removeSleepReminder()
                        reminderExists = false
                        existingTimeString = nil
                        dismiss()
                    }
                    .foregroundColor(.red)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Sleep Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                checkExistingReminder()
            }
        }
    }

    private var sleepTime: Binding<Date> {
        Binding<Date>(
            get: {
                var components = DateComponents()
                components.hour = selectedHour
                components.minute = selectedMinute
                return Calendar.current.date(from: components) ?? Date()
            },
            set: { newDate in
                let components = Calendar.current.dateComponents([.hour, .minute], from: newDate)
                selectedHour = components.hour ?? 22
                selectedMinute = components.minute ?? 0
            }
        )
    }

    private func scheduleSleepReminder() {
        let content = UNMutableNotificationContent()
        content.title = "🌙 Time to Sleep"
        content.body = "Wind down and get enough rest tonight. 😴"
        content.sound = .default

        var dateComponents = DateComponents()
        dateComponents.hour = selectedHour
        dateComponents.minute = selectedMinute

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "sleepReminder", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }

    private func removeSleepReminder() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["sleepReminder"])
    }

    private func checkExistingReminder() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            if let existing = requests.first(where: { $0.identifier == "sleepReminder" }),
               let trigger = existing.trigger as? UNCalendarNotificationTrigger,
               let hour = trigger.dateComponents.hour,
               let minute = trigger.dateComponents.minute {

                let formatter = DateFormatter()
                formatter.dateFormat = "h:mm a"
                var comps = DateComponents()
                comps.hour = hour
                comps.minute = minute
                if let date = Calendar.current.date(from: comps) {
                    let timeString = formatter.string(from: date)

                    DispatchQueue.main.async {
                        self.reminderExists = true
                        self.existingTimeString = timeString
                        self.selectedHour = hour
                        self.selectedMinute = minute
                    }
                }
            }
        }
    }
}
