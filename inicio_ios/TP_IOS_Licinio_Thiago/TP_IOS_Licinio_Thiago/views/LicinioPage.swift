//
//  LicinioPage.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 06/04/2025.
//

import SwiftUI

struct LicinioPage: View {
    
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
                Text("Licínio Sousa")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
                
                //image
                Image("licinio")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(20)
                    .padding(10)
                    .shadow(color: .white, radius: 5)
                
                Spacer()
                        
                // self-evaluation
                Text("O projeto foi executado com atenção nas funcionalidades-chave, priorizando um desempenho eficiente e uma interface mais amigável. Todos os requisitos foram atendidos e ajustados conforme o esperado, garantindo uma experiência fluida. Acredito que um 17 é merecido.")
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
    LicinioPage()
}
