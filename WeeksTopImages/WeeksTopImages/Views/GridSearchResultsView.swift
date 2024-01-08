//
//  GridSearchResultsView.swift
//  WeeksTopImages
//
//  Created by shiva kumar on 8/1/24.
//

import SwiftUI

struct GridSearchResultsView: View {
    var results: [ImageModel] = []
    var isListMode: Bool
    
    var body: some View {
        ScrollView {
            if results.count == 0 {
                Text("No Images to display. Enter a search text")
                    .padding()
                    .font(.title3)
                    .opacity(0.6)
            }else {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 16) {
                    ForEach(results, id: \.id) { imagemodel in
                        ImageCell(result: imagemodel, isListMode: isListMode)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

