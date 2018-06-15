//
//  ViewController.swift
//  EzAutoResizingTableCell
//
//  Created by MacMiniCorei5-26Ghz on 6/15/18.
//  Copyright © 2018 GVN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customTable: UITableView!
    @IBOutlet weak var sizeSlider: UISlider!
    
    var cellList = [CustomTableViewCell]()
    override func viewDidLoad() {
        super.viewDidLoad()
        customTable.delegate = self
        customTable.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        customTable.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        customTable.rowHeight = UITableViewAutomaticDimension
        customTable.estimatedRowHeight = 100
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onValueChanged(_ sender: UISlider) {
        customTable.beginUpdates()
        for cell in cellList {
            cell.bodyLabel.font = UIFont.systemFont(ofSize: CGFloat(sender.value))
            cell.headerLabel.font = UIFont.systemFont(ofSize: CGFloat(sender.value))
        }
        customTable.endUpdates()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = customTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.headerLabel.text = "Angela K. Snyder"
        cell.bodyLabel.text = "Ap #198-1768 Metus. Rd."
        cell.headerLabel.lineBreakMode = .byWordWrapping
        cell.headerLabel.sizeToFit()
        cell.headerLabel.layoutIfNeeded()
        cell.bodyLabel.lineBreakMode = .byWordWrapping
        cell.bodyLabel.sizeToFit()
        cell.bodyLabel.layoutIfNeeded()
        cellList.append(cell)
        return cell
    }
}

