//
//  FTTableComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTFeedRecipeTableComponent: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    private let model: FTFeedRecipeTableModel
    
    init() {
        model = FTFeedRecipeTableModel()
        
        super.init(frame: .zero, style: .plain)
        
        delegate = self
        dataSource = self
        
        register(
            FTFeedRecipeTableCellComponent.self,
            forCellReuseIdentifier: FTFeedRecipeTableCellComponent.identifier
        )
        
        setupView()
        
        model.readRecipes { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success:
                self.reloadData()
            case .failure:
                print("We will do something here")
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        separatorStyle = .none
        
        contentInset.top = 12
                
        let infoComponent = FTFeedInfoComponent()
        infoComponent.translatesAutoresizingMaskIntoConstraints = true

        tableHeaderView = infoComponent

        tableHeaderView?.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        // Necessary, otherwise the tableHeaderView snaps into position upon
        // initial scroll
        tableHeaderView?.layoutIfNeeded()
    }
            
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.recipeOverviews?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: FTFeedRecipeTableCellComponent.identifier,
            for: indexPath
        ) as? FTFeedRecipeTableCellComponent else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        parentViewController?.navigationController?.pushViewController(
            FTRecipeCardViewController(),
            animated: true
        )
    }

}
