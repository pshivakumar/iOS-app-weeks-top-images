//
//  SearchBar.swift
//  WeeksTopImages
//
//  Created by shiva kumar on 7/1/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text:String
    var onSearchButtonClicked: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search the Gallery", text: $text)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            Button("", systemImage: "magnifyingglass") {
                // Button Action
                onSearchButtonClicked()
            }
            .font(.title)

        } //: HSTACK
    }
}

