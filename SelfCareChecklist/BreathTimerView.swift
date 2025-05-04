//
//  BreathTimerView.swift
//  SelfCareChecklist
//
//  Created by Michael Eissen San Antonio on 5/3/25.
//

import SwiftUI
import AVFoundation
import UserNotifications

struct BreathTimerView: View {
    let onFinish: () -> Void
    let onCancel: () -> Void

    @Environment(\.dismiss) private var dismiss
    @State private var selectedMinutes: Int? = nil
    @State private var remainingSeconds: Int = 0
    @State private var timer: Timer?
    @State private var player: AVAudioPlayer?

    var body: some View {
        VStack(spacing: 25) {
            Text("Deep Breathing")
                .font(.title2)
                .bold()
                .padding(.top, 20)

            // Timer Countdown UI
            if let selected = selectedMinutes {
                Text(formattedTime)
                    .font(.system(size: 44, design: .monospaced))
                    .padding()

                ProgressView(value: Double(selected * 60 - remainingSeconds), total: Double(selected * 60))
                    .progressViewStyle(LinearProgressViewStyle(tint: Color("GreenLight")))
                    .padding(.horizontal)

                HStack(spacing: 40) {
                    Button(role: .cancel) {
                        stopTimer()
                        onCancel()
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                    .padding()

                    Button("Finish Early") {
                        stopTimer()
                        onFinish()
                        dismiss()
                    }
                    .foregroundColor(.green)
                    .padding()

                }
                .padding(.horizontal)
            } else {
                // Time selection UI
                // Time selection UI
                VStack(spacing: 30) {
                    Text("Select Duration")
                        .font(.title)
                        .fontWeight(.semibold)

                    Button(action: {
                        startTimer(minutes: 5)
                    }) {
                        Text("5 Minutes")
                            .font(.title2)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("GreenLight"))
                            .foregroundColor(.white)
                            .cornerRadius(14)
                            .shadow(radius: 5)
                    }

                    Button(action: {
                        startTimer(minutes: 10)
                    }) {
                        Text("10 Minutes")
                            .font(.title2)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("GreenLight"))
                            .foregroundColor(.white)
                            .cornerRadius(14)
                            .shadow(radius: 5)
                    }
                }
                .padding(.horizontal, 30)
            }

            Spacer()
        }
        .onDisappear {
            stopTimer()
        }
        .padding()
    }

    private var formattedTime: String {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    private func startTimer(minutes: Int) {
        selectedMinutes = minutes
        remainingSeconds = minutes * 60

        // Start timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { t in
            if remainingSeconds > 0 {
                remainingSeconds -= 1
            } else {
                stopTimer()
                onFinish()
                playFinishSound()
                triggerHapticFeedback()
                dismiss()
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func playFinishSound() {
        if let soundURL = Bundle.main.url(forResource: "bellSound", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: soundURL)
                player?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }

    private func triggerHapticFeedback() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}
