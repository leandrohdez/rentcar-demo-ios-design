//
//  FirestoreService.swift
//  RentCar
//
//  Created by Leandro Hernandez on 17/2/22.
//

import Foundation
import Firebase

class FirestoreService {
    
    static let shared = FirestoreService()
    
    let db = Firestore.firestore()
    
}
