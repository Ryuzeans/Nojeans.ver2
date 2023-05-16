//
//  MapView.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/08.
//
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    let locationManager = CLLocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        view.setRegion(region, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
            super.init()
            parent.locationManager.delegate = self
            parent.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            parent.locationManager.requestWhenInUseAuthorization()
            parent.locationManager.startUpdatingLocation()
            parent.locationManager.stopUpdatingLocation()
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            parent.region.center = location.coordinate
        }
    }
}

