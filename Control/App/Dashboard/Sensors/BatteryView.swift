//
//  BatteryView.swift
//  Control
//
//  Created by Joe Blau on 11/20/20.
//

import SwiftUI

struct BatteryView: View {
    @State private var batteryLevel = 100.0
    @State private var batteryState: BatteryState = .charging
    
    var body: some View {
        Form {
            Picker("State:", selection: $batteryState) {
                ForEach(BatteryState.allCases, id: \.self) { state in
                    Text(state.rawValue)
                }
            }
                    .pickerStyle(RadioGroupPickerStyle())
            VStack {
                Text("Current battery percentage: \(Int(round(batteryLevel)))%")
                Slider(value: $batteryLevel, in: 0...100, onEditingChanged: levelChanged, minimumValueLabel: Text("0%"), maximumValueLabel: Text("100%")) {
                    Text("Level:")
                }
            }

            Spacer()
        }
        .padding()
    }
    
    /// Triggered when the user adjusts the battery level.
    func levelChanged(_ isEditing: Bool) {
    }
    
}

struct BatteryView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryView()
    }
}