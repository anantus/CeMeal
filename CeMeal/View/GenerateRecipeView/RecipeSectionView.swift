//
//  RecipeSectionView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 01/07/22.
//

import SwiftUI

struct RecipeSectionView: View {
    
    let title: String
    let subtitle: String?
    let hasActionButton: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                // Title
                Text(title)
                    .font(
                        .title3
                        .weight(.bold)
                    )
                    .foregroundColor(Color.ui.title)
                
                // Subtitle
                if let desc = subtitle {
                    Text(desc)
                        .foregroundColor(.accentColor)
                        .font(
                            .system(.callout, design: .serif)
                            .italic()
                        )
                }
            }
            
            Spacer()
            
            // Action button
            if hasActionButton {
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.accentColor)
                }
            }
        }
    }
}

struct RecipeSectionView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSectionView(title: "With your ingredients", subtitle: "You have 7 ingredients", hasActionButton: false)
    }
}
