//
//  TaskDetailsView.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 25/03/2025.
//

import SwiftUI

struct TaskDetailsView: View {
    
    let task : Task
    
    let imgList = ImgList().allImgs
    let catList = CategoryList().allcats
    
    @State var name : String = ""
    @State var category : String = ""
    @State var description : String = ""
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            HStack {
                Image(systemName: "\(imgList[task.image].name)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .shadow(color: .white, radius: 1)
                    .padding(.leading,40)
                
                TextField(task.name, text: $name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
            }
            
            HStack {
                Text("Category: ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.leading,40)
                
                TextField(catList[task.category].name, text: $category)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                
            }.padding(.top, 30)
            
            TextField(task.description, text: $description)
                .fontWeight(.bold)
                .padding(.top, 10)
                .padding(.leading,40)
            
            HStack {
                Button{
                    
                }label: {
                    Text("Delet Task")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(15)
                        .background(.blue)
                        .cornerRadius(20)
                        
                }
                
                Button{
                    
                }label: {
                    Text("Update Task")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(15)
                        .background(.blue)
                        .cornerRadius(20)
                        
                }
            }.padding(.top,50)
        }
        
        
        
    }
}

#Preview {
    TaskDetailsView(task: TaskList().allTasks[0])
        .preferredColorScheme(.dark)
        
}
