//
//  CocktailViewModel.swift
//  cocktails
//
//  Created by Duc hong cai on 27/07/2021.
//

import Foundation
import SwiftUI

class CocktailViewModel: ObservableObject {
    
    func splitCategory(arr: String) -> Array<String>{
        let array = arr.components(separatedBy: ",")
        return array
    }
    
}
