//
//  TaskList.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 25/03/2025.
//

import Foundation

class TaskList{
    // array to store the json content
    var allTasks : [Task] = []
    
    // to load the function
    init () {
        decodeJSONData()
    }
    
    private func decodeJSONData(){
        // try to find the file
        if let url = Bundle.main.url(forResource: "JsonTasks", withExtension: "json") {
            do{
                // read the file, convert from json and put in the array
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allTasks = try decoder.decode([Task].self, from: data)
                print("Leu do ficheiro: \(allTasks.count)")
            }catch {
                print("Erro while decoding JSON")
            }
        }
    }
}
