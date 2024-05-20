//
//  Onboarding.swift
//  Little Lemon
//
//  Created by carlos orellana on 5/18/24.
//

import SwiftUI

var KeyFirstName: String = "";
var KeyLastName: String = "";
var KeyEmail: String = "";
let KeyIsLoggedIn = ""

struct Onboarding: View {
    @State var firstName: String = "";
    @State var lastName: String = "";
    @State var email: String = "";
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    Text("Home").font(.title)
                    EmptyView();
                }
                TextField("First Name", text: $firstName).multilineTextAlignment(.center);
                TextField("Last Name", text: $lastName).multilineTextAlignment(.center);
                TextField("Email", text: $email).multilineTextAlignment(.center);
                
                Button("Register"){
                    if (!firstName.isEmpty || !lastName.isEmpty || !email.isEmpty) {
                        UserDefaults.standard.setValue(firstName, forKey: KeyFirstName)
                        UserDefaults.standard.setValue(lastName, forKey: KeyLastName)
                        UserDefaults.standard.setValue(email, forKey: KeyEmail)
                        UserDefaults.standard.setValue(true, forKey: KeyIsLoggedIn)
                        isLoggedIn = true;
                        
                    } else {
                        isLoggedIn = false;
                    }
                    
                };
                
            }
            onAppear() {
                if (UserDefaults.standard.bool(forKey: KeyIsLoggedIn)) {
                    isLoggedIn = true
                }
            }
        }
    }
}

//#Preview {
//    Onboarding()
//}
