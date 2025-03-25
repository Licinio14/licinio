//
//  PBCharacterList.swift
//  OinkBlinds
//
//  Created by MultiLab PRT 09 on 17/03/2025.
//

import Foundation

class PBCharacterList{
    var allcharacters : [PBCharacter] = []
    
    init () {
        decodeJSONData()
    }
    
    private func decodeJSONData(){
        if let url = Bundle.main.url(forResource: "peakyblinders", withExtension: "json") {
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allcharacters = try decoder.decode([PBCharacter].self, from: data)
                print(allcharacters.count)
            }catch {
                print("Erro while decoding JSON")
            }
        }
    }
}
