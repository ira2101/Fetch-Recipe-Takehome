//
//  FTRecipeCardView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTRecipeCardView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var scrollOffset: CGFloat = 0
    
    @State var overviewPercentOffscreen: CGFloat = 0
    
    var model: FTRecipeCardViewControllerViewModel2
    
    init(model: FTRecipeCardViewControllerViewModel2) {
        self.model = model
        
        let appearance = UINavigationBarAppearance()

        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        appearance.shadowColor = nil
        appearance.shadowImage = nil

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                FTRecipeCardBackgroundImageView(
                    model: model.createBackgroundImageModel(),
                    scrollOffset: $scrollOffset
                )
                FTRecipeCardVScrollView(
                    model: model.createVScrollModel(),
                    scrollOffset: $scrollOffset,
                    overviewPercentOffscreen: $overviewPercentOffscreen
                )
                
                GeometryReader { geometry in
                    VStack {
                        Rectangle()
                        .fill(Color.white.opacity(overviewPercentOffscreen))
                        .frame(height: geometry.safeAreaInsets.top)
                        
                        Spacer()
                    }
                    .ignoresSafeArea(.all)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    backButton
                }
                ToolbarItem(placement: .principal) {
                    Text(model.recipe.mealName)
                    .foregroundColor(.black.opacity(overviewPercentOffscreen))
                    .font(.body.weight(.semibold))
                }
            }
        }
    }
    
    var backButton: some View {
        HStack {
            Image(systemName: FTSymbol.FTSymbolPalette.back.rawValue)
            .foregroundColor(
                overviewPercentOffscreen == 1.0
                ? .black
                : .white.opacity(1 - overviewPercentOffscreen)
            )
            .font(.body.weight(.semibold))
        }
        .frame(width: 32, height: 32)
        .background(
            Color.black.opacity(0.5).opacity(1 - overviewPercentOffscreen)
        )
        .cornerRadius(.greatestFiniteMagnitude)
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
    }
        
}

//struct FTRecipeCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        FTRecipeCardView()
//    }
//}
