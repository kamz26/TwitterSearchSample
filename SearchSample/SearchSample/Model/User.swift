//
//  User.swift
//  SearchSample
//
//  Created by Abhishek K on 19/02/18.
//  Copyright © 2018 Abhishek K. All rights reserved.
//

import Foundation
struct  User {
    var name:String
    var created_at:String
    var location:String
    var profile_image_url_https:String
    var friends_count:Int
    var following:String?
    
    init(name:String,created_at:String,location:String,profile_image:String,friends:Int,following:String?=nil) {
        self.name = name
        self.created_at = created_at
        self.location = location
        self.profile_image_url_https = profile_image
        self.friends_count = friends
        self.following = following
    }
  
}
