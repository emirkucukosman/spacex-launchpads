//
//  LaunchpadListViewModel.swift
//  SpaceXLaunchpads
//
//  Created by Emir Küçükosman on 3.11.2020.
//

import Foundation
import CoreLocation

class LaunchpadListViewModel: ObservableObject {
    
    @Published var launchpadVMs: [LaunchpadViewModel]?
    @Published var errorMessage: String?
    
    init() {
        LaunchpadApiService.shared.getLaunchpads { (launchpads, error) in
            if let error = error {
                return self.errorMessage = error
            }
            if let launchpads = launchpads {
                self.launchpadVMs = launchpads.map({ LaunchpadViewModel(launchpad: $0) })
            }
        }
    }
    
}

struct LaunchpadViewModel: Codable, Hashable {
    
    private let launchpad: Launchpad
    
    init(launchpad: Launchpad) {
        self.launchpad = launchpad
    }
    
    var name: String {
        return launchpad.name
    }
    
    var details: String {
        return launchpad.details
    }
    
    var region: String {
        return launchpad.region
    }
    
    var fullName: String {
        return launchpad.full_name
    }
    
    var status: String {
        return launchpad.status
    }
    
    var successRate: Float {
        return launchpad.launch_successes != 0 && launchpad.launch_attempts != 0
            ? (launchpad.launch_successes / launchpad.launch_attempts) * 100
            : 0
    }
    
    var locationCoordinates: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: launchpad.latitude,
            longitude: launchpad.longitude
        )
    }
    
}
