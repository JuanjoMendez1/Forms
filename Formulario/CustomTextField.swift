//
//  CustomTextField.swift
//  Formulario
//
//  Created by Juan Jose Mendez Rojas on 24/02/22.
//

import SwiftUI

struct CustomTextField: View {
    
//    Valores que obtengo
    var image: String
    var placeHolder: String
    @Binding var txt : String

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
            Image(systemName: image)
                .font(.system(size: 24))
                .foregroundColor(Color("Azul"))
                .frame(width: 50, height: 50)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            ZStack{
                if placeHolder == "Telefono"{
                    TextField(placeHolder, text: $txt)
                        .keyboardType(.numberPad)
                        .foregroundColor(Color.white)
                }
                else if placeHolder == "Correo Electrónico"{
                    TextField(placeHolder, text: $txt)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true) //deshabilitar autocorrector
                        .autocapitalization(.none) //la primer letra no sea mayusculas
                        .foregroundColor(Color.white)
                }
                else{
                    TextField(placeHolder, text: $txt)
                        .foregroundColor(Color.white)
                }
            }
                .padding(.horizontal)
                .padding(.leading, 65)
                .frame(height: 50)
                .background(Color.white.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .padding(.horizontal)
    }

}

