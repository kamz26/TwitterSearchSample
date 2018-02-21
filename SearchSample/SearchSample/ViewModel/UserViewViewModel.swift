//
//  UserViewViewModel.swift
//  SearchSample
//
//  Created by Abhishek K on 20/02/18.
//  Copyright © 2018 Abhishek K. All rights reserved.
//

import Foundation
import UIKit

protocol PresentDeatil {
    func showData(view:UIView)
}

class  UserViewViewModel :PresentDeatil{
    var user:User?
    var nameText:String?{
        guard let name = user?.name else{
            return "No Name"
        }
        return name
    }
    var created_atText:String?{
        guard let createdAt = user?.created_at else{
            return "NA"
        }
        return createdAt
    }
    var locationText:String?{
        guard let location = user?.location else{
            return "No Location"
        }
        
        return location
    }
    var profile_image_url_httpsText:String?{
        guard let profile_pic = user?.profile_image_url_https else{
            return "https://assets1.cdn-mw.com/mw/images/article/art-wap-landing-mp-lg/egg-3442-4c317615ec1fd800728672f2c168aca5@1x.jpg"
        }
        return profile_pic
        
    }
    var friends_countText:Int?{
        guard let count = user?.friends_count else{
            return 0
        }
        return count
    }
    var followingText:String?{
        guard let followers = user?.following else{
            return "0"
        }
        return " \(followers)"
    }
    
    
    init(user:User) {
        self.user = user
        
    }
    func showData(view:UIView){
        
       var view1 = view as! ProfileDetailView
        
        view1.presentView(vm:self)
        
    }
    
    
    
}
