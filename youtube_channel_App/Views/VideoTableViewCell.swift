//
//  VideoTableViewCell.swift
//  youtube_channel_App
//
//  Created by Mian Usama on 05/05/2021.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        
        self.video = v
        
        // Ensure that we have a video
        guard self.video != nil else {
            return
        }
        
        // Set the title
        self.titleLabel.text = video?.title
        
        // Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video?.thumbnail != nil else {
            return
        }
        
        // Check cache befor downloading the data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail){
            
            // Set the thumbnail image
            self.thumbnailImageView.image = UIImage(data: cachedData)
            
            return
        }
        
        // Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        //Get the shared URL session object
        let session = URLSession.shared
        
        // Create a task
        let dataTask = session.dataTask(with: url!) { data, Response, error in
            
            if error == nil && data != nil {
                
             // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
            // Check the download URL matches the Video thumbnail URL
            if url?.absoluteString != self.video?.thumbnail {
                    
            // The video has been recycled and no longer matches the thumbnail that was downloaded
               return
            }
                
             //Create the image object
                
             let image = UIImage(data: data!)
                
             //Set the imageView
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
        
            
            }
       
        }
        
        // Start the data Task
        dataTask.resume()
        
    }

}
