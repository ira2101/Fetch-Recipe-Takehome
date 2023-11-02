//
//  FTTableComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTFeedRecipeTableComponent: UITableView, UITableViewDelegate, UITableViewDataSource, FTFeedHeaderFilterBarDelegate {
    
    private let model: FTFeedRecipeTableModel
    
    private var resultsCountComponent: FTFeedTableResultsCountComponent!
    
    private var messageComponent: FTFeedRecipeTableMessageComponent!
    
    private let loadingSpinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.isHidden = true
        spinner.stopAnimating()
        return spinner
    }()
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        separatorStyle = .none
        
        contentInset.top = 12
                
        resultsCountComponent = FTFeedTableResultsCountComponent()
        resultsCountComponent.translatesAutoresizingMaskIntoConstraints = true

        tableHeaderView = resultsCountComponent

        tableHeaderView?.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        // Necessary, otherwise the tableHeaderView snaps into position upon
        // initial scroll
        tableHeaderView?.layoutIfNeeded()
        
        messageComponent = FTFeedRecipeTableMessageComponent()
        
        addSubview(messageComponent)
        
        messageComponent.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        addSubview(messageComponent)
        
        messageComponent.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        addSubview(loadingSpinner)
        
        loadingSpinner.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
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
        
        guard let recipeOverviews = model.recipeOverviews else {
            return UITableViewCell()
        }
        
        let index = indexPath.row
        let recipeOverview = recipeOverviews[index]
        
        cell.ftConfigure(model: model.createTableCellModel(recipeOverview: recipeOverview))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? FTFeedRecipeTableCellComponent else {
            return
        }
        
        guard let cellModel = cell.model else {
            return
        }
        
        guard let recipeCardModel = cellModel.createRecipeCardModel() else {
            return
        }
        
        let recipeCardViewController = FTRecipeCardViewController(model: recipeCardModel)
        
        parentViewController?.navigationController?.pushViewController(
            recipeCardViewController,
            animated: true
        )
    }
    
    func ftFeedHeaderFilterBarDidChangeFilterTo(filter: String) {
        loadingSpinner.startAnimating()
        loadingSpinner.isHidden = false
        
        model.readRecipes(filter: filter) { [weak self] result in
            guard let self = self else {
                return
            }
            
            self.loadingSpinner.stopAnimating()
            self.loadingSpinner.isHidden = true
            
            switch result {
            case .success(let recipeOverviews):
                if recipeOverviews.count == 0 {
                    messageComponent.ftConfigure(message: "No results found")
                }
                
                resultsCountComponent.ftConfigure(count: recipeOverviews.count)
                self.reloadData()
            case .failure:
                messageComponent.ftConfigure(message: "An unexpected error has occured")
                resultsCountComponent.ftConfigure(count: 0)
            }
        }
    }

}
