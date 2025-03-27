//
//  addTaskView.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 25/03/2025.
//

import SwiftUI

struct addTaskView: View {
    
    @Binding var catList: [Category]
    @Binding var imgList: [Img]
    @Binding var taskList: [Task]
    @Binding var addClicked: Bool
    
    @State var selectedCat: Int = 0
    @State var selectedImg: Int = 0
    
    @State private var showAlert = false
    
    @State var name: String = ""
    @State var description: String = ""
    
    var body: some View {
        
        VStack {
            Form {
                TextField("Name", text: $name )
                Picker("Category", selection: $selectedCat) {
                    ForEach(catList) { cat in
                        Text(cat.name)
                            .tag(cat.id)
                                    }
                            }
                            .pickerStyle(.menu)  // Estilo de apresentação do Picker (pode ser alterado para .wheel, .segmented, etc.)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                
                TextField("Description", text: $description )
                

                Picker("Image", selection: $selectedImg) {
                    ForEach(imgList) { img in
                        Text(img.name)
                            .tag(img.id)
                                    }
                            }
                            .pickerStyle(.menu)  // Estilo de apresentação do Picker (pode ser alterado para .wheel, .segmented, etc.)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                
                Image(systemName: "\(imgList[selectedImg].name)")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .shadow(color: .black, radius: 1)
                    .padding(10)
                    .foregroundColor(.black)
                
                

            }
            
            
            
            Button {
                
                if (name.isEmpty || description.isEmpty || selectedCat == 0 || selectedImg == 0){
                    showAlert = true
                }else {
                    let newTask = Task(id: taskList.endIndex,name: name, description: description,category: selectedCat, image: selectedImg)
                    taskList.append(newTask)
                    print(taskList)
                    
                    addClicked.toggle()
                }
                
                
                
                
                
            }label: {
                Text("ADD")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(15)
                    .background(.blue)
                    .cornerRadius(20)
                    
            }.alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Alert"),
                    message: Text("All fields are required!"),
                    dismissButton: .default(Text("Ok"))
                    
                )
            }
        }.preferredColorScheme(.dark)
        
        
        
    }
}

#Preview {
    
    @State var taskList = TaskList().allTasks
    @State var imgList = ImgList().allImgs
    @State var catList = CategoryList().allcats
    @State var addClicked = true
    
    addTaskView(catList: $catList, imgList: $imgList, taskList: $taskList, addClicked: $addClicked)
    

}
