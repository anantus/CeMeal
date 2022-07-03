//
//  GenerateRecipeView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 01/07/22.
//

import SwiftUI

struct GenerateRecipeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var recipeViewModel = RecipeViewModel()
    
    @Environment(\.managedObjectContext) private var viewContent
    @EnvironmentObject var leftoversViewModel:LeftoversViewModel
    
    @FetchRequest(entity: Leftovers.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: true)]) var fetchedLeftovers:FetchedResults<Leftovers>
    
//    @State private var moreIngredients = [String]()
    @State private var moreIngredients = ["Onion", "Garlic", "Chicken", "Apple"]
    
    var body: some View {
//        List(recipeViewModel.recipes){recipe in
//            Text(recipe.mealName)
//        }
        
        List {
            // MARK: With your ingredients title
            RecipeSectionView(title: "With your ingredients", subtitle: "You have \(generateRecipeBasedOnIngredients().count) ingredients", hasActionButton: false)
            ForEach(generateRecipeBasedOnIngredients()) { recipe in
                NavigationLink {
                    RecipeView(recipe: recipe)
                } label: {
                    RecipeListView(recipe: recipe)
//                    Text(recipe.ingredients)
                }
            }

            // MARK: With more ingredients title
            RecipeSectionView(title: "With more ingredients", subtitle: nil, hasActionButton: true)

            // MARK: More ingredients badges
            if moreIngredients.count > 0 {
                ScrollView(.horizontal) {
                    HStack(spacing: 15) {
                        ForEach(moreIngredients, id: \.self) { ingredient in
                            BadgeView(ingredient: ingredient)
                        }
                    }
                }
            }

            // MARK: With more ingredients recipes
            ForEach(generateMoreBasedOnIngredients()) { recipe in
                NavigationLink {
                    RecipeView(recipe: recipe)
                } label: {
                    RecipeListView(recipe: recipe)
                }
            }
        }
        .listStyle(.plain)

        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Text("Back")
                    }
                    .foregroundColor(.red)
                }
            }
        }
    }
    func generateRecipeBasedOnIngredients() -> [Recipe]{
        var availableRecipe : [Recipe] = []
        var checkedIngredients : [String] = []
        for i in fetchedLeftovers{
            if i.isChecked{
                checkedIngredients.append(i.ingredients ?? "Invalid Ingredients")
            }
        }
        for meal in recipeViewModel.recipes{
            let mealIng = meal.ingredients.filter(){$0 != "Water" || $0 != "Salt" || $0 != "Boiling Water" || $0 != "Cold Water"}
            if mealIng.sorted() == checkedIngredients.sorted(){
                availableRecipe.append(meal)
            }
        }
        
        return availableRecipe
    }
    
    
    func generateMoreBasedOnIngredients() -> [Recipe]{
        var availableRecipe : [Recipe] = []
        var checkedIngredients : [String] = []
        for i in fetchedLeftovers{
            if i.isChecked{
                checkedIngredients.append(i.ingredients ?? "Invalid Ingredients")
            }
        }
        for meal in recipeViewModel.recipes{
            let listSet = Set(meal.ingredients)
            let findListSet = Set(checkedIngredients)
            let allElemsContained = findListSet.isSubset(of: listSet)
            if allElemsContained{
                availableRecipe.append(meal)
            }
        }
        
        return availableRecipe
    }
    
}

struct GenerateRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GenerateRecipeView()
        }
    }
}
