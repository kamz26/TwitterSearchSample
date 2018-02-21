//
//  ProfileDetailView.swift
//  SearchSample
//
//  Created by Abhishek K on 21/02/18.
//  Copyright © 2018 Abhishek K. All rights reserved.
//

import UIKit

class ProfileDetailView: UIView {
    
    @IBOutlet weak var profilepic: UIImageView!
    @IBOutlet var labels: [UILabel]!

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func presentView(vm:UserViewViewModel){
        
        if vm.nameText != ""{
            labels[0].text = vm.nameText
        }else{
            labels[0].text = "No Name"
        }
        if vm.created_atText != ""{
            labels[1].text = vm.created_atText
        }else{
            labels[1].text = "NA"
        }
        if  vm.locationText != ""{
            labels[2].text = vm.locationText
        }else{
            labels[2].text = "No Location"
        }
        
        labels[3].text = String(describing: vm.friends_countText!)
        labels[4].text = String(describing: vm.followingText ?? "0")
        do{
            profilepic.image = UIImage.init(data: try Data(contentsOf: URL(string:(vm.profile_image_url_httpsText)!)!))
        }catch{
            print("No Profile ")
        }
        
        
    }

}
