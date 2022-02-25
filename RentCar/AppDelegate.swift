//
//  AppDelegate.swift
//  RentCar by Leandro Hernandez
//
//  Created by Leandro Hernandez on 10/2/22.
//

import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    
    //
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
}
