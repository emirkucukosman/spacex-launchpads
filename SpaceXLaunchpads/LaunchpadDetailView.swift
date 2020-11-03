//
//  LaunchpadDetailView.swift
//  SpaceXLaunchpads
//
//  Created by Emir Küçükosman on 3.11.2020.
//

import SwiftUI

struct LaunchpadDetailView: View {
    let launchpad: LaunchpadViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                MapView(coordinate: launchpad.locationCoordinates)
                    .frame(height: 200)
                Text(launchpad.fullName)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding([.top, .leading, .trailing], 15)
                Text(launchpad.region)
                    .font(.headline)
                    .padding([.leading, .trailing], 15)
                Text(launchpad.details)
                    .multilineTextAlignment(.leading)
                    .padding()
                HStack {
                    Text("Launch Success Rate: \(launchpad.successRate, specifier: "%.2f")%")
                    Spacer()
                    Image(systemName: "circle.fill")
                        .foregroundColor(successRateColor(launchpad.successRate))
                }
                    .padding()
            }
            Spacer()
        }
    }
    
    func successRateColor(_ rate: Float) -> Color {
        if rate <= 0 {
            return Color.red
        } else if rate <= 50 && rate != 0 {
            return Color.orange
        } else {
            return Color.green
        }
    }
}

//struct LaunchpadDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        LaunchpadDetailView()
//    }
//}
