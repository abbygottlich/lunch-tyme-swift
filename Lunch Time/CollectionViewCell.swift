//
//  CollectionViewCell.swift
//  Lunch Time
//
//  Created by Abby Gottlich on 4/15/20.
//  Copyright © 2020 Abby Gottlich. All rights reserved.
//

import UIKit

//1. delegate method
protocol MyCellDelegate: AnyObject {
    func RestaurantBtnTapped(cell: CollectionViewCell)
}

class CollectionViewCell: UICollectionViewCell {
    
    //2. create delegate variable
    weak var delegate: MyCellDelegate?
    
    //3. action assigned to restaurant button
    @IBAction func RestaurantBtnTapped(_ sender: Any) {
        //4. calling the delegate method
        //checking that delegate is not nil with `?`
        delegate?.RestaurantBtnTapped(cell: self)
    }
    
    @IBOutlet weak var restaurantButton: UIButton!
    
    @IBOutlet weak var restaurantName: UILabel!

    @IBOutlet weak var restaurantImage: UIImageView!
    
    @IBOutlet weak var restaurantCategory: UILabel!
    
    @IBOutlet weak var gradientImage: UIImageView!
}
