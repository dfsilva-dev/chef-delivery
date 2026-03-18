//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Douglas Silva on 18/03/26.
//

import Foundation
//import Alamofire

enum RequestErro: Error {
    case invalidURL
    case errorRequest(error: String)
    case invalidReponse
}

struct HomeService {
    func fetchData() async throws -> Result<[StoreType], RequestErro> {
        guard let url = URL(string: "https://private-9a6a43-highmight.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let storesObjects = try JSONDecoder().decode([StoreType].self, from: data)
        return .success(storesObjects)
    }
    
    func confirmOrder(order: OrderPayload) async throws -> Result<Bool, RequestErro> {
        guard let url = URL(string: "https://private-9a6a43-highmight.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }
        
        let encodedObject = try JSONEncoder().encode(order)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = encodedObject
        
        let (_, response) = try await URLSession.shared.data(for: request)
        if let httpResponse = response as? HTTPURLResponse {
            return .success((200..<300).contains(httpResponse.statusCode))
        }
        return .failure(.invalidReponse)
    }
    
    /*func fetchDataWithAlamorife(completion: @escaping ([StoreType]?, Error?) -> Void) {
        AF.request("https://private-9a6a43-highmight.apiary-mock.com/home").responseDecodable(of: [StoreType].self) { response in
            switch response.result {
            case .success(let stores):
                completion(stores, nil)
            default: break
            }
            
        }
    }*/
}
