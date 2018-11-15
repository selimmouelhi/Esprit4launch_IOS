//
//  MapViewController.swift
//  Esprit4Launch
//
//  Created by selim mouelhi on 11/15/18.
//  Copyright © 2018 selim mouelhi. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit

class MapViewController: UIViewController {
    
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
       
        self.locationManager = CLLocationManager()
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        
        
        
        
        
        
       /*GMSServices.provideAPIKey("AIzaSyDHNR3vAW0ePVGSFhG8ABlI5LIbAHo_5FY")
        let camera = GMSCameraPosition.camera(withLatitude: 36.899470, longitude: 10.189613, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView*/
       
        
     }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

   
}
