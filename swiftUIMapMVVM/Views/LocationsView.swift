//
//  LocationsView.swift
//  swiftUIMapMVVM
//
//  Created by Davit Natenadze on 07.12.23.
//

import SwiftUI
import MapKit


struct LocationsView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    
    // MARK: - Body
    var body: some View {
            
        ZStack {
            Map(position: $viewModel.mapRegion)
            
            VStack {
                header
                    .padding()
                
                Spacer()
            }
        }
    }
    
}

// MARK: - Extension
extension LocationsView {
    
    private var header: some View {
        
        VStack(spacing: 0) {
            
            Button(action: {
                viewModel.toggleLocationsList()
            }, label: {
                Text(viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: viewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .padding()
                            .rotationEffect(
                                Angle(degrees: viewModel.showLocationList ? 180 : 0)
                            )
                    }
            })
            
            
            if viewModel.showLocationList {
                LocationsListView()
            }
            
           
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .gray, radius: 10, x: 0.0, y: 15)
        
    }
        
}



// MARK: - Preview
#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

