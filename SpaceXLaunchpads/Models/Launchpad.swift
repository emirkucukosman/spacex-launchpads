//
//  Launchpad.swift
//  SpaceXLaunchpads
//
//  Created by Emir Küçükosman on 3.11.2020.
//

import Foundation

struct Launchpad: Codable, Hashable {
    let name: String
    let full_name: String
    let details: String
    let region: String
    let latitude: Double
    let longitude: Double
    let launch_attempts: Float
    let launch_successes: Float
    let status: String
}
