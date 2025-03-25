//
//  ContentView.swift
//  ex-04
//
//  Created by MultiLab PRT 09 on 10/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            ZStack{
                
                VStack (alignment: .leading, spacing: 20) {
                    
                    Image("porto")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(40)
                    // faz diferença a ordem em que se mete!
                        .padding()
                    
                    HStack {
                        Text("Porto")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                        
                        Spacer()
                        
                        VStack {
                            HStack {
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.leadinghalf.filled")
                            }.foregroundStyle(.yellow)
                            
                            
                            Text("423 reviews")
                                
                        }
                        
                        
                    }
                    
                    
                    
                    Text("Mais um texto sobre o Porto")

                    
                }
            }
            .padding()
            .background(
                Rectangle()
                    .foregroundStyle(.white)
                    .cornerRadius(15)
                    .shadow(radius: 15)
            ).padding()
            
            ZStack{
                
                VStack (alignment: .leading, spacing: 20) {
                    
                    Image("porto")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(40)
                    // faz diferença a ordem em que se mete!
                        .padding()
                    
                    HStack {
                        Text("Amarante")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                        
                        Spacer()
                        
                        VStack {
                            HStack {
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.leadinghalf.filled")
                                Image(systemName: "star")
                                Image(systemName: "star")
                            }.foregroundStyle(.yellow)
                            
                            
                            Text("423 reviews")
                                
                        }
                        
                        
                    }
                    
                    
                    
                    Text("Mais um texto sobre Amarante")

                    
                }
            }
            .padding()
            .background(
                Rectangle()
                    .foregroundStyle(.white)
                    .cornerRadius(15)
                    .shadow(radius: 15)
            ).padding()
        }
        
        
        
        
        
    }
}

#Preview {
    ContentView()
}
