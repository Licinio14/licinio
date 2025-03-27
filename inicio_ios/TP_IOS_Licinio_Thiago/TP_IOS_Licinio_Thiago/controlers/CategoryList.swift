//
//  CategoryList.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 25/03/2025.
//
import Foundation

class CategoryList{
    var allcats : [Category] = []
    
    init () {
        decodeJSONData()
    }
    
    private func decodeJSONData(){
        if let url = Bundle.main.url(forResource: "JsonCategory", withExtension: "json") {
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allcats = try decoder.decode([Category].self, from: data)
                //print(allcats.count)
            }catch {
                print("Erro while decoding JSON")
            }
        }
    }
}
