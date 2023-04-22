//
//  ContentView.swift
//  TheTrafficLight
//
//  Created by User on 20.04.2023.
//

import SwiftUI


struct ContentView: View {
    
    @State private var redLight = 0.2
    @State private var yellowLight = 0.2
    @State private var greenLight = 0.2
    
    var body: some View {
    
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color(red: 255, green: 0, blue: 0,opacity: redLight))
                    .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.white, lineWidth: 6))
                    .background(Color.white).cornerRadius(100)
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color(red: 255, green: 255, blue: 0, opacity: yellowLight))
                    .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.white, lineWidth: 6))
                    .background(Color.white).cornerRadius(100)
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color(red: 0, green: 255, blue:  0, opacity: greenLight))
                    .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.white, lineWidth: 6))
                    .background(Color.white).cornerRadius(100)
                
                Spacer()
                    .foregroundColor(.white)
                
                Button(action: {changeColor()}, label: {
                    if redLight == 1 || yellowLight == 1 || greenLight == 1 {
                        Text("NEXT")
                    } else {
                        Text("START")
                    }
                }
                )}
            .font(.system(size: 30, weight: .black, design: .rounded))
            .foregroundColor(.orange)
            .padding(.top, 16)
        }
    }
    
    private func changeColor() {
        if redLight < 1 && yellowLight < 1 &&
            greenLight < 1 {
            redLight = 1
        } else if redLight == 1 {
            redLight = 0.2
            yellowLight = 1
        } else if yellowLight == 1 {
            yellowLight = 0.2
            greenLight = 1
        }else if  greenLight == 1 {
            redLight = 1
            greenLight = 0.2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
