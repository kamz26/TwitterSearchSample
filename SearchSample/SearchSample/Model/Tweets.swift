//
//  Tweets.swift
//  SearchSample
//
//  Created by Abhishek K on 19/02/18.
//  Copyright © 2018 Abhishek K. All rights reserved.
//

import Foundation
class Tweets{
    var created_at:String
    var text:String
    var user:User
    
    init(created:String,text:String,user:User) {
        created_at = created
        self.text = text
        self.user = user
        
    }
}
