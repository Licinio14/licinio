//
//  ContentView.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 25/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    

    @State var taskList = TaskList().allTasks
    @State var imgList = ImgList().allImgs
    @State var catList = CategoryList().allcats
    
    @State var addClicked = false
    
    @State private var showAlertDeleteAll = false
    
    var body: some View {
        ZStack{
            
            
            
            //content
            VStack{
                
                
                //task list
                NavigationStack {
                    List(taskList) { task in
                        
                        NavigationLink {
                            TaskDetailsView(catList: $catList, imgList: $imgList, taskList: $taskList,task: task)
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
                    .toolbar {
                        // Adiciona o ícone na parte da direita da Navigation Bar
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Image(systemName: "list.bullet.clipboard")  // SF Symbol como ícone
                                .foregroundColor(.white) // Altere a cor do ícone
                                .padding()
                        }
                    }
                        
                }

                
                //btts
                
                    HStack {
                        
                        Spacer()
                        Spacer()
                        Button {
                            addClicked.toggle()
                        }label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 40,height: 40)
                                .foregroundColor(.green)
                                .fontWeight(.bold)
                                
                        }
                        
                        Spacer()

                        Button {
                            
                        }label: {
                            Image(systemName: "info.circle")
                                .resizable()
                                .frame(width: 40,height: 40)
                                .foregroundColor(.blue)
                                .fontWeight(.bold)
                                
                        }
                        
                        Spacer()
                        
                        Button {
                            showAlertDeleteAll = true
                        }label: {
                            Image(systemName: "trash.circle")
                                .resizable()
                                .frame(width: 40,height: 40)
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        }.alert(isPresented: $showAlertDeleteAll) {
                            Alert(
                                title: Text("Alert"),
                                message: Text("You really want to delete all tasks?"),
                                primaryButton: .destructive(Text("Confirmar")) {
                                    taskList.removeAll()
                                },
                                secondaryButton: .cancel()
                            )
                        }
                        
                        Spacer()
                        Spacer()
                    }.padding(.top,20)

                
                
            }
        }.preferredColorScheme(.dark)
            .sheet(isPresented: $addClicked){
                addTaskView(catList: $catList, imgList: $imgList, taskList: $taskList, addClicked: $addClicked)
            }
    }
}

#Preview {
    ContentView()
}
