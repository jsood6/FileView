//
//  FilesTableViewCell.swift
//  FileView
//
//  Created by Jigyasaa Sood on 12/18/20.
//

import UIKit

class FilesTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var filenameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    var file: File! {
            didSet {
                filenameLabel.text = file.filename
                descriptionLabel.text = file.description
                dateLabel.text = file.createdDate
               
            }
        }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
