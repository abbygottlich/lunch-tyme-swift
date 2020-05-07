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
        
        print("selected restaurant", tappedRestaurant)
    }
}
