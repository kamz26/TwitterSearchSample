//
//  ParentViewViewModel.swift
//  SearchSample
//
//  Created by Abhishek K on 20/02/18.
//  Copyright © 2018 Abhishek K. All rights reserved.
//

import Foundation
import UIKit




struct ParentViewViewModel{
    var parentModel:ParentModel
    var tweetViewModel:[TweetsViewViewModel] = [TweetsViewViewModel]()
    var userViewModelArray = [UserViewViewModel]()
    
  
    
}
extension ParentViewViewModel{
    
    init(map:[String:Any]) {
        var metadata:MetaData?
        var statusesData = [Tweets]()
        if let searchData = map["search_metadata"] as? [String:Any]{
            metadata = MetaData(count: searchData["count"] as! Int, query: searchData["query"] as! String)
        }
        
        if let statuses = map["statuses"] as? Array<Dictionary<String,Any>>{
            
            for status in statuses{
                
                let createdAt = status["created_at"] as! String
                let text = status["text"] as! String
                var userExt:User?
                if let user = status["user"] as? [String:Any]{
                    let user = User(name: user["name"]! as! String, created_at: user["created_at"]! as! String, location: user["location"]! as! String, profile_image: user["profile_image_url_https"]! as! String, friends: user["friends_count"]! as! Int, following: user["following"]! as? String )
                    
                    userExt = user
                }
                userViewModelArray.append(UserViewViewModel(user: userExt!))
                let tweet = Tweets(created: createdAt, text: text, user: userExt!)
                tweetViewModel.append(TweetsViewViewModel(tweet: tweet))
                statusesData.append(tweet)
                
                
                
            }
            
        }
            
        parentModel = ParentModel(searchData: metadata!,statuses:statusesData)
    }
}
