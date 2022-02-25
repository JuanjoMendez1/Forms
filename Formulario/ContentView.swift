//
//  ContentView.swift
//  Formulario
//
//  Created by Juan Jose Mendez Rojas on 24/02/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var login : PostViewModel
    
    var body: some View {
        FormView()
    }
}
