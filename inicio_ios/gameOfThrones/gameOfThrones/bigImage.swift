//
//  bigImage.swift
//  gameOfThrones
//
//  Created by MultiLab PRT 09 on 11/03/2025.
//

import SwiftUI

struct bigImage: View {
    var body: some View {
        
        //Zstack for the background
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            VStack {
                //image of the person
                Image("jon")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

#Preview {
    bigImage()
}
