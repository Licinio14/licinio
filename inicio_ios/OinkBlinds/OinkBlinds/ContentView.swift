//
//  ContentView.swift
//  OinkBlinds
//
//  Created by MultiLab PRT 09 on 17/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    let listCharacters = PBCharacterList().allcharacters
    
    var body: some View {
        
        NavigationStack {
            List(listCharacters) { character in
                
                NavigationLink {
                    CharDetail(character: character)
                }label: {
                    HStack {
                        Image(character.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)
                        
                        
                        Text(character.name)
                            .fontWeight(.bold)
                    }
                }
                
                
                
                
                
            }.navigationTitle("Peaky Blinders")
        }.preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
