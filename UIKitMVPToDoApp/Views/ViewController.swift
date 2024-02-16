//
//  ViewController.swift
//  UIKitMVPToDoApp
//
//  Created by N N on 15/02/2024.
//

import UIKit

class ViewController: UIViewController, PresenterProtocol {
    // @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!

    lazy var presenter = Presenter(presenterProtocol: self)
    // var sentences: [String] = [] // Always have en empty array to initialise the array
    var tasks: [RecordTask] = [] // Always have en empty array to initialise the array

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

//        presenter.getLabelText()
//        presenter.getSentences()
        presenter.getTasks()
    }

//    func getLabelTextProtocol(text: String) {
//        // Update UI
////        label.text = text
//    }

//    func getSentencesProtocol(sentences: [String]) {
//        // Update UI
////        label.text = text
//        self.sentencess = sentences
//        tableView.reloadData()
//    }

    func getAllTasksProtocol(tasks: [RecordTask]) {
        // Update UI
        self.tasks = tasks
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func deleteTaskProtocol(recordId: RecordTask) {
//        self.recordId = recordId
        DispatchQueue.main.async {
            self.tableView.reloadData()
            // TODO: Handle errors
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // UITableViewDataSource: Help populate rows with cellForRowAt and numberOfRowsInSection funcs
    // UITableViewDelegate: Help get user taps with didSelectRowAt func

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell

        cell.label.text = tasks[indexPath.row].fields.task
        // Update cell UI
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    // Allow row deletion
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
        {
            return true
        }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete { // Enum focussing on deleting only = check other options
        print("Deleted")

        var recordId =  tasks[indexPath.row].id
        presenter.deleteTask(recordId: recordId)

        self.tasks.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
