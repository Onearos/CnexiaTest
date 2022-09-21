//
//  ExpandedCarTableViewCell.swift
//  Cnexia
//
//  Created by Macbook PRO on 21/09/2022.
//

import UIKit

struct ExpandedCarTableViewCellViewModel: CarsTableViewItem {
    var prosTitle: LabelViewModel
    var pros: [LabelViewModel]
    var consTitle: LabelViewModel
    var cons: [LabelViewModel]
    
    func accept<Visitor>(visitor: Visitor, additionalInfo: Visitor.AdditionalInfo) -> Visitor.Result where Visitor : CarsTableViewItemVisitor {
        return visitor.visit(expanded: self, additionalInfo: additionalInfo)
    }
}

final class ExpandedCarTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionStack: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        descriptionStack.subviews.forEach { view in
            view.removeFromSuperview()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        descriptionStack.subviews.forEach { view in
            view.removeFromSuperview()
        }
        
    }
    
    func setup(viewModel: ExpandedCarTableViewCellViewModel) {
        descriptionStack.subviews.forEach { view in
            view.removeFromSuperview()
        }
        
        add(titleVM: viewModel.prosTitle, list: viewModel.pros)
        add(titleVM: viewModel.consTitle, list: viewModel.cons)
    }
}

private extension ExpandedCarTableViewCell {
    func add(titleVM: LabelViewModel, list: [LabelViewModel]) {
        if !list.isEmpty {
            let title = UILabel()
            title.setup(viewModel: titleVM)
            
            let points: [UILabel] = list.compactMap { vm in
                let point = UILabel()
                let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.firstLineHeadIndent = 10.0
                
                
                var bulletAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customOrange,
                                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)]
                bulletAttributes[.paragraphStyle] = paragraphStyle
                let firstString = NSMutableAttributedString(string: "•\t", attributes: bulletAttributes)
                
                firstString.append(NSAttributedString(string: vm.text, attributes: attributes))
                point.attributedText = firstString
                return point
            }
            
            descriptionStack.addArrangedSubview(title)
            points.forEach(descriptionStack.addArrangedSubview(_:))
        }
    }
}
