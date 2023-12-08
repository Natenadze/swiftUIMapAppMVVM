//
//  Chris.swift
//  swiftUIMapMVVM
//
//  Created by Davit Natenadze on 07.12.23.
//

import SwiftUI
import MapKit

struct Chris: View {
    
    @State private var cameraPosition: MapCameraPosition = .automatic
    
    var body: some View {
        Map(position: $cameraPosition) {
            Marker("Tower of London", systemImage: "house", coordinate: .towerOfLondon)
            Marker("Palace",  monogram: Text("ASE"), coordinate: .buckinghamPalace)
                .tint(.blue)
            Annotation("BritMuseum", coordinate: .britishMuseum) {
                ZStack {
                    Rectangle()
                        .frame(width: 34, height: 34)
                        .foregroundStyle(.cyan)
                    Circle()
                        .fill(.red)
                        .frame(width: 12, height: 12)
                }
                
            }
            
        }
//        .mapStyle(.imagery)
        .safeAreaInset(edge: .bottom) {
            HStack {
                Spacer()
                Button("Show NH") {
                    cameraPosition = .region(MKCoordinateRegion(center: .natenaHouse, span: .close))
                }
                Spacer()
            }
            .padding(.top)
            .background(.thinMaterial)
        }
        
    }
}

#Preview {
    Chris()
}
