//
//  Model.swift
//  youtube_channel_App
//
//  Created by Mian Usama on 04/05/2021.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        guard url !=  nil else {
            return
        }
        
        // Get URLSession Object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { data, response, error in
        
            // check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            do {
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                // here the in the below line the Response is the class name we made and data is the parameter of the above dataTask constant
               let response = try  decoder.decode(Response.self, from: data!)
                
                dump(response)
            }
            catch {
                
            }
            
        }
        
        // Kick off the task
        dataTask.resume()
    }
}
