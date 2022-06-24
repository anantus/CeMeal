//
//  FavoriteView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 25/06/22.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject private var recipeViewModel = RecipeViewModel()
    @State private var searchQuery = ""
    
    var body: some View {
        NavigationView {
            List(recipeViewModel.recipes) { recipe in
                HStack(alignment: .center) {
                    // Checkbox
                    Image("NoIngredient")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100, alignment: .center)
                        .clipped()
                        .cornerRadius(10)
                        .padding(0)
                    
                    // Content
                    VStack(alignment: .leading) {
                        
                        // Title
                        Text(recipe.title)
                            .font(
                                .title3
                                .weight(.semibold)
                            )
                            .foregroundColor(Color.ui.title)
                            .textCase(.uppercase)
                        
                        // Category
                        Text("You have all the ingredients")
                            .foregroundColor(.accentColor)
                            .font(
                                .system(.callout, design: .serif)
                                .italic()
                            )
                        
                    }
                    .padding(.horizontal, 8)
                    
                }
                .padding(.vertical, 10)
            }
            .listStyle(.plain)
            
            .navigationTitle("Favorites")
            .navigationBarColor(backgroundColor: .systemBackground, titleColor: UIColor(Color.ui.title))
            .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always))
        }
        
    }
}

#if DEBUG
struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
#endif
