//
//  CacheManager.swift
//  youtube_channel_App
//
//  Created by Mian Usama on 06/05/2021.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?) {
        
        // Store the image data and use the url as key
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        // Try to get the data for the specified Url
        return cache[url]
    }
}
