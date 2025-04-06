//
//  ThiagoPage.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 06/04/2025.
//

import SwiftUI

struct ThiagoPage: View {
    
    var body: some View {

            ZStack {
                
                // background image
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    Spacer()
                    
                    //name
                    Text("Thiago Bührer")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    //image
                    Image("thiago")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .cornerRadius(20)
                        .padding(10)
                        .shadow(color: .white, radius: 5)
                    
                    Spacer()
                            
                    // self-evaluation
                    Text("O trabalho foi desenvolvido de forma eficiente e no tempo esperado. As funcionalidades estão implementadas conforme o solicitado, com foco na design simples e mais intuitivo. Considerando isso, acho que uma nota 16 me parece razoável.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .bold()
                        .padding(.horizontal, 30)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                }
                
                
            }

    }
}

#Preview {
    ThiagoPage()
}
