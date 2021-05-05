//
//  Constants.swift
//  youtube_channel_App
//
//  Created by Mian Usama on 04/05/2021.
//

import Foundation

struct Constants {
    
    static var API_KEY  = ""
    static var PLAYLIST_ID = "PLWIcq9MPEPFNW4j1ou0JRWeWiaiyuj9J1"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
    static var VIDEOCELL_ID = "VideoCell"
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"

}
