//
//  TableViewCellFetch.swift
//  CoredataDemo
//
//  Created by Arpit Dhameliya on 3/1/24.
//

import UIKit

class TableViewCellFetch: UITableViewCell {
    @IBOutlet var txtNumber: UILabel!
    @IBOutlet weak var txtName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
