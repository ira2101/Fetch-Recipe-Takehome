//
//  FTFeedTableResultsCountView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTFeedTableResultsCountView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("0 ")
            .foregroundColor(.black)
            .font(.footnote.weight(.bold))
            
            + Text(FTFormatter.pluralize("result", count: 0))
            .foregroundColor(.black)
            .font(.footnote.weight(.medium))
        }
        .padding(.leading, 16)
    }
}

struct FTFeedTableResultsCountView_Previews: PreviewProvider {
    static var previews: some View {
        FTFeedTableResultsCountView()
    }
}
