//
//  MapViewViewController.swift
//  Coffee Tea or
//
//  Created by WeiFangChou on 2021/5/6.
//

import UIKit
import MapKit

class MapViewViewController: UIViewController {
    
    @IBOutlet var MapView: MKMapView!
    var coffee : Coffee?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        MapView.delegate = self
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .label
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(coffee?.address ?? "") { placemarks, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            if let placemarks = placemarks{
                let placemark = placemarks[0]
                
                let annotaion = MKPointAnnotation()
                annotaion.title = self.coffee?.name
                annotaion.subtitle = self.coffee?.city
                
                if let location = placemark.location{
                    annotaion.coordinate = location.coordinate
                    self.MapView.showAnnotations([annotaion], animated: true)
                    self.MapView.selectAnnotation(annotaion, animated: true)
                }
                
            }
        }
    }
    


}

extension MapViewViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyMap"
        if annotation.isKind(of: MKUserLocation.self){
            return nil
        }
        var annotationView : MKMarkerAnnotationView? = MapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier )
        }
        annotationView?.glyphText = self.coffee?.name
        annotationView?.glyphTintColor = .orange
        
        
        return annotationView
    }
}
