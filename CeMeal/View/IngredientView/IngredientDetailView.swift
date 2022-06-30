//
//  IngredientDetailView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 30/06/22.
//

import SwiftUI

struct IngredientDetailView: View {
    
//    @Environment(\.isAddIngredientPresented) var isAddIngredientPresented
    @Environment(\.presentationMode) var detailSheet
    @State private var checkedStorage = 0
    @State private var buyDate = Date()
    @State private var expireDate = Date()
    @State var isReminded = false
    
    var ingredient: Ingredient
    var storages = ["Cupboard", "Fridge", "Freezer"]
    
    var body: some View {
        NavigationView {
            List() {
                // MARK: Category
                HStack {
                    Text("Category")
                    Spacer()
                    Text(ingredient.category)
                        .foregroundColor(.gray)
                }
                
                // MARK: Stored
                Text("Stored At")
                ForEach(Array(storages.enumerated()), id: \.offset) { index, storage in
                    HStack {
                        Image(systemName: checkedStorage == index ? "checkmark.square.fill" : "square")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .onTapGesture {
                                checkedStorage = index
                            }
                            .foregroundColor(.accentColor)
                            .padding()
                        
                        VStack(alignment: .leading) {
                            Text(storage.uppercased())
                                .fontWeight(.semibold)
                                .foregroundColor(Color.ui.title)
                            
                            Text("1-3 months")
                                .foregroundColor(.accentColor)
                                .font(
                                    .system(.callout, design: .serif)
                                    .italic()
                                )
                        }
                    }
                }
                
                // MARK: Buy date
                DatePicker("Buy Date", selection: $buyDate, displayedComponents: [.date])
                
                // MARK: Expire date
                DatePicker("Expire Date", selection: $expireDate, displayedComponents: [.date])
                    .colorMultiply(.red)
                
                // MARK: Remind me
                Toggle("Remind Me", isOn: $isReminded)
            }
            .listStyle(.plain)
            
            .navigationTitle(ingredient.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        detailSheet.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        detailSheet.wrappedValue.dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}

struct IngredientDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientDetailView(ingredient: Ingredient(id: "0", title: "Empty", category: "Unknown", expireDay: [1], shelfLife: ["a": "b"]))
    }
}
