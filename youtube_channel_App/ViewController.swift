//
//  ViewController.swift
//  youtube_channel_App
//
//  Created by Mian Usama on 02/05/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getVideos()
        
    }

}

