//
//  Presenter.swift
//  UIKitMVPToDoApp
//
//  Created by N N on 15/02/2024.
//

import UIKit

class Presenter {

    let presenterProtocol: PresenterProtocol?

    init(presenterProtocol: PresenterProtocol?) {
        self.presenterProtocol = presenterProtocol
    }

    func getLabelText() {
        let text = "Hey"
        presenterProtocol?.getLabelTextProtocol(text: text)
    }
}

protocol PresenterProtocol {
    func getLabelTextProtocol(text: String)
}
