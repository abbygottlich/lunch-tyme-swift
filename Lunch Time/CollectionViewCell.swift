//
//  CollectionViewCell.swift
//  Lunch Time
//
//  Created by Abby Gottlich on 4/15/20.
//  Copyright © 2020 Abby Gottlich. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var restaurantButton: UIButton!
    
    @IBOutlet weak var restaurantName: UILabel!

    @IBOutlet weak var restaurantImage: UIImageView!
    
    @IBOutlet weak var restaurantCategory: UILabel!
    
    @IBOutlet weak var gradientImage: UIImageView!
}
