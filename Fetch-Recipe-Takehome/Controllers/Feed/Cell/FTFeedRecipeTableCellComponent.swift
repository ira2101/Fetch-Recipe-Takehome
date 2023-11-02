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
    
    func ftConfigure(model: FTFeedRecipeTableCellModel) {
        
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
            Image()
        )
        .ftAddArrangedSubview(
            RightContainer()
        )
        .ftSpacing(12)
        .ftAlignment(.center)
        .ftPadding(8)
        .ftBackgroundColor(.white)
        .ftCornerRadius(8)
        .ftShadow(
            color: .black.withAlphaComponent(0.08),
            blur: 4,
            offset: CGSize(width: 0, height: 1)
        )
    }
    
    private func Image() -> UIView {
        return FTHStack()
        .ftAddArrangedSubview(
            FTImageView()
            .ftImage(UIImage(named: "default"))
        )
        .ftWidth(100)
        .ftHeight(100)
        .ftCornerRadius(8)
        .ftClipsToBounds(true)
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
        .ftAddArrangedSubview(
            guaranteedAlignment: .leading,
            TitleLabel()
        )
        .ftAddArrangedSubview(
            Tags()
        )
        .ftSpacing(8)
    }
    
    private func Category() -> UIView {
        return FTHStack()
        .ftAddArrangedSubview(
            FTLabel()
            .ftText("Category")
            .ftTextColor(UIColor(hex: 0x0072A3))
            .ftFont(textStyle: .footnote, weight: .semibold)
        )
        .ftPaddingHorizontal(8)
        .ftPaddingVertical(4)
        .ftCornerRadius(4)
        .ftBackgroundColor(UIColor(hex: 0xD8F3FF))
    }
    
    private func Area() -> UIView {
        return FTHStack()
        .ftAddArrangedSubview(
            FTLabel()
            .ftText("Area")
            .ftTextColor(UIColor(hex: 0xA68200))
            .ftFont(textStyle: .footnote, weight: .semibold)
        )
        .ftPaddingHorizontal(8)
        .ftPaddingVertical(4)
        .ftCornerRadius(4)
        .ftBackgroundColor(UIColor(hex: 0xFFF2C3))
    }
    
    private func TitleLabel() -> UIView {
        return FTLabel()
        .ftText("Title")
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .title3, weight: .semibold)
    }
    
    private func Tags() -> UIView {
        return FTFeedRecipeTableCellTagsComponent()
    }

}
