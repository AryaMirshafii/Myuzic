//
//  playlistTable.swift
//  FoodTracker
//
//  Created by arya mirshafii on 7/22/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class playlistTable: UITableViewController, UINavigationBarDelegate {
    
    
    var songArr:[MPMediaItem]!
    
    var songList = [MPMediaItem]()
    

    var songTitle: String?
    var artistTitle: String?
    var albumName: String?
    var albumArt: UIImage?
    var dummyString: String?
    
    
    let datamanager = dataManager()
    
    var aView: UIView!
    let player = MPMusicPlayerController.applicationMusicPlayer
    var playlistImage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let aframe = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 220)
        aView = UIView(frame: aframe)
        
        self.navigationItem.leftBarButtonItem?.tintColor = .white
        self.tableView.tableHeaderView = aView
        let imageView = UIImageView(image: playlistImage)
        imageView.frame = CGRect(x: self.aView.frame.width/2 - 85, y: self.aView.frame.height/2 - 85, width: 170, height: 170)
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true
        aView.addSubview(imageView)
        tableView.delegate = self
        tableView.dataSource = self
        let backgroundImage = UIImageView(image: #imageLiteral(resourceName: "BabyBlueAmbiantUpsideDOwn"))
        self.tableView.backgroundView = backgroundImage
        self.tableView.rowHeight = 82
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func goBack(_ sender: AnyObject) {
      
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "returnTo" {
            let navController = segue.destination as! playlistTableView
        }
        
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return songArr.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            let cellIdentifier = "tablePlayerCell"
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? tablePlayerCell  else {
                fatalError("The dequeued cell is not an instance of tablePlayerCell.")
                
            }
            //print("INDEX is 0")
            return cell
        }
       
        let cellIdentifier = "playlistCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? playlistCell  else {
            fatalError("The dequeued cell is not an instance of playlistCell.")
        }
        let aSong = songArr?[indexPath.row]
        songList.append(aSong!)
        /**
        cell.albumArt.image = aSong?.albumArt
        cell.albumArtist.text = aSong?.albumArtistName
        cell.songName.text = aSong?.songName
        */
        
        
        if(aSong?.artist?.isEmpty)!{
            cell.albumArtist.text = " "
        } else {
            cell.albumArtist.text = aSong?.artist
        }
        //checks if albumart is empty
        if(aSong?.artwork == nil){
            //cell.albumArt.image = UIImage(named: "no")
            cell.albumArt = UIImageView(image: #imageLiteral(resourceName: "noArtworkFound"))
        } else {
            
            print("indexpath is " + String(indexPath.row))
            cell.albumArt.image = aSong?.artwork?.image(at: CGSize(width: 200, height: 200))
        }
        
        cell.songName.text = aSong?.title
        
        
        
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("You selected cell number: \(indexPath.row)!")
        
        tableView.deselectRow(at: indexPath, animated: true)
        let aSong = songArr?[indexPath.row]
        let mediaCollection = MPMediaItemCollection(items: [aSong!])
        player.setQueue(with: mediaCollection)
        player.play()
        
        
    }
    
    @IBAction func playAllButtonPressed(_ sender: Any) {
        let mediaCollection = MPMediaItemCollection(items: songArr)
        player.setQueue(with: mediaCollection)
        player.play()
    }
    
    
    @IBAction func shuffleButtonPressed(_ sender: Any) {
        player.shuffleMode  = .songs
    }
    
    
    
    
}
