//
//  LocationsViewModel.swift
//  swiftUIMapMVVM
//
//  Created by Davit Natenadze on 07.12.23.
//

import SwiftUI
import MapKit

class LocationsViewModel: ObservableObject {
    
    // MARK: - Properties
    // All loaded location
    @Published var locations: [Location]
    // Current location on map
    @Published var mapLocation: Location {
        didSet { updateMapRegion(location: mapLocation) }
    }
    @Published var mapRegion: MapCameraPosition = .automatic
    
    @Published var showLocationList = false
    
    // MARK: - Init
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.last!
        updateMapRegion(location: locations.last!)
    }
    
    // MARK: - Methods
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = .region(MKCoordinateRegion(
                center: location.coordinates,
                span: .medium)
            )
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
  
    func nextButtonPressed() {
        guard let currentIndex = locations.firstIndex(of: mapLocation) else { return }
        let nextIndex = (currentIndex + 1) % locations.count
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }

}
