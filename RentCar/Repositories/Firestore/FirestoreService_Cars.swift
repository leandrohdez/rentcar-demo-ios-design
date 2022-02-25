//
//  FirestoreService_Cars.swift
//  RentCar
//
//  Created by Leandro Hernandez on 17/2/22.
//

import Foundation
import Firebase
import FirebaseFirestore

extension FirestoreService {
    
    //
    open func cars(completion: @escaping (_ responseData: FirestoreService.CarsResponse?, _ error: Error?) -> Void) {
        
        self.db.collection("cars").getDocuments { querySnapshot, error in
            
            if let documents = querySnapshot?.documents  {
                
                let result: [CarResponse] = documents.map { queryDocumentSnapshot -> CarResponse in
                    return CarResponse(id: queryDocumentSnapshot.documentID, data: queryDocumentSnapshot.data())
                }
                
                completion(CarsResponse(cars: result), nil)
                
            } else {
                completion(nil, error)
            }
        }
    }
    
}
