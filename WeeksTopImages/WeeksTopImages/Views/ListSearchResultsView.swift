//
//  ListSearchResultsView.swift
//  WeeksTopImages
//
//  Created by shiva kumar on 8/1/24.
//

import SwiftUI

struct ListSearchResultsView: View {
    var results: [ImageModel] = []
    var isListMode: Bool
    
    var body: some View {
        if results.count == 0 {
            Text("No Images to display. Enter a search text")
                .padding()
                .font(.title3)
                .opacity(0.6)
        }else {
            List(results, id: \.id ) { imagemodel in
                ImageCell(result: imagemodel, isListMode: isListMode)
            }

        }
    }
}

#Preview {
    ListSearchResultsView(isListMode: true)
}