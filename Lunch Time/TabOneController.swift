//
//  TabOneController.swift
//  Lunch Time
//
//  Created by Abby Gottlich on 4/27/20.
//  Copyright © 2020 Abby Gottlich. All rights reserved.
//

import UIKit
import Foundation
import Nuke
import MapKit

class TabOneController: UIViewController {
    
    @IBOutlet weak var outerStackView: UIStackView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var innerStackView: UIStackView!
    @IBOutlet weak var detailHeader: UIView!
    @IBOutlet weak var detailInfo: UIView!
    @IBOutlet weak var detailRestaurantName: UILabel!
    @IBOutlet weak var detailRestaurantCategory: UILabel!
    @IBOutlet weak var streetNumber: UILabel!
    @IBOutlet weak var cityState: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var twitterHandle: UILabel!
    
    var tappedRestaurant: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailRestaurantName.text = tappedRestaurant[0].name
        detailRestaurantCategory.text = tappedRestaurant[0].category
        streetNumber.text = tappedRestaurant[0].location?.address
        cityState.text = tappedRestaurant[0].location?.formattedAddress?[1]
        
        phoneNumber.text = (tappedRestaurant[0].contact?.formattedPhone != nil) ? tappedRestaurant[0].contact?.formattedPhone : ("Phone number not available")
        
        twitterHandle.text = (tappedRestaurant[0].contact?.twitter != nil) ? "@\(tappedRestaurant[0].contact?.twitter ?? "")" : ("")
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: (tappedRestaurant[0].location?.lat)!, longitude: (tappedRestaurant[0].location?.lng)!)
        mapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
        
        print("selected restaurant", tappedRestaurant[0])
    }
}
