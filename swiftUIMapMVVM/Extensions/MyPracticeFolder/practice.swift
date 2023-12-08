//
//  practice.swift
//  swiftUIMapMVVM
//
//  Created by Davit Natenadze on 07.12.23.
//

import SwiftUI
import MapKit

struct Location1 {
//    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct Location2: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct Practice: View {
    
    @State private var initialLocation: MapCameraPosition = .region(MKCoordinateRegion(
        center: .natenaHouse, span: .medium))
     
    
    
    @State private var locations = [
        Location2(id: UUID(), name: "test1", description: "Asdasd", latitude: 7.123, longitude: 4.123)
//        Location(name: "Buckingham Palace", coordinate: .buckinghamPalace),
//        Location(name: "Tower of London", coordinate: .towerOfLondon)
    ]
    
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Map(position: $initialLocation) {
                    ForEach(locations) { place in
                        Annotation(place.name, coordinate: place.coordinate) {
                            NavigationLink {
                                Text(place.name)
                            } label: {
                                Circle()
                                    .stroke(.red, lineWidth: 3)
                                    .frame(width: 44, height: 44)
                            }
                            
                        }
                    }
                }
                
                .mapControls {
                    MapPitchToggle()
                    MapUserLocationButton()
                }
                
                
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
                
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            print("--- lat is: ",  initialLocation.region?.center.latitude ?? 11)
                            CLLocationManager().requestLocation()
                            // create a new location
//                            let newLocation = Location2(id: UUID(), name: "New location", description: "",
//                                                        latitude: region.center.latitude,
//                                                        longitude: region.center.longitude)
//                            locations.append(newLocation)
                        } label: {
                            Image(systemName: "plus")
                        }
                        .padding()
                        .background(.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                    }
                }
            }
            
         
            
         
        } // ZStack
     
       
    } // body
    
}

#Preview {
    Practice()
}
