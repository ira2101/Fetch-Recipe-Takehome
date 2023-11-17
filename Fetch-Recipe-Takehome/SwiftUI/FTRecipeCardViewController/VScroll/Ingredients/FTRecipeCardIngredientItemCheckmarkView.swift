//
//  FTRecipeCardIngredientItemCheckmarkView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTRecipeCardIngredientItemCheckmarkView: View {
    
    @State var isActive = false
    
    var body: some View {
        Button(action: onPress) {
            HStack {
                if isActive {
                    Image(
                        systemName: FTSymbol.FTSymbolPalette.checkmark.rawValue
                    )
                    .tint(.white)
                    .font(.caption.weight(.medium))
                }
            }
            .frame(width: 28, height: 28)
            .background(
                isActive
                ? Color(uiColor: FTColorPalette.primary)
                : .clear
            )
            .cornerRadius(.greatestFiniteMagnitude)
            .overlay(overlay)
        }
    }
    
    @ViewBuilder
    var overlay: some View {
        if !isActive {
            Capsule()
            .strokeBorder(
                Color(uiColor: UIColor(hex: 0xE9E9E9)), lineWidth: 1.0
            )
        }
    }
    
    private func onPress() {
        isActive = !isActive
    }
}

//private func Container() -> UIView {
//    container =
//    FTHStack()
//    .ftAddArrangedSubview(
//        guaranteedAlignment: .center,
//        Checkmark()
//    )
//    .ftWidth(28)
//    .ftHeight(28)
//    .ftBorder(width: 1, color: unselectedBorderColor)
//    .ftBackgroundColor(.clear)
//    .ftCapsulateCorners()
//    return container
//}

//private func Checkmark() -> UIView {
//    checkmark =
//    FTSymbol()
//    .ftSymbol(.checkmark, textStyle: .caption1, weight: .medium)
//    .ftColor(.white)
//    .ftIsHidden(true)
//    return checkmark
//}

struct FTRecipeCardIngredientItemCheckmarkView_Previews: PreviewProvider {
    static var previews: some View {
        FTRecipeCardIngredientItemCheckmarkView()
    }
}
