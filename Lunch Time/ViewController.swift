//
//  ViewController.swift
//  Lunch Time
//
//  Created by Abby Gottlich on 4/13/20.
//  Copyright © 2020 Abby Gottlich. All rights reserved.
//

import UIKit
import Foundation
import Nuke

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
//    This line of code is creating a variable that is equal to an empty array of type Restaurant Array
    var restaurants: [Restaurant] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
//        Calling the fetchRestaurants function written below
        fetchRestaurants()
    }
    
    func fetchRestaurants() {
//        This line of code is creating a variable called "rest" and setting it equal to the DataFetcher struct
        let rest = DataFetcher()
//        fetchRestaurants is a method included in the DataFetcher struct and is being called in this line of code using dot notation
        rest.fetchRestaurants{ (resp) in
//            This method takes in a response and then sets self.restaurants (the empty array at the beginning of this class) equal to that response
            DispatchQueue.main.async {
                self.restaurants = resp
                self.collectionView.reloadData()
                
//            print(self.restaurants[0].name ?? "No restaurant available")
//                for restaurant in self.restaurants {
//                    print(restaurant.name ?? "Restaurant name not available")
//                }
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCell", for: indexPath) as! CollectionViewCell
        let url = URL(string: restaurants[indexPath.row].backgroundImageURL)
        
        let fileName = "cellGradientBackground@2x.png"
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/" + fileName
        let image = UIImage(contentsOfFile: path)
        Nuke.loadImage(with: url!, into: cell.restaurantImage)
        cell.restaurantName.text = restaurants[indexPath.row].name ?? ""
//        cell.restaurantCategory.text = restaurants[indexPath.row].category ?? ""
//        cell.gradientImage.image = image
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = 180
        return CGSize(width: collectionView.bounds.size.width, height: CGFloat(height))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

