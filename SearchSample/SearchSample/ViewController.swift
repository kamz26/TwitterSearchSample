//
//  ViewController.swift
//  SearchSampleq
//
//  Created by Abhishek K on 19/02/18.
//  Copyright © 2018 Abhishek K. All rights reserved.
//

import UIKit
import Alamofire


class Authorization:Codable{
    var token_type:String
    var access_token:String
    
}

class ViewController: UIViewController {
    
    var aurthorize:Authorization?
    var parentViewViewModel:ParentViewViewModel?
    
    @IBOutlet weak var tweetTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
     let session = URLSession.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let param = "grant_type=client_credentials"
        
        let url = "https://api.twitter.com/oauth2/token"
       var request = URLRequest(url: URL(string: url)!) as URLRequest
        request.addValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue("Basic V2F1MkpwanF5ZG5ZVlpLTjJPaDRVYlJENzpOTjE5clVUUHM0eUpiV2t0TmNCbDZkbkJkbWFvUWo0bXhZaGZ5NzJYNld0aFJabm8yQQ==", forHTTPHeaderField: "Authorization")
       
        request.httpMethod = "POST"
        request.httpBody = param.data(using: .utf8)
        
        
       
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            do{
                self.aurthorize = try JSONDecoder().decode(Authorization.self, from: data!)
               
            }catch{
                print("err!!!")
            }
            
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pass"{
            let destination = segue.destination as! ProfileViewController
            destination.userViewViewModel = sender as! UserViewViewModel
        }
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if parentViewViewModel != nil{
            return (parentViewViewModel?.parentModel.statuses.count)!
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        if parentViewViewModel != nil{
            return (parentViewViewModel?.tweetViewModel[indexPath.row].cellInstance(tableView,indexPath:indexPath))!
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(parentViewViewModel?.userViewModelArray[indexPath.row].nameText)
        
        let userModelViewModel = parentViewViewModel?.userViewModelArray[indexPath.row]
        self.performSegue(withIdentifier: "pass", sender: userModelViewModel!)
        
    }
    
    
}
extension ViewController:UISearchBarDelegate{
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        guard !searchText.isEmpty else {
            parentViewViewModel = nil
            tweetTableView.reloadData()
            return
        }
        var  request = URLRequest(url: URL(string:"https://api.twitter.com/1.1/search/tweets.json?q=%23\(searchText)&since_id=&max_id=&result_type=mixed&count=10")!)
        request.addValue("Bearer \(aurthorize!.access_token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary<String,Any>
                self.parentViewViewModel = ParentViewViewModel(map:json)
                
                DispatchQueue.main.async {
                    self.tweetTableView.reloadData()
                }
               
            }catch{
                print("err!!")
            }
        }
        task.resume()
    }
    
    
    
    
}
class Dummy:Codable{
    var search_metadata:String?
    var statuses:String?
    
}



