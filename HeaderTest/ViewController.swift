//
//  ViewController.swift
//  HeaderTest
//
//  Created by Sean Lintern on 09/05/2017.
//  Copyright © 2017 HeaderTest. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let maxHeight: CGFloat = 250.0
    let minHeight: CGFloat = 50.0
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint! {
        didSet {
            heightConstraint.constant = maxHeight
        }
    }
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.contentInset = UIEdgeInsets(top: maxHeight, left: 0, bottom: 0, right: 0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.contentView.backgroundColor = rowColor(indexPathRow: indexPath.row)
        return cell
    }

    func rowColor(indexPathRow: Int) -> UIColor {
        let mod = indexPathRow % 4
        
        switch mod {
        case 0:
            return .orange
            
        case 1:
            return .purple
            
        case 2:
            return .red
            
        case 3:
            return .green
        default:
            return .brown
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        if scrollView.contentOffset.y < 0 {
            heightConstraint.constant = max(fabs(scrollView.contentOffset.y), minHeight)
        } else {
            heightConstraint.constant = minHeight
        }
    }
}

