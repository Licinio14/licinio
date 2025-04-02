//
//  ContentView.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 25/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    
    //variables to use in the intere program
    @State var taskList = TaskList().allTasks
    @State var imgList = ImgList().allImgs
    @State var catList = CategoryList().allcats
    
    // variables for the pages
    @State var addClicked = false
    @State var showAboutUS = false
    @State var isDarkMode = false
    
    // variable for the delete all alert
    @State private var showAlertDeleteAll = false
    
    var body: some View {
            
            //content
            VStack{
                
                
                //task list
                NavigationStack {
                    
                    // image and title of the list
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
                    
                    
                    // list of the task array
                    List(taskList) { task in
                        
                        NavigationLink {
                            // to open and send the variables for the detail view
                            TaskDetailsView(catList: $catList, imgList: $imgList, taskList: $taskList,task: task)
                        }label: {
                            
                            // disign of the list
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

                
                    // buttons of the botton menu
                    HStack {
                        
                        Spacer()
                        Spacer()
                        Button {
                            // call the view to add tasks
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
                            // call the view about us
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
                            // call the alert to confirm the delete of all task
                            showAlertDeleteAll = true
                        }label: {
                            Image(systemName: "trash.circle")
                                .resizable()
                                .frame(width: 40,height: 40)
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        // alert to confirm
                        }.alert(isPresented: $showAlertDeleteAll) {
                            Alert(
                                title: Text("Alert"),
                                message: Text("You really want to delete all tasks?"),
                                // if the user select the confirm button, clear the task array
                                primaryButton: .destructive(Text("Confirm")) {
                                    taskList.removeAll()
                                },
                                secondaryButton: .cancel()
                            )
                        }
                        
                        Spacer()
                        
                        Button {
                            // to change between dark and light theme
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

                
            // to change between dark and light theme
            }.preferredColorScheme(isDarkMode ? .dark : .light)
                // to call the sheet to add tasks
                .sheet(isPresented: $addClicked){
                    addTaskView(catList: $catList, imgList: $imgList, taskList: $taskList, addClicked: $addClicked, isDarkMode: $isDarkMode)
                }
                // to cal the view about us
                .fullScreenCover(isPresented: $showAboutUS) {
                    AppInfo(showAboutUS: $showAboutUS, isDarkMode: $isDarkMode)
                }
    }
}

#Preview {
    ContentView()
}
