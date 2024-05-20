//
//  UserProfile.swift
//  Little Lemon
//
//  Created by carlos orellana on 5/18/24.
//

import SwiftUI

struct UserProfile: View {
    let firstName = UserDefaults.standard.string(forKey: KeyFirstName)
    let lastName = UserDefaults.standard.string(forKey: KeyLastName)
    let email = UserDefaults.standard.string(forKey: KeyEmail)
    
    @Environment(\.presentationMode) var presentation

    var body: some View {
        VStack() {
            Text("Personal Information")
            
            Image("profile-image-placeholder").resizable()
            
            Text(firstName ?? "");
            Text(lastName ?? "");
            Text(email ?? "");
            
            Button("Logout") {
                UserDefaults.standard.setValue(false , forKey: KeyIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            Spacer();
        }
    }
}
//
//#Preview {
//    UserProfile()
//}
