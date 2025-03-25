//
//  ContentView.swift
//  ex-02
//
//  Created by MultiLab PRT 09 on 10/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color(.green)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    Text("Home: ")
                    
                    Text("0")
                    
                }
                
                Divider()
                
                Spacer()
                
                
                Image("football")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                Divider()
                
                HStack {
                    Text("Way: ")
                    Text("0")
                    
                }
            }.font(.largeTitle)
                .bold()
        }
    }
}

#Preview {
    ContentView()
}
