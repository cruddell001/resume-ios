//
//  ApiImporter.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/28/22.
//

import Foundation

class ApiImporter {
    func downloadData() async throws -> Resume {
        guard let url = URL(string: "https://my-resume.app/data") else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let res = try JSONDecoder().decode(Resume.self, from: data)
        print("downloaded resume with \(res.education.count) education items")
        return res
    }
}
