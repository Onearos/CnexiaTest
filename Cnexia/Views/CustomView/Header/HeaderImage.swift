//
//  HeaderImage.swift
//  Cnexia
//
//  Created by Macbook PRO on 21/09/2022.
//

import UIKit

final class HeaderImage: UIView, CustomView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXIB()
        imageView.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadXIB()
        imageView.contentMode = .scaleAspectFill
    }
}
