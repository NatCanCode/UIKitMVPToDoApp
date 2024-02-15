//
//  ViewController.swift
//  UIKitMVPToDoApp
//
//  Created by N N on 15/02/2024.
//

import UIKit

class ViewController: UIViewController, PresenterProtocol {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    lazy var presenter = Presenter(presenterProtocol: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getLabelText()
    }

    func getLabelTextProtocol(text: String) {
        label.text = text
    }
}

