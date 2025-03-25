//
//  ContentView.swift
//  gameOfThrones
//
//  Created by MultiLab PRT 09 on 11/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    //text of the person
    @State var description: String = "Jon Snow, born Aegon Targaryen, is the son of Lyanna Stark and Rhaegar Targaryen, the late Prince of Dragonstone. From infancy, Jon is presented as the bastard son of Lord Eddard Stark, Lyanna's brother, and raised alongside Eddard's lawful children at Winterfell. Jon's true parentage is kept secret from everyone, including Jon himself, in order to protect him from those that sought the complete annihilation of House Targaryen."
    
    @State var imageClicked = false
    
    
    var body: some View {
        
        //zstack for the bacground
        ZStack {
            //bacground Image
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            //vstack for the content
            VStack {
                
                //button for the image
                Button {
                    imageClicked.toggle()
                } label: {
                    //image of the person
                    Image("jon")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .scaledToFit()
                        .cornerRadius(100)
                }
                
                
                
                Text("Jon Snow")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .shadow(radius: 10)

                
                
                Text(description)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.title3)
                    .shadow(radius: 10)
                    .padding()
            
            
                    
                
            }.padding()
        }
        .sheet(isPresented: $imageClicked){
            bigImage()
        }
    }
}

#Preview {
    ContentView()
}
