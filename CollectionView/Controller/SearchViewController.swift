//
//  SearchViewController.swift
//  CollectionView
//
//  Created by Rana on 04/08/2019.
//  Copyright © 2019 Rana. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
  
    
    var myTitles: [String] = ["one1", "two2","one3", "two4","one5", "two6","one7", "two8", "two2","one3", "two4","one5", "two6","one7", "two8", "two2","one3", "two4","one5", "two6","one7", "two8"]
    
    var imageStr: String =  "https://static01.nyt.com/images/2019/08/02/us/politics/02dc-trade/02dc-trade-facebookJumbo.jpg"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath) as! SearchResultTableViewCell
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.layer.shadowOpacity = 0.23
        cell.layer.shadowRadius = 4
        
        
        //download image
        if let imageURL = URL(string: imageStr) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.myImage.image = image
                        
                        cell.myImage.layer.cornerRadius = 15
                        cell.myImage.clipsToBounds = true
                        cell.layer.shadowOpacity = 0.25
                        cell.layer.shadowRadius = 5
                    }
                }
            }
        }
        cell.title.text = self.myTitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let animationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, -500, 0)
        
        cell.layer.transform = animationTransform
        cell.alpha = 0
        
        UIView.animate(withDuration: 1.0){
            cell.layer.transform =  CATransform3DIdentity
            cell.alpha = 1
        }
        
    }
    
    
}
