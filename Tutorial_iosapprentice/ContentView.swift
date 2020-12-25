//
//  ContentView.swift
//  Tutorial_iosapprentice
//
//  Created by Robin Lin on 2020-12-24.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible1: Bool = false
    @State var alertIsVisible2: Bool = false
    @State var alertIsVisible3: Bool = false
    @State var target: Int = 10
    @State var integer: Int = 0
    var body: some View {
        return VStack {
            Text("The current number is: \(integer)")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.green)
                .padding()
            // MARK: - Button 1
            Button(action: {
                    integer += 1
                    self.alertIsVisible1 = true}) {
                Text("Add").padding()
            }
            .alert(isPresented: self.$alertIsVisible1) {
                Alert(title: Text("Added 1!"),
                      message: Text("You have added 1."),
                      dismissButton: .default(Text("Go back.")))
            }
            
            // MARK: - Button 2
            
            Button(action: {
                    integer -= 1
                    self.alertIsVisible2 = true}) {
                    Text("Subtract").padding()
                    
            }
            .alert(isPresented: self.$alertIsVisible2) {
                Alert(title: Text("Subtracted 1"),
                      message: Text("You have subtracted 1"),
                      dismissButton: .default(Text("Go back.")))
            }
            
            // MARK: - Button 3
            Button(action: {
                    self.alertIsVisible3 = true}) {
                    Text("Check Equality").padding()
            }
            .alert(isPresented: self.$alertIsVisible3) {
                Alert(title: Text("Checking if equal to \(target)"),
                      message: Text("\(String(target == integer))".capitalized),
                      dismissButton: .default(Text("Go back.")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
