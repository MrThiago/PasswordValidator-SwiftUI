//
//  ContentView.swift
//  Shared
//
//  Created by Thiago Gouvea on 29/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    enum PasswordStrength {
        case empty, weak, strong
    }
    
    @State var password: String = ""    
    
    func validatePassword(password: String) -> PasswordStrength {
        let count = password.count
        var containsUppercase = false
        var containsSymbol = false
        var containsNumber = false
        
        for char in password {
            if(char.isUppercase) {
                containsUppercase = true
            }
            if(char.isNumber){
                containsNumber = true
            }
            if(char.isSymbol){
                containsSymbol = true
            }
        }
            
        if(count == 0){
            return PasswordStrength.empty
        }
        else if(count > 8 && containsUppercase && containsSymbol && containsNumber){
            return PasswordStrength.strong
        } else {
            return PasswordStrength.weak
        }
    }

    func getColorForState(_ result: PasswordStrength) -> Color {
        switch result {
        case .empty:
            return Color.gray
        case .weak:
            return Color.red
        case .strong:
            return Color.green
        }
    }
    
    var body: some View {
        VStack {
            Text("Password Validator")
                .padding()
            
            TextField("Type your password", text: $password)
                .textFieldStyle(.roundedBorder)
                .frame(width: 250)
                .accessibilityIdentifier("password")
            
            let result = validatePassword(password: password)
            let resultText = "\(result)"
            let color = getColorForState(result)
            
            Text(resultText.capitalized)
                .foregroundColor(color)
                .font(.system(size: 30))
                .padding()
                .accessibilityIdentifier("result")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
