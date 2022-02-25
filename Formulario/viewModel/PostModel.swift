//
//  PostModel.swift
//  Formulario
//
//  Created by Juan Jose Mendez Rojas on 24/02/22.
//

import Foundation

class PostViewModel: ObservableObject {
    
    func registrar(nombre: String, apellido_p: String, apellido_m: String, email: String, telefono: String, completion: @escaping (_ done: Bool) -> Void){
        guard let url = URL(string: "http://localhost:3001/register") else { return }
        let parametros = ["user_name": nombre, "apellido_p": apellido_p, "apellido_m": apellido_m, "email": email, "telefono": telefono]
        let body = try! JSONSerialization.data(withJSONObject: parametros)
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) {_, response, error in
            if let response = response {
                print("response",response)
            } else{
                print("fallo response")
                completion(false)
            }
//            guard let data = data else { return }
//            print("data1", data)
            if let error = error?.localizedDescription{
                print("Error en el api", error)
                completion(false)
            } else{
                completion(true)
            }
            
        }.resume()
        
    }
}
