//
//  ContentView.swift
//  WarCardGame
//
//  Created by MultiLab PRT 09 on 11/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    // variables for cards image
    @State var playerCard = "back"
    @State var cpuCard = "back"
    
    //variables for the scores
    @State var playerScore = 0
    @State var cpuScore = 0
    
    //for changing the backgroung
    @State var bg = 0
    @State var bgImage = "background-plain"
    
    //func for the button action
    func buttonDealClicked() {
        // randomaize card
        let rPC = Int.random(in: 2...14)
        let rCC = Int.random(in: 2...14)
        
        playerCard = "card" + String(rPC)
        cpuCard = "card" + String(rCC)
        
        if rPC > rCC {
            playerScore += 1
        }else if rCC > rPC {
            cpuScore += 1
        }
        
        
    }
    
    //func to change the background
    func changeBackground() {
        
        if bg < 4 {
            bg += 1
        }else {
            bg = 1
        }
        
        
        switch bg {
            case 1:
            bgImage = "background-cloth"
            break;
        case 2:
            bgImage = "background-plain"
            break;
        case 3:
            bgImage = "background-wood-cartoon"
            break;
        case 4:
            bgImage = "background-wood-grain"
            break;
            
        default:
            bgImage = "background-plain"
            break;
            
        }
        
        //backgroundList = [
        //    "cloth",
        //    "plain",
        //    "wood-cartoon",
        //    "wood-grain"
        //]
        
        //bgImage = "bacground-" + backgroundList.randomElement()!
        
        
    }
    
    var body: some View {
       //zstack para fundo
        ZStack {
            
            //image for background
            Image(bgImage)
                .resizable()
                .ignoresSafeArea()
            
            //vstack para o layout
            VStack {
                
                Spacer()
                
                HStack {
                    //btt to change the background image
                    Button {
                        changeBackground()
                    } label: {
                        Image("button")
                            .resizable()
                            .frame(width: 100, height: 50)
                            .padding()
                    }
                    
                    //logo
                    Image("logo")
                    
                    Spacer()
                }
                
                
                
                
                Spacer()
                
                //hstack para as cartas
                HStack {
                    Spacer()
                    //card 1
                    Image(playerCard)
                    
                    Spacer()
                    //card 2
                    Image(cpuCard)
                    
                    Spacer()
                }
                
                Spacer()
                
                //image for button
                Button {
                    buttonDealClicked()
                } label: {
                    Image("button")
                }
                
                Spacer()
                
                //hstack for results
                HStack {
                    Spacer()
                    //vstack for player and score
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom,10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    //vstack for ai and score
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom,10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                }.foregroundColor(.white)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
