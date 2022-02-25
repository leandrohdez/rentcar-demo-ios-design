//
//  StartView.swift
//  RentCar
//
//  Created by Leandro Hernandez on 17/2/22.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        ZStack {
            Color.ui.black.edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0, content: {
                        Text("Premium")
                            .foregroundColor(Color.ui.white)
                            .font(.system(size: 48))
                            .bold()
                            .frame(maxWidth: 220)
                        Text("car rental")
                            .foregroundColor(Color.ui.white)
                            .font(.system(size: 48))
                            .bold()
                            .frame(maxWidth: 220)
                        Text("Rent the car of your deams with home delivery")
                            .foregroundColor(Color.ui.gray01)
                            .frame(maxWidth: 220)
                            .padding([.horizontal], 8)
                        Spacer()
                    })
                    .padding([.horizontal], 16)
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                
                Image("580b585b2edbce24c47b2cca")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width*1.5)
                    .offset(x: UIScreen.main.bounds.width/3)
                
                Spacer()
                    .frame(height: 16)
                
                NavigationLink(destination: MainView()) {
                    Text("Continue")
                }
                .buttonStyle(MainButtonStyle())
                
                Spacer()
                    .frame(height: 24)
            }
        }
    }
}
