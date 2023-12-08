//
//  LocationsListView.swift
//  swiftUIMapMVVM
//
//  Created by Davit Natenadze on 08.12.23.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    // MARK: - Body
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                
                Button(action: {
                    viewModel.showNextLocation(location: location)
                }, label: {
                    listRowView(location: location)
                })
                .padding(.vertical, 5)
                .listRowBackground(Color.clear)
                
            }
        }
        .listStyle(.plain)
    }
}

// MARK: - Extension
extension LocationsListView {
    
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
}


// MARK: - Preview
#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}
