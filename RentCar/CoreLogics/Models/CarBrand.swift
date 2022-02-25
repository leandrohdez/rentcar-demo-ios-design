//
//  CarBrand.swift
//  RentCar
//
//  Created by Leandro Hernandez on 15/2/22.
//

import Foundation

enum CarBrand: String {
    case tesla          = "tesla"
    case audi           = "audi"
    case mitsubishi     = "mitsubishi"
    case mercedes       = "mercedes"
    case porsche        = "porsche"
    case bmw            = "bmw"
    
    init?(string: String) {
        switch string.lowercased() {
        case CarBrand.tesla.rawValue.lowercased():          self = .tesla
        case CarBrand.audi.rawValue.lowercased():           self = .audi
        case CarBrand.mitsubishi.rawValue.lowercased():     self = .mitsubishi
        case CarBrand.mercedes.rawValue.lowercased():       self = .mercedes
        case CarBrand.porsche.rawValue.lowercased():        self = .porsche
        case CarBrand.bmw.rawValue.lowercased():            self = .bmw
        default:
            return nil
        }
    }
}
