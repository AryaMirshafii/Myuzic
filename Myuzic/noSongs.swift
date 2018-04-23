//
//  noSongs.swift
//  Myuzic
//
//  Created by Arya Mirshafii on 4/22/18.
//  Copyright © 2018 aryaMirshafii. All rights reserved.
//

import Foundation
import  UIKit
import MediaPlayer

class noSongs: UIViewController {
    var player = MPMusicPlayerController.applicationMusicPlayer
    var mediaItems:[MPMediaItem]!
    
    override func viewDidLoad() {
        if(!(MPMediaQuery.albums().items?.isEmpty)!) {
             dismiss(animated: true, completion: nil)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        if(!MPMediaQuery.albums().items!.isEmpty) {
            dismiss(animated: true, completion: nil)
        }
    }
    
}
