//
//  Presenter.swift
//  UIKitMVPToDoApp
//
//  Created by N N on 15/02/2024.
// 

import UIKit

class Presenter {
    let presenterProtocol: PresenterProtocol?
    let service = Service()

    init(presenterProtocol: PresenterProtocol?) {
        self.presenterProtocol = presenterProtocol
    }

//    func getLabelText() {
//        let text = "Hey"
//        presenterProtocol?.getLabelTextProtocol(text: text)
//    }

//    func getSentences() {
//        let sentences = [
//            "One",
//            "Two",
//            "Three",
//            "Four",
//            "Five",
//            "Six",
//            "Seven"
//        ]
//        presenterProtocol?.getSentencesProtocol(sentences: sentences)
//    }

    // GET method
    func getTasks() {
        service.getRecords { tasks, error in
            guard let tasks = tasks else { return }
            self.presenterProtocol?.getAllTasksProtocol(tasks: tasks)
        }
    }

    // DELETE method
    func deleteTask(recordId: String) {
        service.deleteRecord(recordId: recordId) { error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error deleting task: \(error)")
                    // Handle error if needed
                } else {
                    print("Task deleted successfully")
                    // Perform UI updates after successful deletion
                    self.getTasks() // Refresh task list after deletion
                }
            }
        }
    }
}

protocol PresenterProtocol {
//    func getLabelTextProtocol(text: String)
//    func getSentencesProtocol(sentences: [String])
    func getAllTasksProtocol(tasks: [RecordTask])
    func deleteTaskProtocol(recordId: RecordTask)
}
