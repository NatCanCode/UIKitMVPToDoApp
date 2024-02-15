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
//        label.text = text
        self.tasks = tasks
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // UITableViewDataSource: Help populate rows with cellForRowAt and numberOfRowsInSection funcs
    // UITableViewDelegate: Help get user taps with didSelectRowAt func

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell

        cell.label.text = tasks[indexPath.row].fields.task
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
