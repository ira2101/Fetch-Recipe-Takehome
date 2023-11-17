//
//  FTRecipeCardVScrollView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTRecipeCardVScrollView: View {
    
    var model: FTRecipeCardVScrollViewModel2
    
    @Binding var scrollOffset: CGFloat
    
    @Binding var overviewPercentOffscreen: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Spacer()
                    .frame(height: geometry.size.width - geometry.safeAreaInsets.top)
                    
                    VStack {
                        FTRecipeCardOverviewView(
                            model: model.createOverviewModel(),
                            overviewPercentOffscreen: $overviewPercentOffscreen,
                            safeAreaInsets: geometry.safeAreaInsets
                        )
                        FTRecipeCardIngredientsView(model: model.createIngredientsModel())
                        FTRecipeCardInstructionsView(model: model.createInstructionsModel())
                    }
                    .padding(.bottom, 16)
                    .background(Color(uiColor: UIColor(hex: 0xF6F6F8)))
                    .background(
                        GeometryReader { geometryTemp in
                            Color.clear.preference(
                                key: ScrollOffsetPreferenceKey.self,
                                value: geometryTemp.frame(in: .named("FTRecipeCardVScrollView"))
                                .minY - geometry.size.width + geometry.safeAreaInsets.top
                            )
                        }
                    )
                }

            }
            .coordinateSpace(name: "FTRecipeCardVScrollView")
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                scrollOffset = value
            }
        }
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    
    typealias Value = CGFloat
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
    
}

//struct FTRecipeCardVScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        FTRecipeCardVScrollView(
//            scrollOffset: .constant(0),
//            overviewPercentOffscreen: .constant(0)
//        )
//    }
//}
