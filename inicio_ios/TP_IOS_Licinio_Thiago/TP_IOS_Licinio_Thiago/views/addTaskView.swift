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
    @Binding var isDarkMode: Bool
    
    @State var selectedCat: Int = 0
    @State var selectedImg: Int = 3
    
    @State private var showAlert = false
    
    @State var name: String = ""
    @State var description: String = ""
    
    var body: some View {
        
        VStack {
            Form {
                TextField("Name", text: $name )
                    .foregroundColor(.accent)
                
                Picker("Category", selection: $selectedCat) {
                    ForEach(catList) { cat in
                        Text(cat.name)
                            .tag(cat.id)
                                    }
                            }
                            .pickerStyle(.menu)  // Estilo de apresentação do Picker (pode ser alterado para .wheel, .segmented, etc.)
                            .padding()
                            .cornerRadius(8)
                
                TextField("Description", text: $description )
                    .foregroundColor(.accent)
                

                Picker("Image", selection: $selectedImg) {
                    ForEach(imgList) { img in
                        Text(img.name)
                            .tag(img.id)
                                    }
                            }
                            .pickerStyle(.menu)  // Estilo de apresentação do Picker (pode ser alterado para .wheel, .segmented, etc.)
                            .padding()
                            .cornerRadius(8)
                
                Image(imgList[selectedImg].name)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(20)
                    .padding(10)
                    .shadow(color: .accent, radius: 5)
                
                

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
        }.preferredColorScheme(isDarkMode ? .dark : .light)
        
        
        
    }
}

#Preview {
    
    @State var taskList = TaskList().allTasks
    @State var imgList = ImgList().allImgs
    @State var catList = CategoryList().allcats
    @State var addClicked = true
    @State var isDarkMode = false
    
    addTaskView(catList: $catList, imgList: $imgList, taskList: $taskList, addClicked: $addClicked,isDarkMode: $isDarkMode)
    

}
