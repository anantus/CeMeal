//
//  RecipeView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 25/06/22.
//

import SwiftUI

struct RecipeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedMenu = 0
    
    var recipe: Recipe
    
    var body: some View {
        ZStack {
            ScrollView {
                ScrollViewReader { scrollProxy in
                    // Recipe image
//                    AsyncImage(
//                        url: URL(string: recipe.thumbnail),
//                        content: { image in
//                            image
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .border(.blue)
//                                .clipped()
//                                .frame(width: .infinity, height: 250, alignment: .center)
//                                .cornerRadius(10)
//                                .padding(0)
//                        },
//                        placeholder: {
//                            ProgressView()
//                        }
//                    )
                    
                    //TODO: Image URL
                    Image(Image.ui.thumbnailImagePlaceholder)
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
                        RecipeIngredientsView(title: "Main", recipe: recipe)
                    } else if selectedMenu == 1 {
                        RecipeIngredientsView(title: "How to make", recipe: recipe)
                    } else if selectedMenu == 2 {
                        RecipeSuggestionsView()
                    }
                }
            }
            
            // Done cooking button
            NavigationLink {
                LeftoverCheckupView()
            } label: {
                Text("Done Using Ingredients")
                    .fontWeight(.heavy)
                    .foregroundColor(Color.ui.buttonLabel)
            }
            .buttonStyle(NeumorphicButtonStyle(bgColor: .accentColor))
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom)
            
        }
        
        .navigationTitle(recipe.mealName)
        .navigationBarBackButtonHidden(true)
        .navigationBarColor(backgroundColor: .systemBackground, titleColor: UIColor(Color.ui.title))
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Back")
                        .foregroundColor(.red)
                }
            }
            //TODO: Buat heart recipe
            //            ToolbarItem(placement: .confirmationAction) {
            //                Image(systemName: recipe. ? "heart.fill" : "heart")
            //                    .foregroundColor(.accentColor)
            //            }
        }
    }
    
}

//struct RecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            RecipeView(recipe: Recipe(title: "Nasi Goreng", isFavorite: true))
//        }
//    }
//}
