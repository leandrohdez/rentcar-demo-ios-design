//
//  BrandItemView.swift
//  RentCar
//
//  Created by Leandro Hernandez on 16/2/22.
//

import SwiftUI

extension MainView {
    
    struct BrandItemView: View {
        
        private var title: String
        
        private var image: String
        
        private var isSelected: Bool = false
        
        private var backgroundColor: Color = Color.ui.white
        
        var action: (() -> Void)?
        
        init(title: String, backgroundColor: Color = Color.ui.white, selected: Bool = false, action: (() -> Void)? = nil) {
            self.title = title
            self.image = ""
            self.backgroundColor = backgroundColor
            self.isSelected = selected
            self.action = action
        }
        
        init(image: String, backgroundColor: Color = Color.ui.white, selected: Bool = false, action: (() -> Void)? = nil) {
            self.title = ""
            self.image = image
            self.backgroundColor = backgroundColor
            self.isSelected = selected
            self.action = action
        }
        
        var body: some View {
            Button(action: {
                self.action?()
            }) {
                if self.image.isEmpty {
                    Text(self.title)
                        .bold()
                        .font(.system(size: 16))
                        .foregroundColor(self.isSelected ? Color.ui.white : Color.ui.black)
                } else {
                    Image(self.isSelected ? "\(self.image)_white" : "\(self.image)_black")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32, alignment: .center)
                }
            }
            .frame(width: 64, height: 64, alignment: .center)
            .background(self.isSelected ? Color.ui.blue : self.backgroundColor)
            .foregroundColor(Color.ui.black)
            .cornerRadius(16)
            .shadow(color: Color.gray.opacity(0.2), radius: 5)
        }
        
    }
    
}
