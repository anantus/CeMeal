//
//  RecipeView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 25/06/22.
//

import SwiftUI

struct RecipeView: View {
    
    @State private var selectedMenu = 0
    
    var recipe: Recipe
    
    var body: some View {
        ZStack {
            ScrollView {
                    ScrollViewReader { scrollProxy in
                        // Recipe image
                        Image(recipe.thumbnailImage ?? Image.ui.thumbnailImagePlaceholder)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .border(.blue)
                            .clipped()
                            .frame(width: .infinity, height: 250, alignment: .center)
                            .cornerRadius(10)
                            .padding(0)
                        
                        // Segmented control
                        Picker("Menu", selection: $selectedMenu, content: {
                            Group {
                                Text("Ingredients")
                            }
                            .tag(0)
                            VStack {
                                Text("Directions")
                            }
                            .tag(1)
                            VStack {
                                Text("Might Like")
                            }
                            .tag(2)
                        })
                        .pickerStyle(.segmented)
                        .padding()
                        
                        // Content
                        if selectedMenu == 0 {
                            RecipeIngredientsView(title: "Main", content: "- 1.4 kg / 3 pounds whole chicken, cut into pieces or chicken wings / drumsticks / boneless chicken thigh (choose from these based on your preference), rinsed\n- Abc")
                        } else if selectedMenu == 1 {
                            RecipeIngredientsView(title: "How to make", content: "1. In a bowl, place the chicken, rice wine, ginger, salt, and black pepper.\n2. Combine them well.\n3. Then evenly coat the chicken with the starch (dip the individual chicken pieces into the bowl of starch, roll the chicken around a bit then take them out) and set aside.")
                        } else if selectedMenu == 2 {
                            RecipeSuggestionsView()
                        }
                    }
                }
            
                // Done cooking button
                Button {
                    
                } label: {
                    Text("Done Using Ingredients")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.ui.buttonLabel)
                }
                .buttonStyle(NeumorphicButtonStyle(bgColor: .accentColor))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom)

            }
        
            .navigationTitle(recipe.title)
            .navigationBarColor(backgroundColor: .systemBackground, titleColor: UIColor(Color.ui.title))
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Image(systemName: recipe.isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(.accentColor)
            }
        }
    }
    
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipeView(recipe: Recipe(title: "Nasi Goreng", isFavorite: true))
        }
    }
}
