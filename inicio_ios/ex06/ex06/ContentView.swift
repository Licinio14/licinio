//
//  ContentView.swift
//  ex06
//
//  Created by MultiLab PRT 09 on 11/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State var showSheet = false
    
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Button {
                    showSheet.toggle()
                } label: {
                    Image("imgPerfil")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                }
                
                
                Text("Licinio Sousa")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }.sheet(isPresented: $showSheet){
            SwiftUIView()
        }
    }
}

#Preview {
    ContentView()
}
