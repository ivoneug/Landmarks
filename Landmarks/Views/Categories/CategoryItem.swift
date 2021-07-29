//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Evgeniy on 25.07.2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var landmarks = Model().landmarks
    
    static var previews: some View {
        CategoryItem(landmark: landmarks[0])
    }
}
