//
//  FTFeedRecipeTableCellView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTFeedRecipeTableCellView: View {
    
    @ObservedObject var model: FTFeedRecipeTableCellViewModel2
    
    @State var presentRecipeView: Bool = false
    
    var body: some View {
        HStack {
            Content(model: model)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(.clear)
        .onTapGesture {
            presentRecipeView = true
        }
        .background(
            NavigationLink("", isActive: $presentRecipeView) {
                if let model = model.createRecipeCardModel() {
                    FTRecipeCardView(model: model)
                    .navigationBarBackButtonHidden(true)
                }
            }
            .opacity(0)
        )
    }
        
}

private struct Content: View {
    
    @ObservedObject var model: FTFeedRecipeTableCellViewModel2
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            ImageView(model: model)
            RightContainer(model: model)
        }
        .padding(8)
        .background(.white)
        .cornerRadius(8)
        .shadow(
            color: Color(uiColor: .black.withAlphaComponent(0.08)),
            radius: 4,
            x: 0,
            y: 1
        )
    }
}

private struct ImageView: View {
    
    @ObservedObject var model: FTFeedRecipeTableCellViewModel2
    
    var body: some View {
        if let image = model.image {
            Image(uiImage: image)
            .resizable()
            .frame(width: 100, height: 100)
            .aspectRatio(contentMode: .fill)
            .cornerRadius(8)
        }
        else {
            Rectangle()
            .fill(Color(uiColor: FTColorPalette.placeholder))
            .frame(width: 100, height: 100)
            .cornerRadius(8)
        }
    }
}

private struct RightContainer: View {
    
    @ObservedObject var model: FTFeedRecipeTableCellViewModel2
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 4) {
                Category(model: model)
                Area(model: model)
            }
            
            Spacer()
            .frame(maxHeight: 8)
            
            TitleLabel(model: model)
            
            Spacer()
            .frame(maxHeight: 12)
            
            FTFeedRecipeTableCellTagsView(model: model.createTagsModel())
        }
    }
}

private struct Category: View {
    
    @ObservedObject var model: FTFeedRecipeTableCellViewModel2
    
    var body: some View {
        HStack {
            CategoryLabel(model: model)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color(uiColor: UIColor(hex: 0xD8F3FF)))
        .cornerRadius(4)
    }
}

private struct CategoryLabel: View {
    
    @ObservedObject var model: FTFeedRecipeTableCellViewModel2
    
    var body: some View {
        Text(model.recipe?.category ?? "Category")
        .foregroundColor(Color(uiColor: UIColor(hex: 0x0072A3)))
        .font(.caption2.weight(.semibold))
    }
}

private struct Area: View {
    
    @ObservedObject var model: FTFeedRecipeTableCellViewModel2
    
    var body: some View {
        HStack {
            AreaLabel(model: model)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color(uiColor: UIColor(hex: 0xFFF2C3)))
        .cornerRadius(4)
    }
}

private struct AreaLabel: View {
    
    @ObservedObject var model: FTFeedRecipeTableCellViewModel2
    
    var body: some View {
        Text(model.recipe?.area ?? "Area")
        .foregroundColor(Color(uiColor: UIColor(hex: 0xA68200)))
        .font(.caption2.weight(.semibold))
    }
}

private struct TitleLabel: View {
    
    @ObservedObject var model: FTFeedRecipeTableCellViewModel2
    
    var body: some View {
        Text(model.recipe?.mealName ?? "Meal name")
        .foregroundColor(.black)
        .font(.title3.weight(.semibold))
        .lineLimit(3)
    }
}

//struct FTFeedRecipeTableCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        FTFeedRecipeTableCellView(presentRecipeView: .constant(false))
//    }
//}
