//
//  CarsUseCase.swift
//  RentCar by Leandro Hernandez
//
//  Created by Leandro Hernandez on 10/2/22.
//

import Foundation

enum CarsCaseResult {
    case success(cars: [Car])
    case unknownError
}

class CarsUseCase: BaseUseCase {
    
    override init() {
        
    }
    
    override func execute() {
        super.execute()
        self.getAllCars()
    }
    
}

extension CarsUseCase {
    
    //
    private func getAllCars() {
        
        FirestoreService.shared.cars { response, error in
            
            if error == nil, let responseData = response {
                
                var resultCars: [Car] = []
                
                for item in responseData.cars {
                    
                    if let carbrand = CarBrand(string: item.brand) {
                        
                        let car = Car(id: item.id, brand: carbrand, model: item.model)
                        car.year = item.year
                        car.price = item.price
                        car.pictureUrl = URL(string: item.picture)
                        resultCars.append(car)
                    }
                }
                
                self.finish(caseResult: CarsCaseResult.success(cars: resultCars))
                
            } else {
                self.finish(caseResult: CarsCaseResult.unknownError)
            }
        }
    }
    
}
