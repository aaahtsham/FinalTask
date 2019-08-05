//
//  ViewController.swift
//  CollectionView
//
//  Created by Rana on 04/08/2019.
//  Copyright © 2019 Rana. All rights reserved.
//

import UIKit

class MostRecentViewController: UIViewController , UICollectionViewDelegate ,UICollectionViewDataSource {
    
    @IBOutlet weak var HeadlineCV: UICollectionView!   
    @IBOutlet weak var MostRecentCV: UICollectionView!
    
    
    var myTitles: [String] = ["one1", "two2","one3", "two4","one5", "two6","one7", "two8"]
    
    var imageStr: String =  "https://static01.nyt.com/images/2019/08/02/us/politics/02dc-trade/02dc-trade-facebookJumbo.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return myTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.HeadlineCV {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeadlineCell", for: indexPath) as! HeadlineCollectionViewCell
            
            cell.layer.cornerRadius = 8
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
                            cell.imageView.image = image
                        }
                    }
                }
            }
            cell.title.text = self.myTitles[indexPath.row]
            return cell
        }
        else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MostRecentCell", for: indexPath) as! MostRecentCollectionViewCell
            
            cell.layer.cornerRadius = 8
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
                            cell.imageView.image = image
                        }
                    }
                }
            }
            cell.title.text = self.myTitles[indexPath.row]
            return cell
        }
    }
}

