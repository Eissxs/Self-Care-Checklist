//
//  WaterChecklistView.swift
//  SelfCareChecklist
//
//  Created by Michael Eissen San Antonio on 5/3/25.
//

import SwiftUI

struct WaterChecklistView: View {
    @Environment(\.dismiss) var dismiss

    @AppStorage("morningCheckedDate") private var morningCheckedDate = ""
    @AppStorage("lunchCheckedDate") private var lunchCheckedDate = ""
    @AppStorage("dinnerCheckedDate") private var dinnerCheckedDate = ""

    private var todayKey: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: Date())
    }

    var onComplete: () -> Void

    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                Text("Drink Water (500ml each)")
                    .font(.title2)
                    .fontWeight(.semibold)

                checklistRow(title: "Morning", isChecked: morningChecked)
                checklistRow(title: "Lunch", isChecked: lunchChecked)
                checklistRow(title: "Dinner", isChecked: dinnerChecked)

                Spacer()
            }
            .padding()
            .background(Color("Background").ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
        .onChange(of: allChecked) { allDone in
            if allDone {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    onComplete()
                    dismiss()
                }
            }
        }
    }

    var allChecked: Bool {
        morningCheckedDate == todayKey &&
        lunchCheckedDate == todayKey &&
        dinnerCheckedDate == todayKey
    }

    @ViewBuilder
    func checklistRow(title: String, isChecked: Binding<Bool>) -> some View {
        HStack {
            Text(title)
            Spacer()
            Image(systemName: isChecked.wrappedValue ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isChecked.wrappedValue ? Color("GreenDark") : .gray)
                .onTapGesture {
                    isChecked.wrappedValue.toggle()
                }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }

    private var morningChecked: Binding<Bool> {
        Binding<Bool>(
            get: { morningCheckedDate == todayKey },
            set: { morningCheckedDate = $0 ? todayKey : "" }
        )
    }

    private var lunchChecked: Binding<Bool> {
        Binding<Bool>(
            get: { lunchCheckedDate == todayKey },
            set: { lunchCheckedDate = $0 ? todayKey : "" }
        )
    }

    private var dinnerChecked: Binding<Bool> {
        Binding<Bool>(
            get: { dinnerCheckedDate == todayKey },
            set: { dinnerCheckedDate = $0 ? todayKey : "" }
        )
    }
}
