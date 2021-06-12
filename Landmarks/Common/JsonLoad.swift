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
        if let fileLocation = Bundle.main.url(forResource: Constant.shared.filename, withExtension: Constant.shared.extensionData) {
            let data: Data
            
            guard let file = Bundle.main.url(forResource: Constant.shared.filename, withExtension: Constant.shared.extensionData)
                else {
                    fatalError("Couldn't find \(Constant.shared.filename) in main bundle.")
            }
            
            do {
                data = try Data(contentsOf: file)
            } catch {
                fatalError("Couldn't load \(Constant.shared.filename) from main bundle:\n\(error)")
            }
            
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
