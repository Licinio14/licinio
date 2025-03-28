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
    @State var showAboutUS = false
    @State var isDarkMode = false
    
    @State private var showAlertDeleteAll = false
    
    var body: some View {
        

        ZStack{
            
            
            
            //content
            VStack{
                
                
                //task list
                NavigationStack {
                    
                    HStack {
                        
                    
                        Image(systemName: "list.bullet.clipboard")
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                        
                        Text("ToDo List")
                            .font(.largeTitle)
                            .bold()
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        
                    }.padding(.horizontal,40)
                    
                    
                    
                    List(taskList) { task in
                        
                        NavigationLink {
                            TaskDetailsView(catList: $catList, imgList: $imgList, taskList: $taskList,task: task)
                        }label: {
                            HStack {
                                Image(imgList[task.image].name)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(20)
                                    .shadow(color: .black, radius: 5)
                                    
                            
                                Spacer()
                                
                                VStack (alignment: .leading) {
                                    Text(task.name)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        
                                    
                                    Text(catList[task.category].name)
                                    
                                    
                                }.foregroundColor(.accentColorText)
                                
                                Spacer()
                                    
                            }.padding()
                        }.background(Color.accentColor)
                            .cornerRadius(20)
                        
                        
                    }
                        
                }

                
                
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
                            showAboutUS.toggle()
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
                        Spacer()
                    }.padding(.top,20)

                
                
            }
            
            
        }.preferredColorScheme(isDarkMode ? .dark : .light)
            .sheet(isPresented: $addClicked){
                addTaskView(catList: $catList, imgList: $imgList, taskList: $taskList, addClicked: $addClicked, isDarkMode: $isDarkMode)
            }
            .fullScreenCover(isPresented: $showAboutUS) {
                AppInfo(showAboutUS: $showAboutUS, isDarkMode: $isDarkMode)
            }
    }
}

#Preview {
    ContentView()
}
