//
//  AppInfo.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 27/03/2025.
//

import SwiftUI

struct AppInfo: View {
    
    @Binding var showAboutUS: Bool
    @Binding var isDarkMode: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            
            
            Spacer()
            
            HStack {
                Spacer()
                
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
            
            
            
            
        }.preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    @State var showAboutUS: Bool = false
    @State var isDarkMode: Bool = false
    
    AppInfo(showAboutUS: $showAboutUS, isDarkMode: $isDarkMode)
}
