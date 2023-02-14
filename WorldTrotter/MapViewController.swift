//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Sarah Mogin on 2/13/23.
//

import UIKit
import MapKit

//let cities = [CityNames.brooklyn, CityNames.portland, CityNames.rio, CityNames.sp]
let usCities = [CityNames.brooklyn, CityNames.portland]
let brazilCities = [CityNames.rio, CityNames.sp]

enum CityNames: String {
    case brooklyn = "Brooklyn"
    case portland = "Portland"
    case rio      = "Rio"
    case sp       = "São Paulo"
}

class MapViewController: UIViewController, MKMapViewDelegate {
    var mapView: MKMapView!
    var mapTypeSegmentedControl: UISegmentedControl!
    var centerSegmentedControl: UISegmentedControl!
    var countryButton: UIButton!
    var cities = usCities
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        print("MAP VIEW DID CHANGE")
    }
    
    override func loadView() {
        mapView = MKMapView()
        mapView.delegate = self
        view = mapView
        
        
        initMapTypeSegmentedControl()
        initCenterSegmentedControl()
        initCountryButton()
    }
    
    func initMapTypeSegmentedControl() {
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")

        
        mapTypeSegmentedControl
            = UISegmentedControl(items: [standardString, hybridString, satelliteString])
        mapTypeSegmentedControl.backgroundColor = UIColor.white
        mapTypeSegmentedControl.selectedSegmentIndex = 0
        mapTypeSegmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        mapTypeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapTypeSegmentedControl)
        
        let topConstraint =
            mapTypeSegmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint =
            mapTypeSegmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint =
            mapTypeSegmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    func initCenterSegmentedControl() {
        centerSegmentedControl = UISegmentedControl(items: cities.map {
            (c: CityNames) -> String in
            c.rawValue
        })
        centerSegmentedControl.backgroundColor = UIColor.purple
        centerSegmentedControl.selectedSegmentTintColor = UIColor.systemIndigo
        centerSegmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.cyan], for: .selected)
        centerSegmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        
        centerSegmentedControl.selectedSegmentIndex = 0
        centerSegmentedControl.addTarget(self, action: #selector(centerChanged(_:)), for: .valueChanged)
        centerChanged(centerSegmentedControl)
        
        centerSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerSegmentedControl)
        
        let topConstraint =
        centerSegmentedControl.topAnchor.constraint(equalTo: mapTypeSegmentedControl.bottomAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint =
            centerSegmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint =
            centerSegmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    
    @objc func centerChanged(_ segControl: UISegmentedControl) {
        var center: CLLocationCoordinate2D
        switch cities[segControl.selectedSegmentIndex] {
        case .brooklyn:
            center = CLLocationCoordinate2D(latitude: 40.6782, longitude: -73.9442)
        case .portland:
            center = CLLocationCoordinate2D(latitude:45.5152, longitude: -122.6784)
        case .rio:
            center = CLLocationCoordinate2D(latitude:-22.9068, longitude: -43.1729)
        case .sp:
            center = CLLocationCoordinate2D(latitude:-23.5558, longitude: -46.6396)
        }
        
        mapView.setCenter(center, animated: true)
    }
    
    func initCountryButton() {
        countryButton = UIButton(type: .system)
        countryButton.backgroundColor = UIColor.orange
        countryButton.setTitle("Toggle Country", for: .normal)
        countryButton.tintColor = UIColor.white
        countryButton.addTarget(self, action: #selector(countryButtonTouchUp(_:)), for: .touchUpInside)
        
        countryButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(countryButton)
        
        let topConstraint =
            countryButton.topAnchor.constraint(equalTo: centerSegmentedControl.bottomAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint =
            countryButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint =
            countryButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    
    @objc func countryButtonTouchUp(_ button: UIButton) {
        cities = (cities == usCities) ? brazilCities : usCities
        initCenterSegmentedControl()
    }
}
