//
//  ProfileViewController.swift
//  SearchSample
//
//  Created by Abhishek K on 20/02/18.
//  Copyright © 2018 Abhishek K. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilepic: UIImageView!
    @IBOutlet var labels: [UILabel]!
    var userViewViewModel:UserViewViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfile()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setProfile(){
        if userViewViewModel?.nameText != ""{
        labels[0].text = userViewViewModel?.nameText
        }else{
             labels[0].text = "No Name"
        }
        if userViewViewModel?.created_atText != ""{
        labels[1].text = userViewViewModel?.created_atText
        }else{
            labels[1].text = "NA"
        }
        if  userViewViewModel?.locationText != ""{
        labels[2].text = userViewViewModel?.locationText
        }else{
            labels[2].text = "No Location"
        }
        
        labels[3].text = String(describing: userViewViewModel!.friends_countText!)
        labels[4].text = String(describing: userViewViewModel?.followingText ?? "0")
        do{
        profilepic.image = UIImage.init(data: try Data(contentsOf: URL(string:(userViewViewModel?.profile_image_url_httpsText)!)!))
        }catch{
            print("No Profile ")
        }
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
