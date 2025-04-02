//
//  addTaskView.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 25/03/2025.
//

import SwiftUI

struct addTaskView: View {
    
    // variables to recibe make a link to the main ones in the main view
    @Binding var catList: [Category]
    @Binding var imgList: [Img]
    @Binding var taskList: [Task]
    @Binding var addClicked: Bool
    @Binding var isDarkMode: Bool
    
    // variables to store the content of the task to be added
    @State var selectedCat: Int = 0
    @State var selectedImg: Int = 0
    @State var name: String = ""
    @State var description: String = ""
    
    // variable for the alert to inform all the fields are needed
    @State private var showAlert = false
    
    
    
    var body: some View {
        
        //content
        VStack {
            //form to make it more prety and organize
            Form {
                // input for the name
                TextField("Name", text: $name )
                    .foregroundColor(.accent)
                
                // picker to chose the category
                Picker("Category", selection: $selectedCat) {
                    ForEach(catList) { cat in
                        Text(cat.name)
                            .tag(cat.id)
                                    }
                            }
                            .pickerStyle(.menu)  // Estilo de apresentação do Picker (pode ser alterado para .wheel, .segmented, etc.)
                            .padding()
                            .cornerRadius(8)
                
                // input for the description
                TextField("Description", text: $description )
                    .foregroundColor(.accent)
                
                // picker to choese the image for the task
                Picker("Image", selection: $selectedImg) {
                    ForEach(imgList) { img in
                        Text(img.name)
                            .tag(img.id)
                                    }
                            }
                            .pickerStyle(.menu)  // Estilo de apresentação do Picker (pode ser alterado para .wheel, .segmented, etc.)
                            .padding()
                            .cornerRadius(8)
                
                // plase to show the selected image
                Image(imgList[selectedImg].name)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(20)
                    .padding(10)
                    .shadow(color: .accent, radius: 5)
                
            }
            
            
            // button to add the task to the array
            Button {
                
                // verify if all the fields have information
                if (name.isEmpty || description.isEmpty || selectedCat == 0 || selectedImg == 0){
                    // show the alert to inform the fields are requir
                    showAlert = true
                }else {
                    //create a new task object
                    let newTask = Task(id: taskList.endIndex,name: name, description: description,category: selectedCat, image: selectedImg)
                    
                    // add the object to the array
                    taskList.append(newTask)
                    
                    // close the view
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
