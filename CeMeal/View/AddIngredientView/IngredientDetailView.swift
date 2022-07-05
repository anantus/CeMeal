//
//  IngredientDetailView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 30/06/22.
//

import SwiftUI

struct IngredientDetailView: View {
    
    //    @Environment(\.isAddIngredientPresented) var isAddIngredientPresented
    @Environment(\.managedObjectContext) var viewContent
    @EnvironmentObject var leftoverVM:LeftoversViewModel
    
    @FetchRequest(entity: Leftovers.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: true)]) var fetchedLeftovers:FetchedResults<Leftovers>
    
    @Environment(\.presentationMode) var detailSheet
    @State private var checkedStorage = 0
    @State private var buyDate = Date()
    @State private var expireDate = Date()
    @State var isReminded = false
    @State var isEdit : Bool
    @State var leftover : Leftovers?
    
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
                            .foregroundColor(.accentColor)
                            .padding()
                        
                        VStack(alignment: .leading) {
                            Text(storage.uppercased())
                                .fontWeight(.semibold)
                                .foregroundColor(Color.ui.title)
                            
                            Text(storagePicker(index: index))
                                .foregroundColor(.accentColor)
                                .font(
                                    .system(.callout, design: .serif)
                                    .italic()
                                )
                        }
                    }
                    .onTapGesture {
                        checkedStorage = index
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
            
            .navigationTitle(ingredient.ingredientName)
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
                    Button(action:{
                        //TODO: Reminder berdasarkan pilihan remind nya
                        leftoverVM.ingredients = ingredient.ingredientName
                        leftoverVM.category = ingredient.category
                        leftoverVM.storage = storages[checkedStorage]
                        leftoverVM.dateCreated = buyDate
                        leftoverVM.dateExpired = expireDate
                        if isEdit{
                            leftoverVM.createLeftovers(context: viewContent)
                            leftoverVM.delete(ingredient: findLeftover(), context: viewContent)
                        }else{
                            leftoverVM.createLeftovers(context: viewContent)
                        }
                        detailSheet.wrappedValue.dismiss()
                    } , label: {
                        Text("Save")
                    })
                }
            }
        }
    }
    
    func findLeftover() -> Leftovers{
        var loFound : Leftovers?
        for i in fetchedLeftovers{
            if i.ingredients == ingredient.ingredientName{
                loFound = i
                return loFound!
            }
        }
        return loFound!
    }
    
    func storagePicker(index: Int) -> String {
        if index == 0{
            return  ingredient.cupboard
        }
        else if index == 1{
            return ingredient.fridge
        }
        return ingredient.freezer
    }
}

//struct IngredientDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let ing = IngredientViewModel().ingredients[0]
//        IngredientDetailView(ingredient: ing)
//    }
//}
