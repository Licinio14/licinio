//
//  TaskDetailsView.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 25/03/2025.
//

import SwiftUI

struct TaskDetailsView: View {
    
    // variables to recibe make a link to the main ones in the main view
    @Binding var catList: [Category]
    @Binding var imgList: [Img]
    @Binding var taskList: [Task]
    
    
    @Environment(\.presentationMode) var presentationMode
    
    // create the task object tu use in the view
    let task : Task
    
    // variables to store, change, and display the task info
    @State var name : String = ""
    @State var category : Int = 0
    @State var description : String = ""
    @State var img : Int = 0
    
    // variables for the alert boxes
    @State private var showAlert = false
    @State private var showAlertDelete = false
    @State private var showAlertUpdate = false

    var body: some View {
        
        //content
        VStack(alignment: .center) {
            
            // show the image and the picker to change it if the user want to update it
            VStack {
                
                HStack {
                    
                    // show the selected image
                    Image(imgList[img].name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .shadow(color: .accentColor, radius: 5)
                    
                    // let the user change to be able to update the task image
                    Picker("Image", selection: $img) {
                        ForEach(imgList) { img in
                            Text(img.name)
                                .tag(img.id)
                                        }
                                }
                                .pickerStyle(.wheel)
                                .cornerRadius(8)
                                .frame(width: 200, height: 100)
                    
                    
                    
                }
                
                HStack {
                    // label to inform the input is the task name
                    Text("Task Name:")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading,40)
                    
                    // input to be able to change the name
                    TextField("Task name", text: $name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
                
                
            }
            
            HStack {

                // label to inform the input is the task category
                Text("Category: ")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading,40)
                
                Spacer()
                
                // picker to change the category
                Picker("Category", selection: $category) {
                    ForEach(catList) { cat in
                        Text(cat.name)
                            .tag(cat.id)
                                    }
                            }
                            .pickerStyle(.menu)
                            .padding()
                            .cornerRadius(8)
                            

            }.padding(.trailing,40)
            
            
            VStack {
                // label to inform the next fiel is the description
                Text("Description: ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.leading,40)
                
                // big input for the description
                TextEditor(text: $description)
                    .padding()
                    .foregroundColor(.gray)
                    .border(Color.accent, width: 1)
                    .frame(height: 200)
                    
            }.padding()
            
            
            HStack {
                // button to delete the task
                Button{
                    
                    // show the alert to confirm user wants to delete the task
                    showAlertDelete = true
                    
                }label: {
                    
                    Image(systemName: "eraser.line.dashed")
                    Text("Delete")
                    
                }.font(.title)
                .fontWeight(.bold)
                .foregroundColor(.accentColorText)
                .frame(width: 150, height: 70)
                .background(.accent)
                .cornerRadius(20)
                .alert(isPresented: $showAlertDelete) {
                    Alert(
                        title: Text("Alert"),
                        message: Text("Do you want to delete this task?"),
                        primaryButton: .destructive(Text("Confirm")) {
                            // search the array for the task with the same id and delete it
                            taskList.removeAll { removeTask in
                                removeTask.id == task.id
                            }
                            
                            // close the view
                            presentationMode.wrappedValue.dismiss()
                        },
                        secondaryButton: .cancel()
                        
                    )
                }
                
                // button to update the task info
                Button{
                    
                    // verify if all the fields have information
                    if !name.isEmpty && !description.isEmpty && img != 0 && category != 0 {
                        
                        // show the alert to confirm user wants to update the task
                        showAlertUpdate = true
                        
                    }else {
                        
                        // show the alert to inform all the fields are required
                        showAlert = true
                    }
                    
                }label: {
                    Image(systemName: "pencil")
                    Text("Update")
                }.font(.title)
                .fontWeight(.bold)
                .foregroundColor(.accentColorText)
                .frame(width: 150, height: 70)
                .background(.accent)
                .cornerRadius(20)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Alert"),
                        message: Text("All fields are required!"),
                        dismissButton: .default(Text("Ok"))
                        
                    )
                }
                .alert(isPresented: $showAlertUpdate) {
                    Alert(
                        title: Text("Alert"),
                        message: Text("Do you want to update the task information?"),
                        primaryButton: .default(Text("Confirm")) {
                            // get the index of the task
                            let index = taskList.firstIndex(where: { taskIndex in
                                taskIndex.id == task.id
                            })!
                            
                            // make the new task object
                            let newTask = Task(id: task.id,name: name, description: description,category: category, image: img)
                            
                            // remove the old task
                            taskList.remove(at: index)
                            
                            // insert the new task in the same position
                            taskList.insert(newTask, at: index)
                            
                            // close the view
                            presentationMode.wrappedValue.dismiss()
                        },
                        secondaryButton: .cancel()
                        
                    )
                }
                
                
                
            }.padding(.top,50)
        }.onAppear {
            // when the view appear, put the task info in the variables to use in the input fields
            name = task.name
            category = task.category
            img = task.image
            description = task.description
        }
        
        
        
    }
}

#Preview {
    
    @State var taskList = TaskList().allTasks
    @State var imgList = ImgList().allImgs
    @State var catList = CategoryList().allcats
    
    TaskDetailsView(catList: $catList, imgList: $imgList, taskList: $taskList, task: TaskList().allTasks[0])
        
}
