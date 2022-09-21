//
//  CarTableViewCell.swift
//  Cnexia
//
//  Created by Macbook PRO on 21/09/2022.
//

import UIKit

struct CarTableViewCellViewModel {
    var image: UIImage?
    var title: LabelViewModel
    var subtitle: LabelViewModel
    var rate: Int
    var index: Int
}

final class CarTableViewCell: UITableViewCell {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var rateStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        rateStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        imageView?.image = nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        rateStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        imageView?.image = nil
        
    }
    
    func setup(viewModel: CarTableViewCellViewModel) {
        self.imageV.image = viewModel.image
        self.titleLabel.setup(viewModel: viewModel.title)
        self.subtitleLabel.setup(viewModel: viewModel.subtitle)
        buildRateStars(rate: viewModel.rate)
    }
}

private extension CarTableViewCell {
    func buildRateStars(rate: Int) {
        rateStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let stars: [UIImageView] = (0..<rate).compactMap { _ in
            let image = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
            let imageView = UIImageView()
            imageView.tintColor = .customOrange
            imageView.image = image
            return imageView
        }
        var subViews: [UIView] = stars
        subViews.append(UIView())
        
        subViews.forEach(rateStackView.addArrangedSubview(_:))
    }
}
