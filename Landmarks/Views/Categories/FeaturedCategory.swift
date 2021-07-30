//
//  FeaturedCategory.swift
//  Landmarks
//
//  Created by Evgeniy on 29.07.2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import SwiftUI

struct FeaturedCategory: View {
    @State private var switchTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    let featured: [Landmark]
    @State private var index = 0
    @State private var isFlipped = false
    
    var body: some View {
        ZStack {
            if isFlipped {
                featured[index].image
                    .resizable()
                    .transition(.slide)
            } else {
                featured[index].image
                    .resizable()
                    .transition(.slide)
            }
            NavigationLink(
                destination: LandmarkDetail(landmark: featured[index])
                    .onAppear(perform: {
                        switchTimer.upstream.connect().cancel()
                    })
                    .onDisappear(perform: {
                        switchTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
                })) {
                EmptyView()
            }
            .hidden()
        }
        .scaledToFill()
        .frame(height: 200)
        .clipped()
        .listRowInsets(EdgeInsets())
        .transition(.scale)
        .onReceive(switchTimer, perform: { _ in
            withAnimation(.easeInOut(duration: 1)) {
                switchImage()
            }
        })
    }
    
    private func switchImage() {
        if index + 1 >= featured.count {
            index = 0
        } else {
            index += 1
        }
        
        isFlipped = !isFlipped
    }
}

struct FeaturedCategory_Previews: PreviewProvider {
    static let featured = Model().featured
    
    static var previews: some View {
        FeaturedCategory(featured: featured)
    }
}
