//
//  CustomView.swift
//  Cnexia
//
//  Created by Macbook PRO on 21/09/2022.
//

import UIKit

protocol CustomView {
    static var identifier: String { get }
}

extension CustomView where Self: UIView {
    static var identifier: String {
        return String(describing: self)
    }
    
    func loadXIB() {
        let bundle = Bundle(for: type(of: self))
        guard let view = bundle.loadNibNamed(Self.identifier, owner: self, options: nil)?.first as? UIView else {
            return
        }
        
        addSubview(view)
        view.frame = bounds
    }
}


