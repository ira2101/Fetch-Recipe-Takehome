//
//  FTRecipeTableCellComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTFeedRecipeTableCellComponent: UITableViewCell {
    
    static let identifier = "FTFeedRecipeTableCellComponent"
    
    private var categoryLabel: FTLabel!
    
    private var areaLabel: FTLabel!
    
    private var titleLabel: FTLabel!
    
    private var tagsComponent: FTFeedRecipeTableCellTagsComponent!
    
    private var ftImageView: FTImageView!
    
    var model: FTFeedRecipeTableCellViewModel?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        selectionStyle = .none
        
        let cell = Cell()
        contentView.addSubview(cell)
        cell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
        
    func ftConfigure(model: FTFeedRecipeTableCellViewModel) {
        self.model = model
        
        model.readRecipe { [weak self] recipe in
            guard let self = self else { return }
            
            self.categoryLabel.ftText(recipe.category)
            
            self.areaLabel.ftText(recipe.area)
            
            self.titleLabel.ftText(recipe.mealName)
            
            self.tagsComponent.ftConfigure(model: model.createTagsModel())
            
            model.readThumbnailImage { image in
                self.ftImageView.ftImage(image)
            }
        }
    }
    
    private func Cell() -> UIView {
        return FTHStack()
        .ftAddArrangedSubview(
            Content()
        )
        .ftPaddingHorizontal(16)
        .ftPaddingVertical(8)
        .ftBackgroundColor(.clear)
    }
    
    private func Content() -> UIView {
        return FTHStack()
        .ftAddArrangedSubview(
            ImageViewContainer()
        )
        .ftAddArrangedSubview(
            RightContainer()
        )
        .ftSpacing(12)
        .ftAlignment(.top)
        .ftPadding(8)
        .ftBackgroundColor(.white)
        .ftCornerRadius(8)
        .ftShadow(
            color: .black.withAlphaComponent(0.08),
            blur: 4,
            offset: CGSize(width: 0, height: 1)
        )
    }
    
    private func ImageViewContainer() -> UIView {
        return FTHStack()
        .ftAddArrangedSubview(
            ImageView()
        )
        .ftWidth(100)
        .ftHeight(100)
        .ftCornerRadius(8)
        .ftClipsToBounds(true)
    }
    
    private func ImageView() -> UIView {
        ftImageView =
        FTImageView()
        .ftContentMode(.scaleAspectFill)
        .ftPlaceholder(
            FTHStack()
            .ftBackgroundColor(FTColorPalette.placeholder)
        )
        .ftShowPlaceholder(true)
        return ftImageView
    }
    
    private func RightContainer() -> UIView {
        return FTVStack()
        .ftAddArrangedSubview(
            guaranteedAlignment: .leading,
            FTHStack()
            .ftAddArrangedSubview(
                Category()
            )
            .ftAddArrangedSubview(
                Area()
            )
            .ftSpacing(4)
        )
        .ftSpacer(8)
        .ftAddArrangedSubview(
            TitleLabel()
        )
        .ftSpacer(12)
        .ftAddArrangedSubview(
            Tags()
        )
    }
    
    private func Category() -> UIView {
        return FTHStack()
        .ftAddArrangedSubview(
            CategoryLabel()
        )
        .ftPaddingHorizontal(8)
        .ftPaddingVertical(4)
        .ftCornerRadius(4)
        .ftBackgroundColor(UIColor(hex: 0xD8F3FF))
    }
    
    private func CategoryLabel() -> UIView {
        categoryLabel =
        FTLabel()
        .ftText("Category")
        .ftTextColor(UIColor(hex: 0x0072A3))
        .ftFont(textStyle: .caption2, weight: .semibold)
        return categoryLabel
    }
    
    private func Area() -> UIView {
        return FTHStack()
        .ftAddArrangedSubview(
            AreaLabel()
        )
        .ftPaddingHorizontal(8)
        .ftPaddingVertical(4)
        .ftCornerRadius(4)
        .ftBackgroundColor(UIColor(hex: 0xFFF2C3))
    }
    
    private func AreaLabel() -> UIView {
        areaLabel =
        FTLabel()
        .ftText("Area")
        .ftTextColor(UIColor(hex: 0xA68200))
        .ftFont(textStyle: .caption2, weight: .semibold)
        return areaLabel
    }
    
    private func TitleLabel() -> UIView {
        titleLabel =
        FTLabel()
        .ftText("Title")
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .title3, weight: .semibold)
        .ftNumberOfLines(3)
        return titleLabel
    }
    
    private func Tags() -> UIView {
        tagsComponent = FTFeedRecipeTableCellTagsComponent()
        return tagsComponent
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        tagsComponent.ftPrepareForReuse()
        ftImageView.ftShowPlaceholder(true)
    }
    
}
