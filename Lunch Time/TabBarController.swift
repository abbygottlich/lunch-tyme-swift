//
//  TabBarController.swift
//  Lunch Time
//
//  Created by Abby Gottlich on 4/29/20.
//  Copyright © 2020 Abby Gottlich. All rights reserved.
//

import UIKit
import Foundation

class TabBarController: UITabBarController {
    
    var tappedRestaurant: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("selected restaurant", tappedRestaurant[0])
    }
}
