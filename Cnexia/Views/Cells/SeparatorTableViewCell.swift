//
//  SeparatorTableViewCell.swift
//  Cnexia
//
//  Created by Macbook PRO on 21/09/2022.
//

import UIKit

struct CarTableViewSeparatorViewModel: CarsTableViewItem {
    func accept<Visitor>(visitor: Visitor, additionalInfo: Visitor.AdditionalInfo) -> Visitor.Result where Visitor : CarsTableViewItemVisitor {
        return visitor.visit(separator: self, additionalInfo: additionalInfo)
    }
}

final class SeparatorTableViewCell: UITableViewCell {

    @IBOutlet weak var separatorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
