//
//  HomeViewController.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/15.
//

import UIKit
import SnapKit

final class HomeViewController: BaseViewController {
    
    // TODO: - Remove Mock Data
    private let mockModel: [MissionTableViewCellModel] = [
        .init(mission: "A"),
        .init(mission: "B"),
        .init(mission: "C"),
        .init(mission: "D"),
        .init(mission: "E"),
        .init(mission: "F"),
        .init(mission: "G"),
        .init(mission: "H"),
    ]
    
    private let tableView = UITableView(frame: .zero)
    
    override func setupLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func setupAttributes() {
        view.backgroundColor(.black)
        
        tableView.backgroundColor(.black)
            .registerCell(MissionTableViewCell.self)
            .setDelegate(self)
            .setDataSource(self)
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueCell(MissionTableViewCell.self, for: indexPath)
            .configure(mockModel[indexPath.row])
    }
    
}
