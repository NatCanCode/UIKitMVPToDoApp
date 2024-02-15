//
//  RecordTask.swift
//  UIKitMVPToDoApp
//
//  Created by N N on 15/02/2024.
//

import UIKit

// MARK: - ToDoApp
struct Record: Codable {
    let records: [RecordTask]
}

// MARK: - Record
struct RecordTask: Codable {
    let id: String
    let fields: Fields
}

// MARK: - Fields
struct Fields: Codable {
    let priority, task, toDoBefore: String

    enum CodingKeys: String, CodingKey {
        case priority = "Priority"
        case task = "Task"
        case toDoBefore = "To do before" // Date in String format
    }
}

// Json:
//{
//    "records": [
//        {
//            "id": "reckEAZmjluPK0YDd",
//            "createdTime": "2024-02-06T16:11:17.000Z",
//            "fields": {
//                "Priority": "Medium",
//                "Task": "Créer groupe whatsapp pour anniversaire",
//                "To do before": "2024-02-20"
//            }
//        },
//        {
//            "id": "recmFRiYaLftx3IUc",
//            "createdTime": "2024-02-06T16:11:17.000Z",
//            "fields": {
//                "Priority": "Low",
//                "Task": "Arroser les plantes",
//                "To do before": "2024-02-16"
//            }
//        },
//        {
//            "id": "recN6kOKtvzgfs8Nm",
//            "createdTime": "2024-02-06T16:11:17.000Z",
//            "fields": {
//                "Priority": "High",
//                "Task": "Acheter cadeau",
//                "To do before": "2024-02-25"
//            }
//        }
//    ],
//    "offset": "itrRFvqKUEwCvqS6L/recN6kOKtvzgfs8Nm"
//}

// Go to app.quicktype.io to update Json into Swift:
//// MARK: - ToDoApp
//struct ToDoApp: Codable {
//    let records: [Record]
//    let offset: String
//}
//
//// MARK: - Record
//struct Record: Codable {
//    let id, createdTime: String
//    let fields: Fields
//}
//
//// MARK: - Fields
//struct Fields: Codable {
//    let priority, task, toDoBefore: String
//
//    enum CodingKeys: String, CodingKey {
//        case priority = "Priority"
//        case task = "Task"
//        case toDoBefore = "To do before"
//    }
//}
