//
//  MissionViewController.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit
import SnapKit

final class MissionViewController: BaseViewController {
    
    private let tableView = UITableView(frame: .zero)
    private let addButton = ActionButton(frame: .zero)
    
    override func setupLayout() {
        tableView.registerSuperView(view)
            .snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        
        addButton.registerSuperView(view)
            .snp.makeConstraints { make in
                make.trailing.equalToSuperview().offset(-20)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
                make.height.equalTo(48)
            }
    }
    
    override func setupAttributes() {
        tableView.backgroundColor(.black)
            .registerCell(ArrowTableViewCell.self)
            .registerCell(MissionTableViewCell.self)
            .setDelegate(self)
            .setDataSource(self)
        
        addButton.setStyle(.line)
            .setTitle(title: "미션 추가하기", for: .normal)
            .cornerRadius(48 / 2)
    }
    
}

extension MissionViewController: UITableViewDelegate { }

extension MissionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
