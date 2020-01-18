//
// Created by Jeffrey Wei on 2020/1/17.
// Copyright (c) 2020 Jeffrey Wei. All rights reserved.
//

import Foundation
import UIKit
import SwifterSwift
import RxSwift

private let sectionHeight: CGFloat = 40

protocol ExtaController: UIViewController {
    func layoutDone()
}

extension ExtaController {
    func layoutDone() {
        if let parent = self.parent as? FullViewController {
            parent.tableView.reloadData()
        }
    }
}

class FullViewController: TestViewController {
    let extraControllers: [ExtaController]?
    let tableView = UITableView()
    let sectionTop: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    lazy var extraSection: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        let btnLeft = UIButton()
        btnLeft.setTitle("left", for: .normal)
        btnLeft.setTitleColor(.white, for: .normal)
        let btnRight = UIButton()
        btnRight.setTitle("Right", for: .normal)
        btnRight.setTitleColor(.white, for: .normal)
        let stack = UIStackView(arrangedSubviews: [btnLeft, btnRight])
        stack.distribution = .fillEqually
        view.addSubview(stack)
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        return view
    }()
    private var extraCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        return cell
    }()

    init(nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil, extraControllers: [ExtaController]?) {
        self.extraControllers = extraControllers
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        fatalError("fail")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.estimatedRowHeight = 200
        tableView.height = UITableView.automaticDimension
        tableView.sectionHeaderHeight = sectionHeight
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }

    private func setupView() {
        view.backgroundColor = .white
        if let firstVc = self.extraControllers?.first {
            extraCell.contentView.addSubview(firstVc.view)
            firstVc.view.snp.makeConstraints {
                $0.edges.equalToSuperview()
                $0.height.greaterThanOrEqualTo(view.height - sectionHeight).priority(.required)
            }
        }
        if let extraControllers = self.extraControllers, extraControllers.isEmpty != true {
            extraControllers.forEach { controller in
                self.addChild(controller)
            }
        }
//        Completable.empty().delay(.seconds(2), scheduler: MainScheduler.instance).subscribe(onCompleted: {
////            self.transition(from: self.extraControllers[0], to: self.extraControllers[1], duration: 1, animations: nil)
//            self.transition(from: self.extraControllers[0], to: self.extraControllers[1], duration: 1, animations: nil)
//        })
//        Completable.empty().delay(.seconds(2), scheduler: MainScheduler.instance).subscribe(onCompleted: {
//            self.transition(from: self.extraControllers[0], to: self.extraControllers[1], duration: 1, animations: nil)
//        })
    }
}

private enum SectionType: Int, CaseIterable {
    case `default`
    case extra
}

extension FullViewController: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        extraControllers == nil ? 1 : SectionType.allCases.count
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionType = SectionType(rawValue: section) else {
            fatalError()
        }
        switch sectionType {
        case .default:
            return 6
        case .extra:
            return 1
        }
    }

    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionType = SectionType(rawValue: section) else {
            fatalError()
        }
        switch sectionType {
        case .default:
            return sectionTop
        case .extra:
            return extraSection
        }
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = SectionType(rawValue: indexPath.section) else {
            fatalError()
        }
        switch sectionType {
        case .default:
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.text = indexPath.row.string
            return cell
        case .extra:
            return extraCell
        }
    }
}
