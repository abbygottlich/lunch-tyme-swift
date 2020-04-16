//
//  DataFetcher.swift
//  Lunch Time
//
//  Created by Abby Gottlich on 4/15/20.
//  Copyright © 2020 Abby Gottlich. All rights reserved.
//

import Foundation

//This Restaurant struct is sort of like creating a model in JS
//It's saying "This is what the data should look like"
//It conforms to the Codable protocol which turns the JSON into a Swift struct
//Adding the question marks at the end of a type makes them optional
struct Restaurant: Codable {
    var name: String?
    var backgroundImageURL: String?
    var category: String?
    var contact: ContactInfo?
    var location: RestaurantLocation?
    struct RestaurantLocation: Codable {
        var address: String?
        var crossStreet: String?
        var lat: Double?
        var lng: Double?
        var postalCode: String?
        var cc: String?
        var country: String?
        var formattedAddress: [String]?
        var city: String?
    }
    struct ContactInfo: Codable {
        var phone: String?
        var formattedPhone: String?
        var twitter: String?
        var facebook: String?
        var facebookUsername: String?
        var facebookName: String?
    }
}

//The response sends back an object containing an array of Restaurants
//In order to reach that nested data, we have to create this struct that sets your response (restaurants) equal to an array of Restaurants ([Restaurant])
//To solve this, we created a new struct to anticipate that our restaurants are nested
struct RestaurantResult: Codable {
    let restaurants: [Restaurant]
}

struct DataFetcher {
//    Here, your function takes in a closure (labeled "completion") that takes in an array of Restaurants and returns void
//    The @escaping keyword allows the closure to escape, meaning it is called after the function returns
    func fetchRestaurants(completion: @escaping ([Restaurant]) -> Void) {
//        We're using a guard statement to require that a condition must be true in order for the code after the guard statement to be executed
//        Guard statements always have an else that will run if the condition is not true
//        This statement is saying "Don't let anymore code run after this unless this URL is true, otherwise return (or exit the function)"
        guard let url = URL(string: "https://s3.amazonaws.com/br-codingexams/restaurants.json") else {return}
//        This line of code is setting up a session
        let session = URLSession(configuration: .default)
//        This line of code is equivalent to a fetch call in JS
        let task = session.dataTask(with: url) { (data, response, err) in
//            This line of code creates a variable called "data" that is set equal to the data from the fetch
            guard let data = data else {return}
//            This line of code creates a variable called "restaurantResponse" that will try to decode the data to turn it into a Swift struct
            guard let restaurantResponse = try?
//                The decode method is taking in an instance the RestaurantResult struct as an "outline" for the data
                JSONDecoder().decode(RestaurantResult.self, from: data) else {
                return
            }
//            Remember, completion is the closure you included as a parameter at the beginning of this function
//            It takes in an array of Restaurants, so in this case, when calling the completion closure, you are passing restaurantResponse.restaurants as your parameter
//            restaurantResponse is the decoded JSON response and it includes and array of restaurants that are referenced using ".restaurants"
            completion(restaurantResponse.restaurants)
        }
//        This line of code calls the actual fetch call function
        task.resume()
    }
}
