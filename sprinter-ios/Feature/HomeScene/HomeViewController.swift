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
    private let actionButton = ActionButton(frame: .zero)
    
    override func setupLayout() {
        tableView.registerSuperView(view)
            .snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        actionButton.registerSuperView(view)
            .snp.makeConstraints { make in
                make.trailing.equalToSuperview().offset(-20)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
                make.height.equalTo(48)
            }
    }
    
    override func setupAttributes() {
        view.backgroundColor(.black)
        
        tableView.backgroundColor(.black)
            .registerCell(ArrowTableViewCell.self)
            .registerCell(MissionTableViewCell.self)
            .setDelegate(self)
            .setDataSource(self)
        
        actionButton.setStyle(.line)
            .setTitle(title: "미션 추가하기", for: .normal)
            .cornerRadius(48 / 2)
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            return tableView.dequeueCell(ArrowTableViewCell.self, for: indexPath)
                .configure(.init(title: "60%를 달성했어요!", description: "총 6개를 완료했어요\n이번 달 남은 미션은 4개에요"))
        }
        return tableView.dequeueCell(MissionTableViewCell.self, for: indexPath)
            .configure(mockModel[indexPath.row])
    }
    
}
