//
//  ViewController.swift
//  TableView Basics
//
//  Created by Chaitanya Soni on 18/08/24.
//

import UIKit
extension UIView {
    convenience init(tamic: Bool) {
        self.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = tamic
    }
}
class ViewController: UIViewController {
    
    lazy var stackView = UIStackView(tamic: false)
    lazy var searchBar = UISearchBar(tamic: false)
    lazy var tableView = UITableView(tamic: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 4
        
        self.view.addSubview(stackView)
        
        self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        stackView.addArrangedSubview(searchBar)
        stackView.addArrangedSubview(tableView)
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 50 : 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = "\(indexPath.section), \(indexPath.row)"
        cell.detailTextLabel?.text = "subtitle"
        // Configure the cell...
        cell.backgroundColor = (indexPath.row % 2 == 0) ? .yellow : .green
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.text = "\(section)"
        return label
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        ["0", "1"]
    }
}
