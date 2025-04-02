//
//  ImgList.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 25/03/2025.
//
import Foundation

class ImgList{
    // array to store the json content
    var allImgs : [Img] = []
    
    // to load the function
    init () {
        decodeJSONData()
    }
    
    private func decodeJSONData(){
        // try to find the file
        if let url = Bundle.main.url(forResource: "JsonImagens", withExtension: "json") {
            do{
                // read the file, convert from json and put in the array
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allImgs = try decoder.decode([Img].self, from: data)
            }catch {
                print("Erro while decoding JSON")
            }
        }
    }
}
