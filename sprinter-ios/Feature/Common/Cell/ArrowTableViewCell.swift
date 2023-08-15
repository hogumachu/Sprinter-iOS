//
//  ArrowTableViewCellModel.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/15.
//

import UIKit
import SnapKit

struct ArrowTableViewCellModel {
    
    let title: String
    let description: String?
    
}

final class ArrowTableViewCellModel: BaseTableViewCell {
    
    private let containerView = UIView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)
    private let descriptionLabel = UILabel(frame: .zero)
    private let arrowContainerView = UIView(frame: .zero)
    private let arrowImageView = UIView(frame: .zero)
    
    func configure(_ model: ArrowTableViewCellModel) {
        
    }
    
}
