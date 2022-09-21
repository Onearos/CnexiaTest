//
//  NavigationBar.swift
//  Cnexia
//
//  Created by Macbook PRO on 21/09/2022.
//

import UIKit

final class NavigationBar: UIView, CustomView {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var rigthIconImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXIB()
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadXIB()
        setup()
    }
    
    func setup() {
        let image = UIImage(named: "menuIcon")?.withRenderingMode(.alwaysTemplate)
        self.rigthIconImage.image = image
        self.rigthIconImage.tintColor = .white
    }
}
