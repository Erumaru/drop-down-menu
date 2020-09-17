//
//  CityDropDownTableCell.swift
//  drop-down-menu
//
//  Created by Abzal Toremuratuly on 9/17/20.
//  Copyright © 2020 Abzal Toremuratuly. All rights reserved.
//

import Foundation
import DropDown
import SnapKit

class CityDropDownTableCell: DropDownCustomCell {
    lazy var mainImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .red
        view.layer.cornerRadius = 20
        
        return view
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        markup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func markup() {
        backgroundColor = .white
        contentView.backgroundColor = .white
        selectionStyle = .blue
        
        [mainImageView, nameLabel].forEach { contentView.addSubview($0) }
        
        mainImageView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 40, height: 40))
            $0.left.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.left.equalTo(mainImageView.snp.right).offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
        }
    }
}
