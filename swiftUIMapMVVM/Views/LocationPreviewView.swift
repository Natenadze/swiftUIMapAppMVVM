//
//  LocationPreviewView.swift
//  swiftUIMapMVVM
//
//  Created by Davit Natenadze on 12.12.23.
//

import SwiftUI

struct LocationPreviewView: View {
    
    // MARK: - properties
    @EnvironmentObject private var viewModel: LocationsViewModel
    let location: Location
    
    
    // MARK: - body
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 8) {
                learnMoreButton
                
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 70)
        )
        .clipShape(.rect(cornerRadius: 8))
    }
    
}


// MARK: - extension imageSection
extension LocationPreviewView {
    
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(.rect(cornerRadius: 10))
            }
        }
        .padding(6)
        .background(.white)
        .clipShape(.rect(cornerRadius: 10))
    }
}

// MARK: - extension titleSection
extension LocationPreviewView {
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension LocationPreviewView {
    
    private var learnMoreButton: some View {
        Button {
            print("learn more")
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 126, height: 36)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button {
            viewModel.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 126, height: 36)
        }
        .buttonStyle(.bordered)
    }
    
    
}

// MARK: - Preview
#Preview {
    ZStack {
        Color.green
            .ignoresSafeArea()
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .padding()
    }
    .environmentObject(LocationsViewModel())
}
