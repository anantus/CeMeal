//
//  RecipeIngredientsView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 25/06/22.
//

import SwiftUI

struct RecipeIngredientsView: View {
    
    var title = ""
    var recipe:Recipe
    
    
    var body: some View {
        ScrollView {
            // Title
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.ui.title)
                .multilineTextAlignment(.trailing)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

            
            // Content
            if title == "Main"{
                ForEach((0...19), id: \.self){i in
                    if(recipe.ingredients[i] != ""){
                        Text("- \(recipe.measurements[i]) \(recipe.ingredients[i])")
                    }
                }
            }else{
                Text(recipe.instructions)
            }
            
        }
        .background(Color(UIColor.systemGray6))
    }
}

//struct RecipeIngredientsView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeIngredientsView(title: "Main", content: "- 1.4 kg / 3 pounds whole chicken, cut into pieces or chicken wings / drumsticks / boneless chicken thigh (choose from these based on your preference), rinsed\n- Abc")
//    }
//}
