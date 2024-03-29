//
//  Service.swift
//  UIKitMVPToDoApp
//
//  Created by N N on 15/02/2024.
// Airtable token: "pat34EltLrldSOB1D.29918bf2298890e1c3c724f7edcf2deabfe38ab4822f863c0c4b9b8948411289"
// Url: "https://api.airtable.com/v0/appEdnbPhnWCd5Tsx/To%20do?maxRecords=3&view=Grid%20view"
// Carefull to select READ and WRITE when generating the Airtable token

import UIKit

class Service {
    private let url = URL(string: "https://api.airtable.com/v0/appEdnbPhnWCd5Tsx/To%20do")
    private let token = "pat34EltLrldSOB1D.29918bf2298890e1c3c724f7edcf2deabfe38ab4822f863c0c4b9b8948411289"

    // GET Method
    func getRecords(completion: @escaping ([RecordTask]?, Error?) -> Void) {
        guard let url = url else { return } // Have url not null

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Asynchronous here // Check for errors first
            guard error == nil, let data = data else {
                completion(nil, error)
                return
            }

            // Test Json string in console
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON: \(jsonString)")
            }

            // Check the HTTP response
            guard let responseHttp = response as? HTTPURLResponse else {
                completion(nil, nil)
                return
            }

            // Check the HTTP response status code
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

extension Service {
    // DELETE Method
    func deleteRecord(recordId: String, completion: @escaping (Error?) -> Void) {
        guard let url = url else { return }

        // Append recordId to the URL
        let deleteURL = url.appendingPathComponent(recordId)

        var request = URLRequest(url: deleteURL)
        request.httpMethod = "DELETE"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Asynchronous here // Check for errors first
            guard error == nil else {
                completion(error)
                return
            }

            // Check the HTTP response status code
            guard let responseHttp = response as? HTTPURLResponse,
                  responseHttp.statusCode == 200 else {
                completion(nil)
                return
            }

            // Deleted record
            completion(nil)
        }

        task.resume()
    }
}
