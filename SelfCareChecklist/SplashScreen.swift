//
//  SplashScreen.swift
//  SelfCareChecklist
//
//  Created by Michael Eissen San Antonio on 5/3/25.
//

import SwiftUI

struct SplashScreen: View {
    @State private var opacity = 0.0

    var body: some View {
        ZStack {
            Color(red: 249/255, green: 242/255, blue: 225/255)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Image("AppLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .opacity(opacity)
                    .animation(.easeIn(duration: 1.0), value: opacity)

                Text("Treat yo self. No explanation needed.")
                    .font(.headline)
                    .foregroundColor(Color(red: 0/255, green: 45/255, blue: 4/255))
                    .opacity(opacity)
                    .animation(.easeIn(duration: 1.3).delay(0.3), value: opacity)

                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color(red: 0/255, green: 45/255, blue: 4/255)))
                    .scaleEffect(1.2)
                    .opacity(opacity)
                    .animation(.easeIn(duration: 1.0).delay(0.5), value: opacity)
            }
        }
        .onAppear {
            opacity = 1.0
        }
    }
}
