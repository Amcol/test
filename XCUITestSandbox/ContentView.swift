//
//  ContentView.swift
//  XCUITestSandbox
//
//  Created by Amcol on 10.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var textFieldText: String = ""
    @State private var sliderValue: Double = 0.5
    @State private var selectedSegment: Int = 0
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var navigationTitle: String = "Home"
    @State private var toggleState: Bool = false
    @State private var stepperValue: Int = 0
    @State private var selectedDate: Date = Date()
    @State private var showText: Bool = false

    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            // Button to show text
            Button(action: {
                showText = true
            }) {
                Text("Show Text")
                    .padding()
            }
            .cornerRadius(8)
            .padding()
            .accessibilityIdentifier("ShowTextButton")

            if showText {
                Text("Hello, World!")
                    .accessibilityIdentifier("HelloWorldText")
            }

            // Toggle
            Toggle(isOn: $toggleState) {
                Text("Toggle State: \(toggleState ? "On" : "Off")")
            }
            .padding()
            .accessibilityIdentifier("Toggle")

            // Date Picker
            DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                .padding()
                .accessibilityIdentifier("DatePicker")

            // Buttons
            HStack(spacing: 20) {
                Button(action: {
                    showAlert = true
                    alertMessage = "You pressed the Red button"
                }) {
                    Text("Red")
                        .padding()
                }
                .background(.red)
                .foregroundColor(.white)
                .cornerRadius(8)
                .accessibilityIdentifier("RedButton")

                Button(action: {
                    showAlert = true
                    alertMessage = "You pressed the Green button"
                }) {
                    Text("Green")
                        .padding()
                }
                .background(.green)
                .cornerRadius(8)
                .accessibilityIdentifier("GreenButton")

                Button(action: {
                    showAlert = true
                    alertMessage = "You pressed the Blue button"
                }) {
                    Text("Blue")
                        .padding()
                }
                .background(.blue)
                .cornerRadius(8)
                .accessibilityIdentifier("BlueButton")
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Button Pressed"),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
            .padding()

            Spacer()
        }
        .navigationTitle(navigationTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
