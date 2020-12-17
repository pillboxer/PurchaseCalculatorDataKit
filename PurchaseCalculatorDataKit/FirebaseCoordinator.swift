//
//  FirebaseManager.swift
//  PurchaseCalculator
//
//  Created by Henry Cooper on 12/12/2020.
//

import Foundation
import FirebaseKit
import Firebase
import SystemKit
import Combine

public class FirebaseCoordinator: ObservableObject {
    
    public static let shared = FirebaseCoordinator()
    @Published public var databaseRootNodes: [BasicRootNode] = []
    private let manager = FirebaseManager.shared
    
    public func updateJSON() {
        PurchaseCalculatorJSONFileType.allCases.forEach { updateJSON($0) }
    }
            
    private func updateJSON(_ type: PurchaseCalculatorJSONFileType) {
        manager.listenTo(type.rawValue) { (data) in
            if let data = data {
                do {
                    try FileManager.default.writeDataToDocuments(data: data, file: type.rawValue)
                }
                catch {
                    BundledContentManager.shared.saveBundledContentToDisk()
                }
            }
            self.objectWillChange.send()
        }
    }
    
    public func getNames(_ parent: String?) {
        manager.getChild(parent) { (snapshot) in
           let isRoot = parent == nil
            if isRoot {
                let children = snapshot.children.allObjects.compactMap { $0 as? DataSnapshot }
                let keys = children.compactMap { $0.key }
                let nodes = keys.map { BasicRootNode(title: $0) }
                self.databaseRootNodes = nodes
            }
        }
    }
}

public class BasicRootNode: Decodable {
    
    public let title: String
    
    init(title: String) {
        self.title = title
    }
}

public enum FirebaseRequirement: String {
    case title
    case attributeID
    case handle
    case name
    case imageName
    case purchaseItemGroupID
    case brandID
    case cost
    case modelName
}


