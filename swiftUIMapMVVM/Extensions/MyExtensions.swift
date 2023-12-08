//
//  MyExtensions.swift
//  swiftUIMapMVVM
//
//  Created by Davit Natenadze on 07.12.23.
//

import Foundation
import MapKit

extension CLLocationCoordinate2D {
    
    
    static var natenaHouse: CLLocationCoordinate2D {
        .init(latitude: 41.83750018936247, longitude: 43.379091275500244)
    }
    static let buckinghamPalace = CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)
    static let towerOfLondon = CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076)
    static let britishMuseum = CLLocationCoordinate2D(latitude: 51.519511583739, longitude: -0.12701060663059)
    static var rome = CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)
    
    
}

extension MKCoordinateSpan {
    static let close = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    static let medium = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    static let large = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
}
