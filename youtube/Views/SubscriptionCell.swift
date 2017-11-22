//
//  SubscriptionCell.swift
//  youtube
//
//  Created by Lewis Le on 22/11/2017.
//  Copyright © 2017 Lewis Le. All rights reserved.
//

import UIKit

class SubscriptionCell: FeedCell {
    
    override func fetchVideos() {
        ApiService.instance.fetchSubscriptionFeed { (videos: [Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
    
}
