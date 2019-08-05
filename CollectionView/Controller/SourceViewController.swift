//
//  SourceViewController.swift
//  CollectionView
//
//  Created by Rana on 05/08/2019.
//  Copyright © 2019 Rana. All rights reserved.
//

import UIKit

class SourceViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{

    var allSources = ["Ary", "Express", "Duniya" ,"92-HD"]
    var sourceURLStr: String =  "https://abcnews.go.com/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SourceCell", for: indexPath) as! SourceTableViewCell
        
        cell.name.text = allSources[indexPath.row]
        cell.category.text = allSources[indexPath.row]
        cell.country.text = allSources[indexPath.row]
        cell.language.text = allSources[indexPath.row]
        
        return cell
    }
    
    // MARK: - SWIPE FUNCTIONS
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let openURL = openURLAction (at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [openURL])
    }
    
    func openURLAction(at indexPath: IndexPath) -> UIContextualAction {
        
       
        let action = UIContextualAction(style: .normal , title: "Open", handler: {(action, view, completion) in
            //-------
            print(self.allSources[indexPath.row])
            
            UIApplication.shared.open( URL(string: self.sourceURLStr)!, options: [:] , completionHandler: nil)
            
            completion(true)
        })
        action.backgroundColor = .gray
        action.title = "Open"
        return action
    }
}

