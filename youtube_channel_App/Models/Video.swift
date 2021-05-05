//
//  Video.swift
//  youtube_channel_App
//
//  Created by Mian Usama on 04/05/2021.
//

import Foundation

struct Video : Decodable {
    
     var videoId = ""
     var title = ""
     var description = ""
     var thumbnail = ""
     var published = Date()
    
    // making the enum case values through the json code of api with json object ids names
    enum CodingKeyes : String, CodingKey {
      
        case snippet
        case thumbnails
        case high
        case resourceId
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    // method to decode json code into swift
    init(from decoder: Decoder) throws {
        
        // Getting the data in a container from the json block to decode
        let container = try decoder.container(keyedBy: CodingKeyes.self)
        
        // Getting specific key value snippet from the above container of json to decode
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeyes.self, forKey: .snippet)
        
        // parse the title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // parse the description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // parse the published date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // Parse thumbnails
        let thumbnailsContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeyes.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailsContainer.nestedContainer(keyedBy: CodingKeyes.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // Parse resource id
        
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeyes.self, forKey: .resourceId)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
    
}
