//
//  ContentView.swift
//  Tutorial_iosapprentice
//
//  Created by Robin Lin on 2020-12-24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var alertIsVisible1: Bool = false
    @State var alertIsVisible2: Bool = false
    @State var alertIsVisible3: Bool = false
    @State var alertIsVisible4: Bool = false
    @State var target: Int = Int.random(in: 0..<3)
    @State var integer: Int = 0
    @State var equals: Bool = false
    var body: some View {
        if !equals {
            ZStack {
                Color.red.ignoresSafeArea()
                VStack {
                    Text("🔥: \(integer)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    // MARK: - Button 1
                    Button(action: {
                            integer += 1
                            self.alertIsVisible1 = true}) {
                        Text("⬆️").font(.largeTitle).fontWeight(.heavy).foregroundColor(Color.white).padding()
                    }
                    .alert(isPresented: self.$alertIsVisible1) {
                        Alert(title: Text("Added 1!"),
                              message: Text("You have added 1."),
                              dismissButton: .default(Text("Think you got it? Click 🍔.")))
                    }
                    // MARK: - Button 2
                    Button(action: {
                            integer -= 1
                            self.alertIsVisible2 = true}) {
                        Text("⬇️").font(.largeTitle).fontWeight(.heavy).foregroundColor(Color.white)
                            
                    }
                    .alert(isPresented: self.$alertIsVisible2) {
                        Alert(title: Text("Subtracted 1!"),
                              message: Text("You have subtracted 1."),
                              dismissButton: .default(Text("Think you got it? Click 🍔.")))
                    }
                    // MARK: - Button 3
                    Button(action: {
                            equals = target == integer
                    }) {
                        Text("🍔").font(.largeTitle).fontWeight(.heavy).foregroundColor(Color.white).padding()
                    }
                }
                // MARK: - Info Button
                Button(action: {
                        alertIsVisible3 = true
                }) {
                    Text("💡").font(.largeTitle).fontWeight(.heavy).foregroundColor(Color.white).padding()
                }.position(x: 50, y: 750)
                .alert(isPresented: self.$alertIsVisible3) {
                    Alert(title: Text("Game Instructions"),
                          message: Text("Click ⬆️ or ⬇️ to change your current guess. If you think you've got it, click 🍔."),
                          dismissButton: .default(Text("Start Guessing")))
                }
            }
        }
        else {
            ZStack {
                Color.blue.ignoresSafeArea()
                VStack {
                    Text("🔥: 💯")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer().frame(height: 200)
                    Text("You got it! 🎉🎉🎉")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Button(action: {
                            equals = false
                            target = Int.random(in: 0..<3)
                            integer = 0
                    }) {
                        Text("🔄").font(.largeTitle).fontWeight(.heavy)
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().preferredColorScheme(.dark)
        }
    }
}
