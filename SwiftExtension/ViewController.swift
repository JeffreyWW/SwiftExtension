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

private let cellId = "cellId"

class ViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigation()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
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
        TestEnum.allCases.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let test = TestEnum.allCases[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = test.rawValue
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let test = TestEnum.allCases[indexPath.row]
        navigationController?.pushViewController(test.controller, animated: true)
    }
}
