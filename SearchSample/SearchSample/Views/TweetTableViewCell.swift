//
//  TweetTableViewCell.swift
//  SearchSample
//
//  Created by Abhishek K on 20/02/18.
//  Copyright © 2018 Abhishek K. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    @IBOutlet weak var createdAtText: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setUp(vm:TweetsViewViewModel){
        
        tweetText.text = vm.tweetText
        createdAtText.text = vm.createdAtText
   }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
