//
//  ViewController.swift
//  pokemon-go
//
//  Created by Felipe Araujo on 01/04/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedWhenInUse && status != .notDetermined{
            let alertController = UIAlertController(title: "Permissão de localização", message: "Precisamos da sua localização para cacar pokemons", preferredStyle: .alert)
            let actionConfig = UIAlertAction(title: "Abrir Configurações", style: .default, handler: {
                (alertConfig) in
                if let configurations = NSURL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.open(configurations as URL)
                }
            })
            
            let actionCancel = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
            
            alertController.addAction(actionConfig)
            alertController.addAction(actionCancel)
            
            present(alertController,animated: true,completion: nil)
        }
    }


}

