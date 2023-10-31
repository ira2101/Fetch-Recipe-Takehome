//
//  FTTableComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTFeedRecipeTableComponent: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    init() {
        super.init(frame: .zero, style: .plain)
        
        delegate = self
        dataSource = self
        
        register(
            FTFeedRecipeTableCellComponent.self,
            forCellReuseIdentifier: FTFeedRecipeTableCellComponent.identifier
        )
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
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

}
