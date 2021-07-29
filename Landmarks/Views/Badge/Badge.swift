//
//  Badge.swift
//  Landmarks
//
//  Created by Evgeniy on 21.07.2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import SwiftUI

struct Badge: View {
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                renderBadgeSymbols()
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2, y: 3.0 / 4.0 * geometry.size.height)
            }
        }
        .scaledToFit()
    }
    
    private func renderBadgeSymbols() -> some View {
        ForEach(0..<rotationCount) { idx in
            RotatedBadgeSymbol(angle: .degrees(Double(idx)) / Double(rotationCount) * 365.0)
        }
            .opacity(0.5)
    }
    
    let rotationCount = 8
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
