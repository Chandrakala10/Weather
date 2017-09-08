//
//  ServiceEroor.swift
//  Weather
//
//  Created by Chandrakala Neerukonda on 9/8/17.
//  Copyright © 2017 Chandrakala Neerukonda. All rights reserved.
//

import Foundation

/// Some generic error messages that can be used when parsing payloads.
public enum ServiceError: Error {
    
    /// Data returned is not as expected.
    case badData
    
    /// When a successful response is returned which contains an error message or identifier. This occassionally happens in some poorly designed endpoints.
    case failedMessage(message: String, code: Int?)
    
    /// A fatal unexpected and unknown error occurred.
    case generalError(message: String?)
    
    /// The payload is not in the dictionary or array format expected.
    case invalidJSON
    
    /// Insufficient permissions.
    case invalidAPIKey
    
    /// Unknown error.
    case unknownError
}
