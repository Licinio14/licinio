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

    var body: some View {
        
        
        VStack(alignment: .center) {
            
            VStack {
                
                HStack {
                    
                    Image(systemName: "\(imgList[img].name)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .shadow(color: .white, radius: 1)
                    
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
                    .border(Color.gray, width: 1)
                    .frame(height: 200)
                
            }.padding()
            
            
            
            
            HStack {
                Button{
                    taskList.removeAll { removeTask in
                        removeTask.id == task.id
                    }
                    
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    
                    Image(systemName: "eraser.line.dashed")
                    Text("Delete")
                    
                }.font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(width: 150, height: 70)
                .background(.white)
                .cornerRadius(20)
                
                Button{
                    
                }label: {
                    Image(systemName: "pencil")
                    Text("Update")
                }.font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(width: 150, height: 70)
                .background(.white)
                .cornerRadius(20)
                
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
        .preferredColorScheme(.dark)
        
}
