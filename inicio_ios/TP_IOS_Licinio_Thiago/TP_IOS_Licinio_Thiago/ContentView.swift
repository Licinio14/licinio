//
//  ContentView.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 25/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            //bacgound
            
            //content
            VStack{
                Text("ToDo List")
                    .font(.title)
                
                //task list
                
                //btts
                
                VStack {
                    HStack {
                        Button {
                            
                        }label: {
                            Text("Add")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(15)
                                .background(.blue)
                                .cornerRadius(20)
                                
                        }
                        
                        Button {
                            
                        }label: {
                            Text("Edit/Remove")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(15)
                                .background(.blue)
                                .cornerRadius(20)
                                
                        }
                    }
                    
                    HStack {
                        Button {
                            
                        }label: {
                            Text("About Us")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(15)
                                .background(.blue)
                                .cornerRadius(20)
                                
                        }.padding(.top,20)
                    }
                }
                
                
            }
        }.preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
