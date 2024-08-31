//
//  LoginView.swift
//  Auth_Login
//
//  Created by Rishit Butola on 27/08/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email:String = ""
    @State private var password:String = ""
    
    private func isValidPassword(_ password:String)->Bool{
        //should be min 6 characters long
        //min 1 uppercase letter
        //min one special character
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
        
        
    }
    
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Welcome Back!")
                        .font(.largeTitle)
                        .bold()
                    
                    
                    Spacer()
        
                }
                .padding()
                .padding(.top)
                
                Spacer()
                
                HStack{
                    Image(systemName: "mail")
                    TextField("Email",text: $email)
                    
                     Spacer()
                    
                    if (email.count != 0){
                        Image(systemName: email.isValidEmail() ? "checkmark":"xmark")
                            .fontWeight(.bold)
                            .foregroundColor(email.isValidEmail() ? .green : .red)

                        
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius:20)
                        .stroke(lineWidth: 3.0)
                        .foregroundColor(.black)
                    )
                .padding()
                
                HStack{
                    Image(systemName: "lock")
                    SecureField   ("Password",text: $password)
                    
                     Spacer()
                    
                    if (password.count != 0){
                        Image(systemName:isValidPassword(password) ? "checkmark":"xmark")
                            .fontWeight(.bold)
                            .foregroundColor(isValidPassword(password ) ? .green : .red)
                        
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius:20)
                        .stroke(lineWidth: 3.0)
                        .foregroundColor(.black)
                    )
                .padding()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                    Text("Don't have an Acount?")
                        .bold()
                }
                Spacer()
                Spacer()
                
                  
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                        Text("Sign In")
                            .bold()
                    }
                
                
         
                
            }
           
            
            
        
        }
    }
}

#Preview {
    LoginView()
}
