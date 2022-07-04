//
//  GenerateRecipeView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 01/07/22.
//

import SwiftUI

struct GenerateRecipeView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var additionalIngredientVM : AdditionalIngredientViewModel
    @ObservedObject var recipeViewModel = RecipeViewModel()
    @Environment(\.managedObjectContext) private var viewContent
    @EnvironmentObject var leftoversViewModel:LeftoversViewModel
    
    @FetchRequest(entity: Leftovers.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: true)]) var fetchedLeftovers:FetchedResults<Leftovers>
    @FetchRequest(entity: AdditionalIngredient.entity(), sortDescriptors: [NSSortDescriptor(key: "title", ascending: true)]) var fetchedAddIngredient:FetchedResults<AdditionalIngredient>
    
//    @State private var moreIngredients = [String]()
    
    var body: some View {
        ScrollView {
            // MARK: With your ingredients title
            RecipeSectionView(title: "With your ingredients", subtitle: "You have \(countCheckIngredient()) ingredients", hasActionButton: false)
                .padding(.horizontal)
                .padding(.top)
            Divider()
            
            // MARK: With your ingredients recipes
            ForEach(generateRecipeBasedOnIngredients()) { recipe in
                NavigationLink {
                    RecipeView(recipe: recipe)
                } label: {
                    RecipeListView(recipe: recipe, countIngredient: countCheckIngredient())
                }
                .padding(.horizontal)
                Divider()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(colorScheme == .light ? .white : Color(UIColor.systemGray6))
            
            // MARK: With more ingredients title
            RecipeSectionView(title: "With more ingredients", subtitle: nil, hasActionButton: true)
                .padding(.horizontal)
            Divider()
            
            // MARK: More ingredients capsules
            if fetchedAddIngredient.count > 0 {
                ScrollView(.horizontal) {
                    HStack(spacing: 15) {
                        ForEach(fetchedAddIngredient) { ingredient in
                            CapsuleView(ingredient: ingredient)
                                .onTapGesture {
                                    additionalIngredientVM.deleteAdditionalIngredient(addIng: ingredient, context: viewContent)
                                    
                                    print("Ingredient deleted successfully")
                                }
                        }
                    }
                }
                .padding(.horizontal)
                Divider()
            }

            // MARK: With more ingredients recipes
            ForEach(generateMoreBasedOnIngredients()) { recipe in
                NavigationLink {
                    RecipeView(recipe: recipe)
                } label: {
                    RecipeListView(recipe: recipe, countIngredient: countCheckIngredient())
                }
                .padding(.horizontal)
                Divider()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(colorScheme == .light ? .white : Color(UIColor.systemGray6))
//        .refreshable {
//            additionalIngredientViewModel.getAdditionalIngredients()
//        }
        
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
            
//            ToolbarItem(placement: .navigationBarTrailing) {
//                Button(action: {
//                    additionalIngredientVM.getAdditionalIngredients()
//                }) {
//                    Image(systemName: "arrow.clockwise")
//                }
//            }
        }
    }
    
    func countCheckIngredient() -> Int{
        var checkedIngredients : [String] = []
        for i in fetchedLeftovers{
            if i.isChecked{
                checkedIngredients.append(i.ingredients ?? "Invalid Ingredients")
            }
        }
        return checkedIngredients.count
    }
    
    func generateRecipeBasedOnIngredients() -> [Recipe]{
        var availableRecipe : [Recipe] = []
        var checkedIngredients : [String] = []
        for i in fetchedLeftovers{
            let check = i.isChecked
            if check{
                checkedIngredients.append(i.ingredients ?? "Invalid Ingredients")
            }
        }
        for meal in recipeViewModel.recipes{
            let mealIng = meal.ingredients.filter(){
                $0 != "Water" &&
                $0 != "Salt" &&
                $0 != "Boiling Water" &&
                $0 != "Cold Water" &&
                $0 != "" &&
                $0 != " "}
            
            let listSet = Set(mealIng)
            let findListSet = Set(checkedIngredients)
            let allElemsContained = listSet.isSubset(of: findListSet)
            
            if allElemsContained{
                availableRecipe.append(meal)
            }
        }
        
        return availableRecipe
    }
    
    
    func generateMoreBasedOnIngredients() -> [Recipe]{
        var availableRecipe : [Recipe] = []
        var checkedIngredients : [String] = []
        
        //get checked leftovers
        for i in fetchedLeftovers{
            let check = i.isChecked
            if check{
                checkedIngredients.append(i.ingredients ?? "Invalid Ingredients")
            }
        }
        let ingredientCount : Int = checkedIngredients.count
        
        //get additional ingredients
        for addIng in fetchedAddIngredient{
            checkedIngredients.append(addIng.title ?? "")
        }
        
        for meal in recipeViewModel.recipes{
            let mealIng = meal.ingredients.filter(){
                $0 != "Water" &&
                $0 != "Salt" &&
                $0 != "Boiling Water" &&
                $0 != "Cold Water" &&
                $0 != "" &&
                $0 != " "}
            
            let countIng = mealIng.count
            let listSet = Set(mealIng)
            let findListSet = Set(checkedIngredients)
            let allElemsContained = findListSet.isSubset(of: listSet)
            
            if allElemsContained && ingredientCount != countIng{
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
