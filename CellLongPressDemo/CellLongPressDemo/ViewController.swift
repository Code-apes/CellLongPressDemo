//
//  ViewController.swift
//  CellLongPressDemo
//
//  Created by 席银军 on 2018/2/20.
//  Copyright © 2018年 muhlenXi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func onLongPressCell(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let location = sender.location(in: self.tableView)
            print(location)
            if let indexpath = self.tableView.indexPathForRow(at: location) {
                print("取消论坛 \(indexpath.section)")
            }
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "记录 \(indexPath.section)"
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.onLongPressCell(_:)))
        longPress.minimumPressDuration = 1.0
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("selected sections \(indexPath.section)")
    }
}

