//
//  NoDataExistCell.swift
//  Technical Assessment
//
//  Created by TAHA SALLAM on 12/20/20.
//

import UIKit

class NoDataExistCell: UITableViewCell {

    @IBOutlet weak var title_: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        title_.text = String.Localization.NoDataExist
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
