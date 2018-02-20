//
//  TweetsViewViewModel.swift
//  SearchSample
//
//  Created by Abhishek K on 20/02/18.
//  Copyright © 2018 Abhishek K. All rights reserved.
//

import Foundation
import UIKit

protocol CellRepresent {
    func cellInstance(_ tableView:UITableView, indexPath:IndexPath) -> UITableViewCell
}

class TweetsViewViewModel:CellRepresent{
    
    var tweet:Tweets?
    var createdAtText :String{
        guard let createAt = tweet?.created_at else{ return "" }
        return "Created At: \(createAt)"
    }
    var tweetText :String{
        guard  let text = tweet?.text  else {
            return ""
        }
        return text
    }
    init(tweet:Tweets) {
        self.tweet = tweet
    }
    
    
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TweetTableViewCell
        
        cell.setUp(vm:self)
        
        return cell
    }
    
}
