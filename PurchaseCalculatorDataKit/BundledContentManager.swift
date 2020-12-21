//
//  BundledContentManager.swift
//  PurchaseCalculator
//
//  Created by Henry Cooper on 14/12/2020.
//

import Foundation
import SystemKit

public class BundledContentManager: NSObject {
    
    // MARK: - Private
    private let fileManager = FileManager.default
    
    // MARK: - Static
    public static let shared = BundledContentManager()
    
    public func saveBundledContentToDisk() {
        
        PurchaseCalculatorDatabaseChildType.allCases.forEach { (type) in
            do {
                let bundle = Bundle(for: classForCoder)
                let data = try fileManager.dataFromBundle(bundle: bundle, file: type.rawValue, type: "json")
                try fileManager.writeDataToDocuments(data: data, file: type.rawValue)
            }
            catch let error {
                print("Could not save bundled contents - \(error)")
            }
        }
    }
    
}
