//
//  Image_Remote.swift
//  RentCar
//
//  Created by Leandro Hernandez on 17/2/22.
//

import SwiftUI

extension Image {
    
    public func remote(url: URL) -> Self {
        if let data = try? Data(contentsOf: url){
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self.resizable()
    }
}
