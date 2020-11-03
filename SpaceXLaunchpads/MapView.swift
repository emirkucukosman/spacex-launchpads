//
//  MapView.swift
//  SpaceXLaunchpads
//
//  Created by Emir Küçükosman on 3.11.2020.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let coordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.addAnnotation(annotation)
        uiView.setRegion(region, animated: true)
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
