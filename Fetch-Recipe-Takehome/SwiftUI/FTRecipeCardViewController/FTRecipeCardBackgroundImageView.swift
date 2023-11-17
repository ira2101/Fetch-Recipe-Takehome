//
//  FTRecipeCardBackgroundImageView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTRecipeCardBackgroundImageView: View {
    
    @ObservedObject var model: FTRecipeCardBackgroundImageViewModel2
    
    @Binding var scrollOffset: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            if let image = model.image {
                Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(
                    width: geometry.size.width,
                    height: max(geometry.size.width, geometry.size.width + scrollOffset)
                )
            }
            else {
                Rectangle()
                .fill(Color(uiColor: FTColorPalette.placeholder))
                .frame(
                    width: geometry.size.width,
                    height: max(geometry.size.width, geometry.size.width + scrollOffset)
                )
            }
            
        }
        .edgesIgnoringSafeArea(.top)
    }
}

//struct FTRecipeCardBackgroundImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        FTRecipeCardBackgroundImageView()
//    }
//}
