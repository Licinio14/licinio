//
//  ContentView.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 25/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    let taskList = TaskList().allTasks
    let imgList = ImgList().allImgs
    let catList = CategoryList().allcats
    
    @State var addClicked = false
    
    var body: some View {
        ZStack{
            
            //content
            VStack{
                
                //task list
                NavigationStack {
                    List(taskList) { task in
                        
                        NavigationLink {
                            TaskDetailsView(task: task)
                        }label: {
                            HStack {
                                Image(systemName: "\(imgList[task.image].name)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .shadow(color: .black, radius: 1)
                                    .padding(10)
                                    .foregroundColor(.black)
                                
                                
                                VStack (alignment: .leading) {
                                    Text(task.name)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        
                                    
                                    Text(catList[task.category].name)
                                    
                                    
                                }.foregroundColor(.black)
                                    
                            }
                        }.background(Color.white)
                            .cornerRadius(20)
                        
                        
                    }.navigationTitle("ToDo List")
                        
                }
                
                //btts
                
                    HStack {
                        Button {
                            addClicked.toggle()
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
                            Text("About Us")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(15)
                                .background(.blue)
                                .cornerRadius(20)
                                
                        }
                    }.padding(.top,20)

                
                
            }
        }.preferredColorScheme(.dark)
            .sheet(isPresented: $addClicked){
                addTaskView()
            }
    }
}

#Preview {
    ContentView()
}
