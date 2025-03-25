//
//  ContentView.swift
//  redANDblack
//
//  Created by MultiLab PRT 09 on 11/03/2025.
//

import SwiftUI

struct ContentView: View {
    //global variables
    @State var cardImage = "back"
    @State var scoreWin = 0
    @State var scoreLose = 0
    @State var consecutiveWins = 0
    @State var maxConsecutiveWins = 0
    @State var consecutiveLoses = 0
    @State var maxConsecutiveLoses = 0
    
    
    //func for the game logic
    // id == 1 red
    // id == 2 black
    func randomCard(id : Int){
        let card = changeCard()
        
        if id == 1 {
            if card == 12 {
                scoreWin += 1
                consecutiveWins += 1
                consecutiveLoses = 0
            }else if card == 11 {
                scoreLose += 1
                consecutiveWins = 0
                consecutiveLoses += 1
            }
        }else if id == 2 {
            if card == 11 {
                scoreWin += 1
                consecutiveWins += 1
                consecutiveLoses = 0
            }else if card == 12 {
                scoreLose += 1
                consecutiveWins = 0
                consecutiveLoses += 1
            }
        }
        
        if consecutiveWins > maxConsecutiveWins {
            maxConsecutiveWins = consecutiveWins
        }
        
        if consecutiveLoses > maxConsecutiveLoses {
            maxConsecutiveLoses = consecutiveLoses
        }
    }
    
    //func to change the card
    // 11 black
    // 12 red
    func changeCard() -> Int{
        let rnd = Int.random(in: 11...12)
        
        switch rnd {
            case 11:
                cardImage = "card11"
                break
            case 12:
                cardImage = "card12"
                break
            default:
                break
        }
        
        return rnd
    }
    
    //func to reset the max counter
    func resetCount(){
        maxConsecutiveWins = 0
        maxConsecutiveLoses = 0
    }
    var body: some View {
        //zstack for the background
        ZStack {
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            
            //vstack for the content
            VStack {
                Spacer()
                
                //tittle
                Text("Black and White")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                //card
                Image(cardImage)
                    .resizable()
                    .frame(width: 200, height: 300)
                
                Spacer()
                
                //hstack for the buttons
                HStack {
                    //red button
                    Button {
                        randomCard(id: 1)
                    } label: {
                        Text("Red")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(20)
                    }.background(Color.red)
                        .cornerRadius(30)
                    
                    
                    //black button
                    Button {
                        randomCard(id: 2)
                    } label: {
                        Text("Black")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(20)
                    }.background(Color.black)
                        .cornerRadius(30)
                }
                
                Spacer()
                
                //score board
                HStack {
                    Spacer()
                    //wins
                    VStack {
                        Text("Wins:")
                            .font(.title)
                            .foregroundColor(.white)
                        Text(String(scoreWin))
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    //loses
                    VStack {
                        Text("Loses:")
                            .font(.title)
                            .foregroundColor(.white)
                        Text(String(scoreLose))
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                Text("Consecutive Wins: \(maxConsecutiveWins)")
                    .foregroundColor(.white)
                
                Text("Consecutive Loses: \(maxConsecutiveLoses)")
                    .foregroundColor(.white)
                
                Spacer()
                
                Button {
                    resetCount()
                } label: {
                    Text("Reset counter")
                        .foregroundColor(.white)
                        .padding(20)
                        .fontWeight(.bold)
                }.background(.blue)
                    .cornerRadius(30)
                
                
                    
            }
            
        }
    }
}

#Preview {
    ContentView()
}
