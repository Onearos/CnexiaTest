//
//  CarsTableViewCellFactory.swift
//  Cnexia
//
//  Created by Macbook PRO on 21/09/2022.
//

import UIKit

final class CarsTableViewCellFactory: CarsTableViewItemVisitor {
    weak var tableView: UITableView?
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func build(item: CarsTableViewItem, indexPath: IndexPath) -> UITableViewCell {
        return item.accept(visitor: self, additionalInfo: indexPath)
    }
    
    func visit(car: CarTableViewCellViewModel, additionalInfo: IndexPath) -> UITableViewCell {
        guard let cell = tableView?.dequeueReusableCell(withIdentifier: "CarTableViewCell", for: additionalInfo) as? CarTableViewCell else {
            return .init()
        }
        
        cell.setup(viewModel: car)
        
        return cell
    }
    
    func visit(expanded: ExpandedCarTableViewCellViewModel, additionalInfo: IndexPath) -> UITableViewCell {
        guard let cell = tableView?.dequeueReusableCell(withIdentifier: "ExpandedCarTableViewCell", for: additionalInfo) as? ExpandedCarTableViewCell else {
            return .init()
        }
        
        cell.setup(viewModel: expanded)
        
        return cell
    }
    
    func visit(separator: CarTableViewSeparatorViewModel, additionalInfo: IndexPath) -> UITableViewCell {
        guard let cell = tableView?.dequeueReusableCell(withIdentifier: "SeparatorTableViewCell", for: additionalInfo) as? SeparatorTableViewCell else {
            return .init()
        }
        
        return cell
    }
}
