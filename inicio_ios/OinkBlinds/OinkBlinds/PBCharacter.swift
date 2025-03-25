//
//  PBCharacter.swift
//  OinkBlinds
//
//  Created by MultiLab PRT 09 on 17/03/2025.
//
struct PBCharacter : Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
}
