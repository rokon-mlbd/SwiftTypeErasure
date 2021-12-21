//
//  ViewController.swift
//  SwiftTypeErasure
//
//  Created by Rokon on 12/20/21.
//

import UIKit

 class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private let sections = Data.sections

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(TextTableViewCell.cellNib, forCellReuseIdentifier: TextTableViewCell.id)
        tableView.register(ImageTableViewCell.cellNib, forCellReuseIdentifier: ImageTableViewCell.id)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100

        tableView.dataSource = self
    }
}

/// TableViewDataSource
extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let items = sections[indexPath.section].items
        let item = items[indexPath.row]
        return item.tableViewDequeueReusableCell(tableView)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
}
