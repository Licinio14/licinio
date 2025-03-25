//
//  CharDetail.swift
//  OinkBlinds
//
//  Created by MultiLab PRT 09 on 18/03/2025.
//

import SwiftUI

struct CharDetail: View {
    let character : PBCharacter
    var body: some View {
        VStack {
            ZStack {
                Image(character.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 400)
                    .offset(y: 50)
                    .clipped()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                
            }.padding()
            
            Text(character.name)
                .font(.title3)
                .fontWeight(.bold)
            
            Text(character.description)
                .padding()
                .multilineTextAlignment(.center)
            
            
        }
    }
}

#Preview {
    CharDetail(character: PBCharacterList().allcharacters[0])
        .preferredColorScheme(.dark)
}
