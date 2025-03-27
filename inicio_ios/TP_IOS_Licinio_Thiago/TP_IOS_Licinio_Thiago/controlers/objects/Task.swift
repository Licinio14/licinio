//
//  task.swift
//  TP_IOS_Licinio_Thiago
//
//  Created by MultiLab PRT 09 on 25/03/2025.
//
struct Task : Decodable, Identifiable, Encodable {
    let id: Int
    let name: String
    let description: String
    let category: Int
    let image: Int
}
