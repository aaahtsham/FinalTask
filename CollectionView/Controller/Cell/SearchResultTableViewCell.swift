//
//  SearchResultTableViewCell.swift
//  CollectionView
//
//  Created by Rana on 04/08/2019.
//  Copyright © 2019 Rana. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {


    @IBOutlet weak var sourceName: UILabel!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
