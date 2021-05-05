//
//  ViewController.swift
//  youtube_channel_App
//
//  Created by Mian Usama on 02/05/2021.
//

import UIKit

class ViewController:
    UIViewController,UITableViewDataSource,UITableViewDelegate,ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]() 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        model.delegate = self
        
        model.getVideos()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Confirm that a video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        //Get a reference to the Video that was tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        //Get a reference to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        //Set the video property of the detail view controller
        detailVC.video = selectedVideo
    }
    
    // MARK: - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        
        // Set the returned videos to our videos propety
        self.videos = videos
        
        // Refresh the tableView
        tableView.reloadData()
    }
     
    
    // MARK: - Tableview methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // Configure the cell with data
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
    }

}

