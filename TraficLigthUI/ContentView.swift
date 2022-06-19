//
//  ContentView.swift
//  TraficLigthUI
//
//  Created by Павел on 19.06.2022.
//

import SwiftUI

struct Lamp: Hashable {
    let color: Color
    var state: Bool = false
    var alfa: Double {
        state ? 1 : 0.4
    }
}

struct ContentView: View {
    
    @State var lamps  = [
        Lamp(color: .red),
        Lamp(color: .yellow),
        Lamp(color: .green)
    ]
    
    @State var currentLamp: Int?
    @State var buttonName = "START"
    
    var body: some View {
        ZStack {
            
            Color(UIColor.black)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ForEach(lamps, id: \.self) {lamp in
                    Circle()
                        .foregroundColor(lamp.color)
                        .overlay(Circle().stroke()).foregroundColor(.white)
                        .frame(width: 100, height: 100)
                        .opacity(lamp.alfa)
                }
                Spacer()
                Button(action: {buttonAction()}, label: {
                    Text(buttonName)
                        .frame(width: 150)
                        .font(.title)
                        .foregroundColor(.white)
                })
                    .background(Color(UIColor.systemBlue))
                    .buttonStyle(.bordered)
                    .cornerRadius(15)
            }.padding()
        }
    }
    
    private func buttonAction() {
        
        if let numberLamp = currentLamp {
            lamps[numberLamp].state = false
        }
        
        switch currentLamp {
        case nil:
            buttonName = "NEXT"
            currentLamp = 0
        case 2:
            currentLamp = 0
        case 0:
            currentLamp = 1
        default:
            currentLamp = 2
        }
        guard let currentLamp = currentLamp else {return}
        
        lamps[currentLamp].state = true

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
