//
//  IngredientListView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 22/06/22.
//

import SwiftUI

struct LeftoverListView: View {
    
    @Environment(\.managedObjectContext) private var viewContent
    @EnvironmentObject var leftoversViewModel:LeftoversViewModel
    @ObservedObject var leftover:Leftovers
    
    var body: some View {
        HStack {
                // Content
                VStack(alignment: .leading) {
                    if leftover.ingredients != nil{
                        // Title
                        Text(leftover.ingredients!)
                            .font(
                                .title3
                                    .weight(.semibold)
                            )
                            .foregroundColor(Date() < leftover.dateExpired! ? Color.ui.title : Color.ui.accent2)
                            .textCase(.uppercase)
                        
                        // Category
                        if let category = leftover.category {
                            Text(category)
                                .foregroundColor(.accentColor)
                                .font(.subheadline)
                        }

                        // Buy & expire dates
                        HStack {
                            
                            Image(systemName: "calendar")
                                .foregroundColor(.accentColor)
                                .font(.subheadline)
                            
                            Text(dateToString(leftover.dateCreated!))
                                .foregroundColor(.gray)
                            .font(.subheadline)
                            
                            Image(systemName: "calendar")
                                .foregroundColor(Color.ui.accent2)
                                .font(.subheadline)

                            Text(dateToString(leftover.dateExpired!))
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            
                        }
                        
                    }
                }
                .padding(.horizontal, 16)
        }
    }
}

//struct IngredientListView_Previews: PreviewProvider {
//    static var previews: some View {
//        LeftoverListView(leftover: Leftover(id: "123", title: "Chicken Breast", category: "Poultry", buyDate: Date(), expireDate: Date(), storage: "Fridge", isChecked: true))
//    }
//}
