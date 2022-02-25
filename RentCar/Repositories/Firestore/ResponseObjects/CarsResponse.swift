//
//  CarsResponse.swift
//  RentCar
//
//  Created by Leandro Hernandez on 17/2/22.
//

import Foundation

extension FirestoreService {
    
    //
    struct CarResponse {
        var id: String
        var brand: String
        var model: String
        var picture: String
        var price: String
        var year: String
        
        init(id: String, data: [String: Any]) {
            self.id = id
            self.brand = data["brand"] as? String ?? ""
            self.model = data["model"] as? String ?? ""
            self.picture = data["picture"] as? String ?? ""
            self.price = data["price"] as? String ?? ""
            self.year = data["year"] as? String ?? ""
        }
    }
    
    //
    struct CarsResponse {
        var cars: [CarResponse]
    }
    
}
