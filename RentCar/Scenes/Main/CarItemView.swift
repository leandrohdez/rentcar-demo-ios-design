//
//  CarItemView.swift
//  RentCar
//
//  Created by Leandro Hernandez on 15/2/22.
//

import SwiftUI

extension MainView {
    
    struct CarItemView: View {
    
        var imageURL: URL?
        
        var modelDescription: String
        
        var year: String
        
        var price: String
        
        var action: (() -> Void)?
        
        var body: some View {
            ZStack {
                
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(16)
                        .shadow(color: Color.gray.opacity(0.1), radius: 5)
                    
                    VStack {
                        HStack {
                            Spacer()
                            VStack(alignment: .trailing, spacing: 0, content: {
                                Text(self.modelDescription)
                                    .bold()
                                    .frame(height: 24)
                                    .foregroundColor(Color.ui.black)
                                    .font(.system(size: 19))
                                    
                                Text(self.year)
                                    .bold()
                                    .frame(height: 20)
                                    .foregroundColor(Color.ui.gray01)
                                    .font(.system(size: 15))
                            })
                        }
                        .padding([.trailing], 16)
                        .padding([.top], 12)
                        Spacer()
                        HStack {
                            if !self.price.isEmpty {
                                HStack(alignment: .center, spacing: 0, content: {
                                    Text(self.price)
                                        .foregroundColor(Color.ui.black)
                                        .bold()
                                        .font(.system(size: 16))
                                    Text("/day")
                                        .foregroundColor(Color.ui.gray01)
                                        .bold()
                                        .font(.system(size: 16))
                                })
                                .padding([.horizontal], 16)
                            }
                            Spacer()
                            Button {
                                self.action?()
                            } label: {
                                Text("Details")
                            }
                            .frame(width: 200, height: 48)
                            .foregroundColor(Color.ui.white)
                            .background(RoundedCorners(tl: 16, tr: 0, bl: 0, br: 16).fill(Color.ui.blue))
                        }
                    }
                    
                }
                .padding(EdgeInsets(top: 32, leading: 16, bottom: 8, trailing: 16))
                
                VStack {
                    HStack {
                        if let imageURL = self.imageURL {
                            Image("")
                                .remote(url: imageURL)
                                .frame(width: 160.0, height: 80.0)
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .padding([.vertical], 8)
                .padding([.horizontal], 24)

            }
            .padding(EdgeInsets())
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 160,
                maxHeight: 160,
                alignment: .leading
            )
            .listRowInsets(EdgeInsets())
            .background(
                Rectangle().fill(Color.ui.silver)
            )
        }
    }
}
