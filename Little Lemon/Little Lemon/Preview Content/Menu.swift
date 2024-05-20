//
//  Menu.swift
//  Little Lemon
//
//  Created by carlos orellana on 5/18/24.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText: String;
    
    func getMenuData(){
        PersistenceController.shared.clear();
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        let request = URLRequest(url: url);
        let task = URLSession.shared.dataTask(with: request) {data , response, error  in
            if let data = data {
                let  menuItems = try? JSONDecoder().decode(MenuList.self, from: data)
                
                for item in menuItems!.menu {
                   let dish = Dish(context: viewContext)
                    dish.title = item.title
                    dish.image = item.image
                    dish.price = item.price
                }
                try? viewContext.save()
            }
        }
        task.resume();
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return  [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            NSPredicate(value: true)
        }
        else {
            NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
   
    
    var body: some View {
        
        VStack() {
            Text("Little Lemon");
            Text("Chicago");
            Text("The Best Bistro Restaurant");
            
            TextField("Search Menu", text: $searchText )
            
        
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {(dishes: [Dish]) in
                List {
//                    ForEach(dishes, id: \.self) { dish in
//                        var url: String;
//                       HStack {
//                           var url = URL(string: "\(dish.image)")!
//                           Text("\(dish.title): " , "\(dish.price)")
//                           AsyncImage(url: url).frame(width: 200, height: 200)
//                       }
//                   }
               }
            }
        
      
        .onAppear(){
                getMenuData();
        }
        }

    }
}
//
//#Preview {
//    Menu()
//}
