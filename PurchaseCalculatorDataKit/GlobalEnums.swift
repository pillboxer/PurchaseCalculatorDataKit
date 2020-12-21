//
//  GlobalEnums.swift
//  PurchaseCalculatorDataKit
//
//  Created by Henry Cooper on 17/12/2020.
//

import Foundation

public enum PurchaseCalculatorDatabaseChildType: String, CaseIterable, Identifiable {
    case categories = "PurchaseCategories"
    case itemGroup = "PurchaseItemGroups"
    case items = "PurchaseItems"
    case specificUnits = "SpecificPurchaseUnits"
    case specificUnitGroups = "SpecificPurchaseUnitGroups"
    case brands = "PurchaseBrands"
    case attributes = "PurchaseAttributes"
    case attributeMultiplierGroups = "PurchaseItemAttributeMultipliersGroups"
    case valuesQuestions = "PurchaseAttributeValueQuestions"

    public var id: String {
        rawValue
    }
}

public enum PurchaseCalculatorDatabaseValueType: String {
    case cost
    case name
    case handle
    case uuid
    case modelName
    case brandID
    case imageName
    case unitIDs
}
