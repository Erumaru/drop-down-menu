//
//  ViewController.swift
//  drop-down-menu
//
//  Created by Abzal Toremuratuly on 9/17/20.
//  Copyright © 2020 Abzal Toremuratuly. All rights reserved.
//

import UIKit
import DropDown
import SnapKit

class ViewController: UIViewController {

    lazy var dropDownButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Drop down", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(toggleDropDown), for: .touchUpInside)
            
        return button
    }()
    
    lazy var dropDown: DropDown = {
        let view = DropDown()
        view.anchorView = self.dropDownButton
        view.dataSource = ["1", "2", "3"]
        view.cellClass = CityDropDownTableCell.self
        view.customCellConfiguration = { [weak self] index, item, cell -> Void in
            guard let self = self, let cell = cell as? CityDropDownTableCell else { return }
            cell.nameLabel.text = item
        }
        view.bottomOffset = .init(x: 0, y: 68)
        view.width = 120
        view.cellHeight = 60
        view.cornerRadius = 10
        view.direction = .bottom

        return view
    }()
    
    @objc private func toggleDropDown() {
        dropDown.show()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        markup()
    }

    private func markup() {
        view.backgroundColor = .red
        
        view.addSubview(dropDownButton)
        
        dropDownButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 120, height: 60))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.topMargin).offset(24)
        }
    }
}

