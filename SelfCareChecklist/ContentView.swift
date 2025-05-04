//
//  ContentView.swift
//  SelfCareChecklist
//
//  Created by Michael Eissen San Antonio on 5/3/25.
//

import SwiftUI
import Charts
import AVFoundation
import UserNotifications

struct Task: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool = false
}

struct StreakDay: Identifiable {
    let id = UUID()
    let day: String
    let completed: Bool
}

struct ContentView: View {
    @AppStorage("streak") private var streak: Int = 0
    @AppStorage("lastCompletionDate") private var lastCompletionDate: String = ""

    @State private var streakHistory: [StreakDay] = [
        StreakDay(day: "Mon", completed: true),
        StreakDay(day: "Tue", completed: true),
        StreakDay(day: "Wed", completed: true),
        StreakDay(day: "Thu", completed: false),
        StreakDay(day: "Fri", completed: true)
    ]

    @State private var walkHistory: [String] = []

    @State private var showWalkTimer = false
    @State private var showBreathTimerSheet = false
    @State private var showSleepReminder = false
    @State private var showWaterChecklist = false

    @State private var walkTaskID: UUID?
    @State private var taskCompletionMap: [String: Bool] = [:]

    private let taskTitles = [
        "Drink water",
        "Take a walk (20mins)",
        "Get enough rest",
        "Eat healthy",
        "Take deep breaths (5-10 minutes)"
    ]

    private var todayKey: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: Date())
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                HStack {
                    Image(systemName: "leaf.circle.fill")
                        .foregroundColor(Color("GreenLight"))
                        .font(.title2)
                    Text("Self-Care Checklist")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .padding(.top)

                VStack(spacing: 15) {
                    ForEach(taskTitles, id: \.self) { title in
                        HStack {
                            Text(title)
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: isTaskCompleted(title) ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(isTaskCompleted(title) ? Color("GreenDark") : .gray)
                                .onTapGesture {
                                    handleTaskTap(title)
                                }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
                    }
                }

                VStack(spacing: 10) {
                    Text("Current Streak")
                        .font(.headline)
                    Text("\(streak) day(s)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color("GreenLight"))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .shadow(radius: 4)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Weekly Progress")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Chart(streakHistory) { day in
                        BarMark(
                            x: .value("Day", day.day),
                            y: .value("Completed", day.completed ? 1 : 0)
                        )
                        .foregroundStyle(day.completed ? Color("GreenLight") : Color.gray.opacity(0.3))
                        .cornerRadius(6)
                    }
                    .frame(height: 120)
                }
                .padding(.horizontal)

                if !walkHistory.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Last 7 Walks")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        ForEach(walkHistory, id: \.self) { date in
                            HStack {
                                Image(systemName: "figure.walk")
                                    .foregroundColor(Color("GreenLight"))
                                Text(date)
                                    .font(.footnote)
                                    .foregroundColor(.primary)
                            }
                            .padding(.vertical, 2)
                        }
                    }
                    .padding(.horizontal)
                }

                Text("“You don't have to control your thoughts; you just have to stop letting them control you.”")
                    .italic()
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .padding()
        }
        .background(Color("Background").ignoresSafeArea())
        .onAppear {
            resetIfNewDay()
            loadTaskStates()
            loadWalkHistory()
        }
        .sheet(isPresented: $showWalkTimer) {
            WalkTimerView {
                markTaskComplete("Take a walk (20mins)")
                showWalkTimer = false
                loadWalkHistory()
            } onCancel: {
                showWalkTimer = false
            }
        }
        .sheet(isPresented: $showBreathTimerSheet) {
            BreathTimerView {
                markTaskComplete("Take deep breaths (5-10 minutes)")
            } onCancel: {}
        }
        .sheet(isPresented: $showSleepReminder) {
            SleepReminderView {
                markTaskComplete("Get enough rest")
            }
        }
        .sheet(isPresented: $showWaterChecklist) {
            WaterChecklistView {
                markTaskComplete("Drink water")
            }
        }
    }

    func taskKey(_ title: String) -> String {
        "task_\(title)_\(todayKey)"
    }

    func isTaskCompleted(_ title: String) -> Bool {
        taskCompletionMap[title] ?? false
    }

    func markTaskComplete(_ title: String) {
        let key = taskKey(title)
        UserDefaults.standard.set(true, forKey: key)
        taskCompletionMap[title] = true
        checkAllTasksCompleted()
    }

    func handleTaskTap(_ title: String) {
        if isTaskCompleted(title) { return }

        switch title {
        case "Take a walk (20mins)":
            walkTaskID = UUID()
            showWalkTimer = true
        case "Take deep breaths (5-10 minutes)":
            showBreathTimerSheet = true
        case "Get enough rest":
            showSleepReminder = true
        case "Drink water":
            showWaterChecklist = true
        default:
            markTaskComplete(title)
        }
    }

    func checkAllTasksCompleted() {
        let allDone = taskTitles.allSatisfy { isTaskCompleted($0) }
        let today = todayKey
        if allDone && today != lastCompletionDate {
            streak += 1
            lastCompletionDate = today
            updateStreakHistory()
        }
    }

    func resetIfNewDay() {
        let today = todayKey
        if today != lastCompletionDate {
            for title in taskTitles {
                let key = taskKey(title)
                UserDefaults.standard.removeObject(forKey: key)
            }
            taskCompletionMap = [:]
        }
    }

    func loadTaskStates() {
        for title in taskTitles {
            let key = taskKey(title)
            let value = UserDefaults.standard.bool(forKey: key)
            taskCompletionMap[title] = value
        }
    }

    func updateStreakHistory() {
        if streakHistory.count >= 7 {
            streakHistory.removeFirst()
        }
        streakHistory.append(StreakDay(day: weekdayAbbreviation(), completed: true))
    }

    func weekdayAbbreviation() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter.string(from: Date())
    }

    func loadWalkHistory() {
        walkHistory = UserDefaults.standard.stringArray(forKey: "walkHistory") ?? []
    }
}
