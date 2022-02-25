//
//  Car.swift
//  RentCar
//
//  Created by Leandro Hernandez on 15/2/22.
//

import Foundation

class Car: Equatable, Identifiable {
    
    let id: String
    
    let brand: CarBrand
    
    let model: String
    
    var pictureUrl: URL?
    
    var price: String?
    
    var year: String?
    
    //
    init(id: String, brand: CarBrand, model: String) {
        self.id = id
        self.brand = brand
        self.model = model
    }
    
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.id.lowercased() == rhs.id.lowercased()
    }
    
}
