//
//  musicLogin.swift
//  Myuzic
//
//  Created by Arya Mirshafii on 5/19/18.
//  Copyright © 2018 aryaMirshafii. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class musicLogin:UIViewController{
    private var player = MPMusicPlayerController.applicationMusicPlayer
    private var mediaItems = [MPMediaItem]()
    
    override func viewDidLoad() {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                
                
                self.startPlaying()
                DispatchQueue.main.async {
                    
                    self.performSegue(withIdentifier: "goToLocation", sender: nil)
                    
                }
                
                
                print("Music Libaray is Authorized")
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(MPMediaLibrary.authorizationStatus() == .authorized){
            self.dismiss(animated: false, completion: nil)
        
        }
    }
    private func startPlaying(){
        
        
        player.skipToNextItem()
        player.play()
        player.pause()
        
    }
    
       
}
