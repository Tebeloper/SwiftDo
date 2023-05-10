//
//  ToDoListViewViewModel.swift
//  SwiftDo
//
//  Created by Dimitrios Gkarlemos on 01/05/2023.
//

import Foundation

/// ViewModel for list of Items View
/// Primary Tab
class ToDoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    
    init() {}
    
    func delete(id: String) {
        
    }
}
