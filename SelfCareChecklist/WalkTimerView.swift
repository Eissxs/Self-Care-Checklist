//
//  WalkTimerView.swift
//  SelfCareChecklist
//
//  Created by Michael Eissen San Antonio on 5/3/25.
//

import SwiftUI
import AVFoundation
import UserNotifications

struct WalkTimerView: View {
    let totalSeconds = 20 * 60
    @AppStorage("walkStartTime") private var walkStartTime: Double = 0

    @State private var secondsLeft: Int = 0
    @State private var timer: Timer?
    @Environment(\.scenePhase) private var scenePhase

    let onComplete: () -> Void
    let onCancel: () -> Void

    var body: some View {
        VStack(spacing: 25) {
            Text("Take a Walk")
                .font(.title2)
                .bold()

            Text(timeString)
                .font(.system(size: 44, design: .monospaced))
                .padding()

            ProgressView(value: Double(totalSeconds - secondsLeft), total: Double(totalSeconds))
                .progressViewStyle(LinearProgressViewStyle(tint: Color("GreenLight")))
                .padding(.horizontal)

            Button(role: .cancel) {
                timer?.invalidate()
                walkStartTime = 0
                removeWalkNotification()
                onCancel()
            } label: {
                Text("Cancel")
                    .foregroundColor(.red)
            }

            Spacer()
        }
        .padding()
        .onAppear {
            initializeTimer()
        }
        .onChange(of: scenePhase) { phase in
            if phase == .active {
                resumeTimer()
            }
        }
        .onDisappear {
            timer?.invalidate()
        }
    }

    var timeString: String {
        let minutes = secondsLeft / 60
        let seconds = secondsLeft % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    func initializeTimer() {
        let now = Date().timeIntervalSince1970

        if walkStartTime == 0 {
            walkStartTime = now
            scheduleWalkNotification()
        }

        resumeTimer()
    }

    func resumeTimer() {
        let now = Date().timeIntervalSince1970
        let elapsed = Int(now - walkStartTime)
        let newSecondsLeft = max(totalSeconds - elapsed, 0)

        secondsLeft = newSecondsLeft

        if newSecondsLeft == 0 {
            finishWalk()
            return
        }

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if secondsLeft > 0 {
                secondsLeft -= 1
            } else {
                finishWalk()
            }
        }
    }

    func finishWalk() {
        timer?.invalidate()
        walkStartTime = 0
        removeWalkNotification()
        saveWalkToHistory()
        giveFeedback()
        onComplete()
    }

    func giveFeedback() {
        AudioServicesPlaySystemSound(SystemSoundID(1005)) // Soft bell
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }

    func scheduleWalkNotification() {
        let content = UNMutableNotificationContent()
        content.title = "✅ Walk Complete"
        content.body = "Your 20-minute walk is done. Great job!"
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(totalSeconds), repeats: false)

        let request = UNNotificationRequest(identifier: "walkComplete", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }

    func removeWalkNotification() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["walkComplete"])
    }

    func saveWalkToHistory() {
        var history = UserDefaults.standard.stringArray(forKey: "walkHistory") ?? []
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())

        history.append(dateString)
        if history.count > 7 {
            history = Array(history.suffix(7))
        }

        UserDefaults.standard.set(history, forKey: "walkHistory")
    }
}
