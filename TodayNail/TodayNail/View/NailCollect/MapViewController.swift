//
//  MapViewController.swift
//  TodayNail
//
//  Created by 김초원 on 11/23/23.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

// MARK: 테스트 데이터 모델
struct Location {
    let location: CLLocationCoordinate2D
    let isOnline: Bool
}

class MapViewController: UIViewController {
    
    @IBOutlet weak var currentBtnBackView: UIView!
    
    // MARK: 테스트 데이터
    private var locations: [Location] = [
        Location(location: CLLocationCoordinate2D(latitude: 37.449229002583564, longitude: 126.65534435017746),
                 isOnline: true),
        Location(location: CLLocationCoordinate2D(latitude: 37.448061521989764, longitude: 126.65051284206753),
                 isOnline: false),
        Location(location: CLLocationCoordinate2D(latitude: 37.456890084393685, longitude: 126.65006487590571),
                 isOnline: false),
        Location(location: CLLocationCoordinate2D(latitude: 37.45178809868562, longitude: 126.65542302181191),
                 isOnline: true),
        Location(location: CLLocationCoordinate2D(latitude: 37.453074534794, longitude: 126.65166490988514),
                 isOnline: true),
        Location(location: CLLocationCoordinate2D(latitude: 37.45090408909064, longitude: 126.6613038641272),
                 isOnline: false),
        Location(location: CLLocationCoordinate2D(latitude: 37.54187695023674, longitude: 126.95247580718593),
                 isOnline: true),
        Location(location: CLLocationCoordinate2D(latitude: 37.540310515649004, longitude: 126.95583737028332),
                 isOnline: true),
        Location(location: CLLocationCoordinate2D(latitude: 37.54111875425007, longitude: 126.94921751985316),
                 isOnline: false),
        Location(location: CLLocationCoordinate2D(latitude: 37.53979090501977, longitude: 126.94666123767706),
                 isOnline: true),
        Location(location: CLLocationCoordinate2D(latitude: 37.54845995224114, longitude: 126.94993678169008),
                 isOnline: true)
        
    ]
    
    private var locationManager: CLLocationManager = CLLocationManager()
    private var currentLocation: CLLocation!

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        
        setupNavigationBar()
        setupLayout()
        setupMapView()
        setupPins()
    }
    
    @IBAction func didTapCurrentLocationBton(_ sender: UIButton) {
        mapView.setUserTrackingMode(.follow, animated: true)
    }
    
    func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false

        let backItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(moveToBackVC))
        backItem.tintColor = .purple
        
        let titleLabel = UILabel()
        titleLabel.text = "검색결과"
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .purple
        titleLabel.sizeToFit()
        
        let titleItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.leftBarButtonItems = [backItem, titleItem]
    }
    
    func setupLayout() {
        currentBtnBackView.layer.cornerRadius = 30
    }
    
    private func setupMapView() {
        self.mapView.delegate = self
        
        self.mapView.mapType = MKMapType.standard
        self.mapView.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: CustomAnnotationView.identifier)
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        self.mapView.setUserTrackingMode(.follow, animated: true)
    }
    
    private func setupPins() {
        locations.forEach { data in
            let pin = CustomAnnotation(isOnline: data.isOnline, coordinate: data.location)
            mapView.addAnnotation(pin)
        }
    }
    
    private func goLocation(latitudeValue: CLLocationDegrees,
                            longtudeValue: CLLocationDegrees,
                            delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        mapView.setRegion(pRegion, animated: true)
        return pLocation
    }

    // MARK: @objc methods
    @objc private func moveToBackVC() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!,
                       longtudeValue: (pLocation?.coordinate.longitude)!,
                       delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {(placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address: String = ""
            if country != nil {
                address = country!
            }
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
        })
        locationManager.stopUpdatingLocation()
    }
}

extension MapViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        guard let annotation = annotation as? CustomAnnotation else { return nil }

        var annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: CustomAnnotationView.identifier)

        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: CustomAnnotationView.identifier)
            annotationView?.canShowCallout = false
            annotationView?.contentMode = .scaleAspectFit

        } else {
            annotationView?.annotation = annotation
        }

        let markerImage: UIImage!
        let size = CGSize(width: 30, height: 30)
        UIGraphicsBeginImageContext(size)
        
        if annotation.isOnline! { markerImage = UIImage(named: "splash_icon") }
        else { markerImage = UIImage(named: "splash_icon") }

        markerImage.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        annotationView?.image = resizedImage

        return annotationView
    }
}
