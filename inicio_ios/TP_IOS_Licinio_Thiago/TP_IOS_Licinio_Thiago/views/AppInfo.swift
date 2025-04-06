//
//  AppInfo.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 27/03/2025.
//

import SwiftUI

struct AppInfo: View {
    
    // variables to recibe make a link to the main ones in the main view
    @Binding var showAboutUS: Bool
    @Binding var isDarkMode: Bool
    
    // variables for the pages
    @State var licinioPage = false
    @State var thiagoPage = false
    
    var body: some View {
        
        //vstack for the content
        VStack {
            Spacer()
            
            //title
            Text("About Us")
                .font(.largeTitle)
                .foregroundColor(.accent)
                .fontWeight(.bold)
            
            Spacer()
            
            // extras
            Text("Elementos inseridos:")
                .font(.title2)
                .foregroundColor(.accent)
                .fontWeight(.bold)
            
            Text("- Alert de confirmação de que o usuário deseja mesmo remover a/as tarefas listadas.\n- Alert de que um ou mais campos de preenchimento da funcionalidade Update estão vazios.\n- Possibilidade de escolher entre DarkMode e LightMode")
                .padding()
                .foregroundColor(.accent)
            
            Spacer()
            
            // developers
            
            Text("Desenvolvido por:")
            
            HStack {
                Spacer()
                // btt to open licion page
                Button {
                    licinioPage.toggle()
                }label: {
                    VStack {
                        Image("licinio")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(20)
                            .padding(10)
                            .shadow(color: .accent, radius: 5)
                        
                        Text("Licinio Sousa")
                    }
                    
                }
                
                Spacer()
                
                // btt to open thiago page
                Button {
                    thiagoPage.toggle()
                }label: {
                    VStack {
                        
                        Image("thiago")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(20)
                            .padding(10)
                            .shadow(color: .accent, radius: 5)
                        
                        Text("Thiago Bührer")
                    }
                    
                }
                Spacer()
            }

            
            Spacer()
            
            // hstack for the bottom menu
            HStack {
                Spacer()
                
                //btt to close the page
                Button {
                    showAboutUS.toggle()
                }label: {
                    Text("Close")
                }.font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColorText)
                    .frame(width: 150, height: 70)
                    .background(.accent)
                    .cornerRadius(20)
                
                Spacer()
                
                // btt to change dark/light mode
                Button {
                    isDarkMode.toggle()
                }label: {
                    Image(systemName: "lightbulb.circle")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .foregroundColor(.accent)
                        .fontWeight(.bold)
                        
                }
                
                Spacer()
            }
            
            
            
            // switch dark/light mode
        }.preferredColorScheme(isDarkMode ? .dark : .light)
            // call the licinio page
            .sheet(isPresented: $licinioPage){
                LicinioPage()
            }
            // call the thiago page
            .sheet(isPresented: $thiagoPage){
                ThiagoPage()
            }
    }
}

#Preview {
    @State var showAboutUS: Bool = false
    @State var isDarkMode: Bool = false
    
    AppInfo(showAboutUS: $showAboutUS, isDarkMode: $isDarkMode)
}
