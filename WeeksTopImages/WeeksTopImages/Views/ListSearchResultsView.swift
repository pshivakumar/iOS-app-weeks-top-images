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
            NoImagePlaceHolderView()
        }else {
            List(results, id: \.id ) { imagemodel in
                ImageCell(result: imagemodel, isListMode: isListMode)
            }.listStyle(.plain)
        }
    }
}

#Preview {
    ListSearchResultsView(isListMode: true)
}
