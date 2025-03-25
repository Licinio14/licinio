//
//  ContentView.swift
//  ex-01
//
//  Created by MultiLab PRT 09 on 10/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color.blue.ignoresSafeArea()
            
            VStack  {
                Text("Linda cidade do Porto")
                    .foregroundColor(.green)
                    .bold()
                    .font(.largeTitle)
                    
                Image("porto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
                Text("Linda vista da baixa do Porto. Cidade mais bonita de Portugal.")
                    .padding(.horizontal, 20)
                
            }
        }
    }
}

#Preview {
    ContentView()
}
