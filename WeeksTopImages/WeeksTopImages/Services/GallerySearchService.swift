//
//  ImageService.swift
//  WeeksTopImages
//
//  Created by shiva kumar on 5/1/24.
//

import Foundation

class GallerySearchService {
    static let shared = GallerySearchService()
    private let apiKey: String? = nil
    private let fileTypes = ["jpg", "png"]  // Add other file types as needed


    func searchImages(query: String, completion: @escaping ([ImageModel]?, Error?) -> Void) {
        guard let apiKey = GallerySearchService.loadConfig().value(for: "IMGUR_API_KEY") else {
            completion(nil,NSError(domain: "Cannot find the Imgur API Key(Client id)", code: 0, userInfo: nil) )
            return
        }

        let fileTypesString = fileTypes.joined(separator: ",")
        let url = URL(string: "https://api.imgur.com/3/gallery/search/?q=\(query)&time=week&q_type=\(fileTypesString)")
        guard let url = url else {
            completion(nil, NSError(domain: "Invalid url", code: 0, userInfo: nil))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("Client-ID \(apiKey)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, NSError(domain: "Data not recieved", code: 0, userInfo: nil))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(ImageSearchResponse.self, from: data)
                completion(result.data, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
