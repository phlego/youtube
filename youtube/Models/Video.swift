//
//  Video.swift
//  youtube
//
//  Created by Lewis Le on 19/11/2017.
//  Copyright © 2017 Lewis Le. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
    
}

class Channel: NSObject {
    
    var name: String?
    var profileImageName: String?
    
}
