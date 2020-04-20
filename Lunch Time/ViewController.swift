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
//    UICollectionViewDataSource is a protocol that includes both of the collectionView funcs below, so they must be included in this ViewController class extension since it conforms to that protocol

//    This func returns the size of the restaurants array
//    I'm not sure that it's actually needed for the functionality of the app, but it must be included since we are conforming to the UICollectionViewDataSource protocol
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }

//    This func is what creates each cell with the image, gradient, and text
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCell", for: indexPath) as! CollectionViewCell
        let url = URL(string: restaurants[indexPath.row].backgroundImageURL)
        Nuke.loadImage(with: url!, into: cell.restaurantImage)
        cell.restaurantName.text = restaurants[indexPath.row].name ?? ""
        cell.restaurantCategory.text = restaurants[indexPath.row].category ?? ""
        
        return cell
    }
    
//    This func sets the height for each cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = 180
        return CGSize(width: collectionView.bounds.size.width, height: CGFloat(height))
    }
    
//    This func removes the default margin spacing between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

