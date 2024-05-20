//
//  Home.swift
//  Little Lemon
//
//  Created by carlos orellana on 5/18/24.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared
    @State var searchText: String = ""

    var body: some View {
        TabView {
            Menu(searchText: searchText).tabItem({
                Label("Menu", systemImage: "list.dash" )
            })
            .environment(\.managedObjectContext, persistence.container.viewContext)
            UserProfile().tabItem({
                Label("Profile", systemImage: "square.and.pencil")
                    .navigationBarBackButtonHidden(true);
            })
        }

    }
}

//#Preview {
//    Home()
//}
