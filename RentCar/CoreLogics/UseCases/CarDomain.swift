//
//  CarDomain.swift
//  RentCar by Leandro Hernandez
//
//  Created by Leandro Hernandez on 10/2/22.
//

import Foundation

class CarDomain {
    
    static let UseCases = CarDomain()
 
    //
    func all(completion: @escaping (_ result: CarsCaseResult) -> Void) {
        let useCase = CarsUseCase()
        useCase.endHandle = { (resultCase) in
            if let result = resultCase as? CarsCaseResult {
                completion(result)
            }
        }
        useCase.execute()
    }
    
}
