//
//  LoginView.swift
//  Formulario
//
//  Created by Juan Jose Mendez Rojas on 24/02/22.
//

import SwiftUI

struct Respuesta: Identifiable {
    var id: String { name }
    let name: String
}

struct FormView: View {
    @State private var nombre = ""
    @State private var apellido_p = ""
    @State private var apellido_m = ""
    @State private var email = ""
    @State private var telefono = ""
    @State private var selectedResponse: Respuesta?
    @StateObject var register = PostViewModel()
    var device = UIDevice.current.userInterfaceIdiom

    var body: some View {
        ZStack{
            Color("Azul")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    Spacer()
                    Text("Prueba Técnica")
                        .font(.title)
                        .foregroundColor(Color.white)
                    Spacer()
                    Image("person")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    VStack(spacing: 16){
                        Text("Introduce tus datos.")
                            .font(.title3)
                            .foregroundColor(Color.white)
                        if device == .phone{
                            CustomTextField(image: "person", placeHolder: "Nombre (s)", txt: $nombre)
                            CustomTextField(image: "person.badge.plus", placeHolder: "Apellido Paterno", txt: $apellido_p)
                            CustomTextField(image: "person.fill.checkmark", placeHolder: "Apellido Materno", txt: $apellido_m)
                            CustomTextField(image: "person.crop.square.filled.and.at.rectangle", placeHolder: "Correo Electrónico", txt: $email)
                            CustomTextField(image: "phone.badge.plus", placeHolder: "Telefono", txt: $telefono)
                        } else {
                            Spacer()
                            VStack {
                                HStack{
                                    CustomTextField(image: "person", placeHolder: "Nombre (s)", txt: $nombre)
                                }
                                .padding(.top, 20)
                                HStack{
                                    CustomTextField(image: "person.badge.plus", placeHolder: "Apellido Paterno", txt: $apellido_p)
                                    CustomTextField(image: "person.fill.checkmark", placeHolder: "Apellido Materno", txt: $apellido_m)
                                }
                                .padding(.top, 20)
                                HStack {
                                    CustomTextField(image: "person.crop.square.filled.and.at.rectangle", placeHolder: "Correo Electrónico", txt: $email)
                                    CustomTextField(image: "phone.badge.plus", placeHolder: "Telefono", txt: $telefono)
                                }
                                .padding(.top, 20)
                            }
                        }
                        Button(action: {
                            if nombre == "" || apellido_p == "" || apellido_m == "" || email == "" || telefono == "" {
                                selectedResponse = Respuesta(name: "Llenar los campos")
                            }
                            else if telefono.count != 10{
                                selectedResponse = Respuesta(name: "Ingresa un teléfono valido")
                            }
                            else{
                                register.registrar(nombre: nombre, apellido_p: apellido_p, apellido_m: apellido_m, email: email, telefono: telefono) { (done) in
                                    if done{
                                        selectedResponse = Respuesta(name: "Registro completo")
                                    } else{
                                        selectedResponse = Respuesta(name: "Ocurrio un error")
                                    }
                                }
                                print("Todos los datos se han enviado")
                            }
                        }, label: {
                            Text("Registrar")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 150)
                                .background(Color("Verde"))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        })
                            .alert(item: $selectedResponse) { show in
                                Alert(
                                       title: Text("Formulario"),
                                       message: Text(show.name),
                                       dismissButton: .default(Text("Ok"))
                                )
                            }
                    }
                        .padding(.top, 22)
                    Spacer()
                    Text("Diseñado por Juan Méndez")
                        .font(.footnote)
                        .foregroundColor(Color.white)
                }
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}


