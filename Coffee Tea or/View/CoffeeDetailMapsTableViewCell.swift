//
//  CoffeeDetailMapsTableViewCell.swift
//  Coffee Tea or
//
//  Created by WeiFangChou on 2021/5/5.
//

import UIKit
import MapKit

class CoffeeDetailMapsTableViewCell: UITableViewCell {
    
    @IBOutlet var mapView:MKMapView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(location: String) {
        
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(location, completionHandler:{ pleacemarks, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            if let placemarks = pleacemarks{
                let placemark = placemarks[0]
                
                let annotaion = MKPointAnnotation()
                if let location = placemark.location{
                    annotaion.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotaion)
                    let region = MKCoordinateRegion(center: annotaion.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                    //半徑250m
                    self.mapView.setRegion(region, animated: true)
                    //標記位置
                }
                
                
                
            }
        })
        
        
        
    }

}
