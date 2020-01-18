//
// Created by Jeffrey Wei on 2020/1/17.
// Copyright (c) 2020 Jeffrey Wei. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class FullCell: UICollectionViewCell {
    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        label.snp.makeConstraints { $0.center.edges.equalToSuperview() }
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

//不要再设置self.view的高度,而是用子视图贴边撑起
class ExtraFirstViewController: UIViewController, ExtaController {
    private let disposeBag = DisposeBag()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.isScrollEnabled = false
        return view
    }()
    var dataSource = 0..<20

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupCollectionView()
        collectionView.reloadData()
//        reloadData()
    }

    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(0)
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(cellWithClass: FullCell.self)
    }


    private func reloadData() {
        Completable.empty().delay(.seconds(2), scheduler: MainScheduler.instance).subscribe(onCompleted: {
            self.dataSource = 0..<200
            self.collectionView.reloadData {
                self.collectionView.snp.updateConstraints { $0.height.equalTo(self.collectionView.contentSize.height) }
                self.layoutDone()
            }
        }).disposed(by: disposeBag)
    }
}

extension ExtraFirstViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }


    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: FullCell.self, for: indexPath)
        let string = dataSource[indexPath.row].string
        cell.label.text = string
        return cell
    }
}
