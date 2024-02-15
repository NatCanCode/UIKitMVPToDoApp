//
//  Service.swift
//  UIKitMVPToDoApp
//
//  Created by N N on 15/02/2024.
// Airtable token: "pat34EltLrldSOB1D.29918bf2298890e1c3c724f7edcf2deabfe38ab4822f863c0c4b9b8948411289"

import UIKit

class Service {
    private let url = URL(string: "https://api.airtable.com/v0/appEdnbPhnWCd5Tsx/To%20do?maxRecords=3&view=Grid%20view")
    private let token = "pat34EltLrldSOB1D.29918bf2298890e1c3c724f7edcf2deabfe38ab4822f863c0c4b9b8948411289"

    func getRecords(completion: @escaping ([RecordTask]?, Error?) -> Void) {
        guard let url = url else { return } // Have url not null

        var request = URLRequest(url: url)
        request.httpMethod = "GET" // GET Method
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Asynchronous here // Check no error first
            guard error == nil, let data = data else {
                completion(nil, error)
                return
            }

            guard let responseHttp = response as? HTTPURLResponse else {
                completion(nil, nil)
                return
            }

            guard responseHttp.statusCode == 200 else {
                completion(nil, nil)
                return
            }

            let result: Record? = try? JSONDecoder().decode(Record.self, from: data)
            completion(result?.records, nil)
        }

        task.resume()
    }
}
