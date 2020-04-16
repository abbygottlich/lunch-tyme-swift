//
//  ViewController.swift
//  Lunch Time
//
//  Created by Abby Gottlich on 4/13/20.
//  Copyright © 2020 Abby Gottlich. All rights reserved.
//

import UIKit
import Foundation

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
                print(resp)
                
//            print(self.restaurants[0].name ?? "No restaurant available")
//                for restaurant in self.restaurants {
//                    print(restaurant.name ?? "Restaurant name not available")
//                }
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print("Restaurants", restaurants)
        return restaurants.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCell", for: indexPath) as! CollectionViewCell
//        cell.restaurantImageView.image = UIImage(imageLiteralResourceName: restaurants[indexPath.row].backgroundImageURL ?? "")
        cell.restaurantName.text = restaurants[indexPath.row].name
        return cell
    }
}

