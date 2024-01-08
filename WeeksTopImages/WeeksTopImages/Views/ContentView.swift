//
//  ContentView.swift
//  WeeksTopImages
//
//  Created by shiva kumar on 5/1/24.
//

import SwiftUI
import URLImage
import URLImageStore

struct ContentView: View {
    @State private var searchText = ""
    @State private var isListMode =  true
    @StateObject  var viewModel = ImageViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, onSearchButtonClicked: {
                    viewModel.searchImageGallery(searchText: searchText)
                })
                .frame(height: 50)

                Divider()
                Spacer()
                
                if isListMode {
                    ListSearchResultsView(results: viewModel.result, isListMode: isListMode)
                }else {
                    GridSearchResultsView(results: viewModel.result, isListMode: isListMode)
                }
                
                Spacer()
                
            } //: VSTACK
            .navigationBarTitle("Image Gallery", displayMode: .inline)
            .navigationBarItems(trailing:
                Toggle(isOn: $isListMode, label: {
                if isListMode{
                    ZStack {
                         Rectangle()
                             .fill(Color.blue)
                             .frame(width: 30, height: 30)
                             .cornerRadius(5)
                         Image(systemName: "list.bullet.rectangle")
                             .foregroundColor(.white)
                     }
                }else {
                    ZStack {
                         Rectangle()
                             .fill(Color.blue)
                             .frame(width: 40, height: 40)
                             .cornerRadius(5)
                             .aspectRatio(contentMode: .fill)
                         Image(systemName: "square.grid.2x2")
                             .foregroundColor(.white)

                     }
                }
            }).padding(.horizontal)
            )
        } //: NAVIGATIONVIEW
    }
}

// Image View Model Class

class ImageViewModel: ObservableObject {
    @Published var result: [ImageModel] = []
    
    
    func searchImageGallery(searchText: String) {
        let gallerySearchService = GallerySearchService()
        
        gallerySearchService.searchImages(query: searchText) { images, error in
            if error != nil {
                return
            }
            guard let images = images else {
                return
            }
            DispatchQueue.main.async {
                self.result = images
            }
        }
    }
}


#Preview {
    ContentView()
}
