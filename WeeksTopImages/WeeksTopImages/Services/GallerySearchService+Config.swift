//
//  GallerySearchService+Config.swift
//  WeeksTopImages
//
//  Created by shiva kumar on 7/1/24.
//

import Foundation

extension GallerySearchService {
    /// Loads the configuration from Config.plist and creates an instance of AppConfig.
    /// The config file contains secure info, which is stores safely in the local env and not commited to the git repo
    ///
    /// - Returns: An instance of AppConfig with the loaded configuration.
    static func loadConfig() -> AppConfig {
        guard let path = Bundle.main.path(forResource: ".appconfig", ofType: "plist"), let loadedConfig = NSDictionary(contentsOfFile: path) else {
            fatalError("Unable to load config.plist")
        }
        return AppConfig(config: loadedConfig)
    }
}
