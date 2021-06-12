//
//  JsonLoad.swift
//  Landmarks
//
//  Created by Дмитрий Жучков on 09.06.2021.
//

import Foundation
final public class JsonLoad {
    static let service = JsonLoad()
    
    // MARK: Data load func
    func getData() -> [LandmarkJSON] {
        if let fileLocation = Bundle.main.url(forResource: "landmarkData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([LandmarkJSON].self, from: data)
                return dataFromJson
            } catch {
                fatalError("\(error)")
            }
            
        }
        let withoutData: [LandmarkJSON] = []
        return withoutData
    }
}
