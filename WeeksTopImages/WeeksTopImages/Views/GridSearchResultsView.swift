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
        if results.count == 0 {
            NoImagePlaceHolderView()
        }else {
            ScrollView {
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

