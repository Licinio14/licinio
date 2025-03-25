//
//  ImgList.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 25/03/2025.
//
import Foundation

class ImgList{
    var allImgs : [Img] = []
    
    init () {
        decodeJSONData()
    }
    
    private func decodeJSONData(){
        if let url = Bundle.main.url(forResource: "JsonImagens", withExtension: "json") {
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allImgs = try decoder.decode([Img].self, from: data)
                print(allImgs.count)
            }catch {
                print("Erro while decoding JSON")
            }
        }
    }
}
