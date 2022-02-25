//
//  MainViewModel.swift
//  RentCar
//
//  Created by Leandro Hernandez on 15/2/22.
//

import Foundation
import SwiftUI

extension MainView {
    
    class MainViewModel: ObservableObject {
        
        @Published var brands: [CarBrand]
        
        @Published var cars: [Car]

        init() {
            self.cars = []
            self.brands = []
        }
        
        //
        func loadCars() {
            
            self.cars = []
            
            CarDomain.UseCases.all { result in
                
                switch result {
                    
                case .success(let cars):
                    self.cars = cars
                    
                case .unknownError:
                    print("Error")
                }
            }
        }
    }
    
}
