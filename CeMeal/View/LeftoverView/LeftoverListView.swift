//
//  IngredientListView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 22/06/22.
//

import SwiftUI

struct LeftoverListView: View {
    
    @Environment(\.managedObjectContext) private var viewContent
    @EnvironmentObject var leftoversViewModel:LeftoverViewModel
    @ObservedObject var leftover:Leftovers
    
    var body: some View {
        HStack {
            // Checkbox
            Image(systemName: leftover.isChecked ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    withAnimation(.easeOut) {
//                        leftoversViewModel.leftoverIsChecked(leftover: leftover)
                        //toggle leftover
                        leftover.isChecked.toggle()
                    }
                }
                .foregroundColor(.accentColor)
            
            // Content
            VStack(alignment: .leading) {
                
                // Title
                Text(leftover.ingredients!)
                    .font(
                        .title3
                        .weight(.semibold)
                    )
                    .foregroundColor(Color.ui.title)
                    .textCase(.uppercase)
                
                // Category
                Text(leftover.category ?? "no category")
                    .foregroundColor(.accentColor)
                    .font(
                        .system(.callout, design: .serif)
                        .italic()
                    )
                
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.accentColor)
                        .font(.subheadline)

                    Text(dateToString(leftover.dateCreated!))
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    
                    Image(systemName: "plus.square.fill.on.square.fill")
                        .foregroundColor(Color.ui.accent2)
                        .font(.subheadline)

                    Text(dateToString(leftover.dateExpired!))
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                .padding(.top, 1)
                
            }
            .padding(.horizontal, 16)
            
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

//struct IngredientListView_Previews: PreviewProvider {
//    static var previews: some View {
//        LeftoverListView(leftover: Leftover(id: "123", title: "Chicken Breast", category: "Poultry", buyDate: Date(), expireDate: Date(), storage: "Fridge", isChecked: true))
//    }
//}
