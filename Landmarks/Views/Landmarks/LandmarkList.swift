//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Evgeniy on 21.07.2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var model: Model
    @State private var showFavorites: Bool = false
    
    var filteredLandmarks: [Landmark] {
        return model.landmarks.filter { landmark in
            showFavorites ? landmark.isFavorite : true
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavorites) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 12", "iPhone SE (2nd generation)"], id: \.self) { deviceName in
            LandmarkList()
                .environmentObject(Model())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
