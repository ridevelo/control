//
//  DashboardView.swift
//  Control
//
//  Created by Joe Blau on 11/20/20.
//

import SwiftUI
import ComposableArchitecture

struct DashboardView: View {
    let store: Store<AppState, AppAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                DevicesView(appStore: store,
                            store: store.scope(state: { $0.devicesState },
                                               action: { AppAction.devicesAction($0) }))
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button(action: {}) {
                            Image(systemName: "power")
                                .foregroundColor(.green)
                        }
                    }
                }
                Text("Select Device")
                .navigationTitle("")
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Picker(selection: viewStore.binding(get: { $0.selectedSensor }, send: { .setSelectedSensor($0) }), label: Text("")) {
                            ForEach(0..<SelectedSensor.allCases.count) { index in
                                Text(SelectedSensor.allCases[index].rawValue).tag(SelectedSensor.allCases[index])
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
            }
            .navigationViewStyle(DefaultNavigationViewStyle())
        }
    }
}

#if DEBUG
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(store: sampleControlViewReducer)
    }
}
#endif