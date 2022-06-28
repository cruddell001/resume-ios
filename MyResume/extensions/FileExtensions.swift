//
//  FileExtensions.swift
//  MyResume
//
//  Created by Christopher Ruddell on 6/27/22.
//

import Foundation

func readJsonFile(fileName: String) -> String? {
    if let filepath = Bundle.main.path(forResource: fileName, ofType: "json") {
        do {
            let contents = try String(contentsOfFile: filepath)
            return contents
        } catch {
            return nil
        }
    } else {
        return nil
    }
}
