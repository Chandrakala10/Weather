//
//  JSON.swift
//  Weather
//
//  Created by Chandrakala Neerukonda on 9/8/17.
//  Copyright © 2017 Chandrakala Neerukonda. All rights reserved.
//

import Foundation

/// JSON dictionary.
public typealias JSON = [String: AnyObject]

/// JSON object.
public typealias JSONObject = JSON

/// JSON array.
public typealias JSONArray = [JSONObject]

/// JSON error.
public enum JSONError: Error {
    
    /// JSON key is missing.
    case missingKey(key: String, json: JSON)
    
    /// The value with given key exists, but conversion to expected type failed.
    case invalidValue(key: String, json: JSON)
    
    /// Failed to parse data.
    case parsingError(String)
    
    /// Returns `JSONError` for a combination of `key` and `json`.
    ///
    /// - parameter key: JSON key to check.
    /// - parameter json: JSON dictionary to use for validation.
    /// - returns: `.missingValue` if `json` doesn't contain a value with the `key` key. `.invalidValue` otherwise.
    public static func error(forKey key: String, json: JSON) -> JSONError {
        // If value is `nil`, then it's missing key error, otherwise it's invalid value
        guard json[key] != nil else { return .missingKey(key: key, json: json) }
        return .invalidValue(key: key, json: json)
    }
}

