//
//  ContentView.swift
//  primeiraAPPIOS
//
//  Created by MultiLab PRT 09 on 10/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Color(.blue)
                .ignoresSafeArea()
            
            VStack {
                
                Text("Cidade do Porto")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Image("porto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(40)
                // faz diferença a ordem em que se mete!
                    .padding()
                
                
                Text("Porto, Portugal")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                HStack {
                    Text("Clima: ")
                    Text("Temporal")
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
