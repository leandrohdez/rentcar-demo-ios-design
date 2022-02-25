//
//  MainView.swift
//  RentCar by Leandro Hernandez
//
//  Created by Leandro Hernandez on 10/2/22.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel: MainViewModel
    
    @State private var showingSheet = false
    
    @State private var selectedCar: Car?
    
    @State private var filteredBrand: CarBrand?
    
    init(viewModel: MainViewModel = .init()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Color.ui.silver.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 0, content: {
                HStack {
                    Text("Choose")
                        .bold()
                        .font(.system(size: 29))
                        .foregroundColor(Color.ui.black)
                    Text("a Car")
                        .font(.system(size: 29))
                        .foregroundColor(Color.ui.black)
                }
                .padding([.horizontal], 16)
                .padding([.vertical], 24)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 16, content: {
                        VStack(alignment: .leading, spacing: 8, content: {
                            Text("Brands")
                                .bold()
                                .font(.system(size: 19))
                                .foregroundColor(Color.ui.black)
                                .padding([.horizontal], 16)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(alignment: .center, spacing: 16, content: {
                                    BrandItemView(title: "All", backgroundColor: Color.ui.gray00, selected: (self.filteredBrand == nil)) {
                                        self.filteredBrand = nil
                                    }
                                        
                                    BrandItemView(image: "tesla", selected: (self.filteredBrand == .tesla)) {
                                        self.filteredBrand = .tesla
                                    }
                                        
                                    BrandItemView(image: "audi", selected: (self.filteredBrand == .audi)) {
                                        self.filteredBrand = .audi
                                    }
                                       
                                    BrandItemView(image: "mitsubishi", selected: (self.filteredBrand == .mitsubishi)) {
                                        self.filteredBrand = .mitsubishi
                                    }
                                      
                                    BrandItemView(image: "mercedes", selected: (self.filteredBrand == .mercedes)) {
                                        self.filteredBrand = .mercedes
                                    }
                                       
                                    BrandItemView(image: "porsche", selected: (self.filteredBrand == .porsche)) {
                                        self.filteredBrand = .porsche
                                    }
                                       
                                    BrandItemView(image: "bmw", selected: (self.filteredBrand == .bmw)) {
                                        self.filteredBrand = .bmw
                                    }
                                       
                                })
                                .padding([.horizontal], 16)
                                .frame(height: 80)
                            }
                        })
                        VStack(alignment: .leading, spacing: 0, content: {
                            if self.filteredCars().count > 0 {
                                Text("Available cars")
                                    .bold()
                                    .font(.system(size: 19))
                                    .foregroundColor(Color.ui.black)
                                    .padding([.horizontal], 16)
                            }
                            ForEach(self.filteredCars()) { car in
                                CarItemView(
                                    imageURL: car.pictureUrl,
                                    modelDescription: car.model,
                                    year: car.year ?? "",
                                    price: car.price ?? "",
                                    action: {
                                        if let car = self.viewModel.cars.first(where: { $0.id == car.id }) {
                                            self.selectedCar = car
                                            self.showingSheet.toggle()
                                        }
                                    }
                                )
                            }
                        })
                    })
                }
                .onAppear {
                    self.viewModel.loadCars()
                }
            })
        }
//        .sheet(isPresented: self.$showingSheet, content: {
//            if let car = self.selectedCar {
//                CarView(car: car)
//            }
//        })
        .navigationBarHidden(true)
    }
}

extension MainView {
    
    //
    private func filteredCars() -> [Car] {
        guard let filteredBrand = self.filteredBrand else { return self.viewModel.cars }
        return self.viewModel.cars.filter { car in
            car.brand == filteredBrand
        }
    }
    
}
