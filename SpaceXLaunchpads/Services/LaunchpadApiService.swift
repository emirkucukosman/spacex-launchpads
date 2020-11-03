//
//  LaunchpadApiService.swift
//  SpaceXLaunchpads
//
//  Created by Emir Küçükosman on 3.11.2020.
//

import Foundation

final class LaunchpadApiService: ObservableObject {
    
    static let shared = LaunchpadApiService()
    
    private init() {}
    
    func getLaunchpads(completion: @escaping ([Launchpad]?, String?) -> Void) {
        
        guard let url = URL(string: "https://api.spacexdata.com/v4/launchpads") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                DispatchQueue.main.async {
                    completion(nil, error!.localizedDescription)
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse, let data = data else {
                DispatchQueue.main.async {
                    completion(nil, "Can not get response from the server")
                }
                return
            }
            
            if response.statusCode == 200 {
                guard let json = try? JSONDecoder().decode([Launchpad].self, from: data) else {
                    DispatchQueue.main.async {
                        completion(nil, "Can not read data from the response")
                    }
                    return
                }
                DispatchQueue.main.async {
                    completion(json, nil)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil, "Can not get response from the server")
                }
                return
            }
            
        }
        .resume()
        
    }
    
}
