//
//  TaskList.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 25/03/2025.
//

import Foundation

class TaskList{
    var allTasks : [Task] = []
    
    init () {
        decodeJSONData()
    }
    
    public func getAllTasks() -> [Task]{
        return allTasks
    }
    
    private func decodeJSONData(){
        if let url = Bundle.main.url(forResource: "JsonTasks", withExtension: "json") {
            do{
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
