//
//  ProfileViewModel.swift
//  cocktails
//
//  Created by Duc hong cai on 12/08/2021.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    func validateUsername() -> Bool {
        let user: String = "Hong"
        var toReturn: Bool = false
        
        if self.username == user  {
            toReturn = true
        }
        return toReturn
    }
    
    func validatePassword() -> Bool {
        let user: String = "kode123"
        var toReturn: Bool = false
        
        if self.password == user  {
            toReturn = true
        }
        return toReturn
    }
}
