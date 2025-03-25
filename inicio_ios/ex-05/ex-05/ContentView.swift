//
//  ContentView.swift
//  ex-05
//
//  Created by MultiLab PRT 09 on 10/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("MyStore")
                .font(.largeTitle)
                .bold()
            
            Spacer()
            
            HStack {
                Image("cola")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("sumol")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            Spacer()
            
            HStack {
                Image("guarana")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("fanta")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            Spacer()
            
            Text("Developed by Licinio")
                .bold()
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
