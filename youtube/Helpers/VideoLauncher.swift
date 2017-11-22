//
//  VideoLauncher.swift
//  youtube
//
//  Created by Lewis Le on 22/11/2017.
//  Copyright © 2017 Lewis Le. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class VideoPlayer: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        let urlString = "https://firebasestorage.googleapis.com/v0/b/youtapevideos.appspot.com/o/Taylor%20Swift%20-%20Blank%20Space.mp4?alt=media&token=1c5f062b-e1d1-43d5-8248-7082a508a2f1"
        //let urlString = "https://www.dropbox.com/s/4bybba28wiktcgc/Taylor%20Swift%20-%20Blank%20Space.mp4?dl=0"

        if let url = URL(string: urlString) {
            let player = AVPlayer(url: url)
            let playerLayer = AVPlayerLayer(layer: player)
            self.layer.addSublayer(playerLayer)
            playerLayer.frame = self.frame

            player.play()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class VideoLauncher: NSObject {
    
    func showVideoPlayer() {
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = .white
            view.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10)
            
            let height = keyWindow.frame.width * 9 / 16
            let videoPlayerFrame = CGRect(x: 0, y: 100, width: keyWindow.frame.width, height: height)
            let videoPlayer = VideoPlayer(frame: videoPlayerFrame)
            view.addSubview(videoPlayer)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view.frame = keyWindow.frame
            }, completion: { (finished) in
                UIApplication.shared.setStatusBarHidden(true, with: .fade)
            })
            
            keyWindow.addSubview(view)
        }
    }
    
}
