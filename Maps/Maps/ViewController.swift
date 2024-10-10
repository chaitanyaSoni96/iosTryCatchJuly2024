//
//  ViewController.swift
//  Maps
//
//  Created by Chaitanya Soni on 10/10/24.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    private var longTap: UILongPressGestureRecognizer?
    
    let locationManager = CLLocationManager()
    private var currentAnnotations: [MKPointAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        mapView.showsBuildings = true
        mapView.mapType = .satelliteFlyover
        let eiffelTowerCoordinates = CLLocationCoordinate2DMake(48.85815, 2.29452)
        mapView.region = MKCoordinateRegion(center: eiffelTowerCoordinates, latitudinalMeters: 1000, longitudinalMeters: 100) // sets the visible region of the map
        
        // create a 3D Camera
        let mapCamera = MKMapCamera()
        mapCamera.centerCoordinate = eiffelTowerCoordinates
        mapCamera.pitch = 45
        mapCamera.altitude = 1000 // example altitude
        mapCamera.heading = 90
        
        // set the camera property
        mapView.camera = mapCamera
        
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longTapOnMap(_:)))
        longTap.minimumPressDuration = 2
        longTap.numberOfTapsRequired = 0
        self.longTap = longTap
        mapView.addGestureRecognizer(longTap)
        
    }
        
    @objc func longTapOnMap(_ gesture: UIGestureRecognizer) {
        guard gesture.state == .ended else { return }
        
        
        let touchPoint = gesture.location(in: mapView)
        let coordinates = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        annotation.title = "some"
        mapView.addAnnotation(annotation)
        if self.currentAnnotations.count > 1, let lastAnnotation = self.currentAnnotations.last {
            showRouteOnMap(pickupCoordinate: lastAnnotation.coordinate, destinationCoordinate: coordinates)
        } else {
            showRouteOnMap(pickupCoordinate: mapView.userLocation.coordinate, destinationCoordinate: coordinates)
        }
        self.currentAnnotations.append(annotation)
    }
    
    @IBAction func currentLocationButtonTapped(_ sender: Any) {
        var region = MKCoordinateRegion()
        region.center = mapView.userLocation.coordinate
        region.span = .init(latitudeDelta: 0.1, longitudeDelta: 0.1)
        mapView.setRegion(region, animated: true)
        
    }
    
    func showRouteOnMap(pickupCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {

        let sourcePlacemark = MKPlacemark(coordinate: pickupCoordinate, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate, addressDictionary: nil)

        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)

        let sourceAnnotation = MKPointAnnotation()

        if let location = sourcePlacemark.location {
            sourceAnnotation.coordinate = location.coordinate
        }

        let destinationAnnotation = MKPointAnnotation()

        if let location = destinationPlacemark.location {
            destinationAnnotation.coordinate = location.coordinate
        }

        self.mapView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )

        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile

        // Calculate the direction
        let directions = MKDirections(request: directionRequest)

        directions.calculate {
            (response, error) -> Void in

            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }

                return
            }

            let route = response.routes[0]

            self.mapView.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)

            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {

        let renderer = MKPolylineRenderer(overlay: overlay)

        renderer.strokeColor = UIColor.random

        renderer.lineWidth = 5.0

        return renderer
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(manager)
    }
    
    
    
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
