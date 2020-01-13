//
//  ViewController.swift
//  SwiftExtension
//
//  Created by Jeffrey Wei on 2019/12/26.
//  Copyright © 2019 JF. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit
import Moya

class ViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    private lazy var cell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        return cell
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigation()
    }

    private func setupNavigation() {
        let item = UIBarButtonItem(title: "test", style: .plain, target: self, action: #selector(clickMe))
        navigationItem.leftBarButtonItem = item
    }

    @objc private func clickMe() {
        print("11")

    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell
    }
}
