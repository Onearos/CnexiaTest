//
//  CarsTableViewItem.swift
//  Cnexia
//
//  Created by Macbook PRO on 21/09/2022.
//

import Foundation

protocol CarsTableViewItem {
    func accept<Visitor: CarsTableViewItemVisitor>(visitor: Visitor, additionalInfo: Visitor.AdditionalInfo) -> Visitor.Result
}

extension CarTableViewCellViewModel: CarsTableViewItem {
    func accept<Visitor>(visitor: Visitor, additionalInfo: Visitor.AdditionalInfo) -> Visitor.Result where Visitor : CarsTableViewItemVisitor {
        return visitor.visit(car: self, additionalInfo: additionalInfo)
    }
}

protocol CarsTableViewItemVisitor {
    associatedtype Result
    associatedtype AdditionalInfo
    
    func visit(car: CarTableViewCellViewModel, additionalInfo: AdditionalInfo) -> Result
    func visit(expanded: ExpandedCarTableViewCellViewModel, additionalInfo: AdditionalInfo) -> Result
    func visit(separator: CarTableViewSeparatorViewModel, additionalInfo: AdditionalInfo) -> Result
}
