//
//  WeeksTopImagesApp.swift
//  WeeksTopImages
//
//  Created by shiva kumar on 5/1/24.
//

import SwiftUI
import URLImage
import URLImageStore

@main
struct WeeksTopImagesApp: App {
    var body: some Scene {
        let urlImageService = URLImageService(fileStore: nil, inMemoryStore: URLImageInMemoryStore())
        WindowGroup {
            ContentView()
                .environment(\.urlImageService, urlImageService)
        }
    }
}
