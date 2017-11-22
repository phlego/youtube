//
//  Video.swift
//  youtube
//
//  Created by Lewis Le on 19/11/2017.
//  Copyright © 2017 Lewis Le. All rights reserved.
//

import UIKit

class SafeJsonObject: NSObject {
    override func setValue(_ value: Any?, forKey key: String) {
        if self.responds(to: NSSelectorFromString(key)) {
            super.setValue(value, forKey: key)
        }
    }
    
    init(_ dictionary: [String: Any]) {
        super.init()
        setValuesForKeys(dictionary)
    }
}

class Video: SafeJsonObject {
    
    @objc var thumbnail_image_name: String?
    @objc var title: String?
    @objc var number_of_views: NSNumber?
    @objc var uploadDate: NSDate?
    @objc var duration: NSNumber?
    
    @objc var channel: Channel?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "channel" {
            self.channel = Channel(value as! [String: Any])
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    init(dictionary: [String: Any]) {
        super.init(dictionary)
        setValuesForKeys(dictionary)
    }
}

class Channel: SafeJsonObject {
    @objc var name: String?
    @objc var profile_image_name: String?
}
