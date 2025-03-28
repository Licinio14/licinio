//
//  TaskDetailsView.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 25/03/2025.
//

import SwiftUI

struct TaskDetailsView: View {
    
    
    @Binding var catList: [Category]
    @Binding var imgList: [Img]
    @Binding var taskList: [Task]
    
    @Environment(\.presentationMode) var presentationMode
    
    let task : Task
    
    @State var name : String = ""
    @State var category : Int = 0
    @State var description : String = ""
    @State var img : Int = 0
    
    @State private var showAlert = false
    @State private var showAlertDelete = false

    var body: some View {
        
        
        VStack(alignment: .center) {
            
            VStack {
                
                HStack {
                    
                    Image(imgList[img].name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .shadow(color: .accentColor, radius: 5)
                    
                    Picker("Image", selection: $img) {
                        ForEach(imgList) { img in
                            Text(img.name)
                                .tag(img.id)
                                        }
                                }
                                .pickerStyle(.wheel)  // Estilo de apresentação do Picker (pode ser alterado para .wheel, .segmented, etc.)
                                .cornerRadius(8)
                                .frame(width: 200, height: 100)
                    
                    
                    
                }
                
                HStack {
                    Text("Task Name:")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading,40)
                    
                    TextField("Task name", text: $name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
                
                
            }
            
            HStack {

                
                Text("Category: ")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading,40)
                
                Spacer()
                
                Picker("Category", selection: $category) {
                    ForEach(catList) { cat in
                        Text(cat.name)
                            .tag(cat.id)
                                    }
                            }
                            .pickerStyle(.menu)  // Estilo de apresentação do Picker (pode ser alterado para .wheel, .segmented, etc.)
                            .padding()
                            .cornerRadius(8)
                            

            }.padding(.trailing,40)
            
            VStack {
                Text("Description: ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.leading,40)
                
                TextEditor(text: $description)
                    .padding()
                    .foregroundColor(.gray)
                    .border(Color.accent, width: 1)
                    .frame(height: 200)
                    
                    
                
            }.padding()
            
            
            
            
            HStack {
                Button{
                    
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
                        message: Text("All fields are required!"),
                        primaryButton: .destructive(Text("Confirmar")) {
                            taskList.removeAll { removeTask in
                                removeTask.id == task.id
                            }
                            
                            presentationMode.wrappedValue.dismiss()
                        },
                        secondaryButton: .cancel()
                        
                    )
                }
                
                Button{
                    
                    if !name.isEmpty && !description.isEmpty && img != 0 && category != 0 {
                        let index = taskList.firstIndex(where: { taskIndex in
                            taskIndex.id == task.id
                        })!
                        
                        let newTask = Task(id: task.id,name: name, description: description,category: category, image: img)
                        
                        
                        taskList.remove(at: index)
                        
                        taskList.insert(newTask, at: index)
                        
                        presentationMode.wrappedValue.dismiss()

                        
                    }else {
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
                
            }.padding(.top,50)
        }.onAppear {
            // Inicializa o valor da variável @State quando a View aparecer
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
