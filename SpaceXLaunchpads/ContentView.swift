//
//  ContentView.swift
//  SpaceXLaunchpads
//
//  Created by Emir Küçükosman on 3.11.2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var launchpadListVM = LaunchpadListViewModel()
    
    @ViewBuilder
    var body: some View {
        if let error = launchpadListVM.errorMessage {
            Text(error)
                .foregroundColor(.primary)
        }
        if launchpadListVM.launchpadVMs == nil && launchpadListVM.errorMessage == nil {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        }
        if let launchpads = launchpadListVM.launchpadVMs {
            NavigationView {
                List(launchpads, id: \.self) { launchpad in
                    NavigationLink(destination: LaunchpadDetailView(launchpad: launchpad)) {
                        HStack {
                            Text(launchpad.name)
                            Spacer()
                            Image(systemName: "circle.fill")
                                .foregroundColor(launchpad.status == "active" ? .green : .red)
                        }
                    }
                }
                .navigationBarTitle("SpaceX Launchpads", displayMode: .inline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
