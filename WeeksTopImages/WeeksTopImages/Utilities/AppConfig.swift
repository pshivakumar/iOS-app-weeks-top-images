//
//  AppConfig.swift
//  WeeksTopImages
//
//  Created by shiva kumar on 7/1/24.
//

import Foundation

/// A utility for managing App Configuration. Follow Dependency Injection pattern
class AppConfig {
    private var config: NSDictionary?
    
    /// Initializes an instance of `AppConfig` with a provided configuration dictionary.
    ///
    /// - Parameter config: A dictionary containing application configuration values.
    init(config: NSDictionary? = nil) {
        self.config = config
    }
    
    /// Retrieves the value associated with a specific configuration key.
    ///
    /// - Parameter key: The configuration key for which to retrieve the value.
    /// - Returns: The value associated with the key, or `nil` if the key is not found.
    func value(for key: String) -> String? {
        return config?[key] as? String
    }

}
