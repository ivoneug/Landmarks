//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Evgeniy on 25.07.2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top) {
                        ForEach(items) { landmark in
                            NavigationLink(
                                destination: LandmarkDetail(landmark: landmark)) {
                                CategoryItem(landmark: landmark)
                            }
                        }
                    }
                    .frame(height: 185)
                }
                .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = Model().landmarks
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(3))
        )
    }
}
