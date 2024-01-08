//
//  NoImagePlaceHolderView.swift
//  WeeksTopImages
//
//  Created by shiva kumar on 8/1/24.
//

import SwiftUI

/// A reusable view component to display a placehoder info if no images are found during search
///
struct NoImagePlaceHolderView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "nosign")
                .font(.largeTitle)
                .opacity(0.6)
                .padding(.bottom, 10)
            
            Text("No Images to display. Enter a search text")
                .padding(.leading, 5)
                .padding(.trailing, 5)
                .font(.title3)
                .opacity(0.6)

            Spacer()
        }
    }
}

#Preview {
    NoImagePlaceHolderView()
}
