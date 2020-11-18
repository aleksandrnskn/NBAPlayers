//
//  ApiClient.swift
//  NBAPlayers
//
//  Created by Alexandr Aniskin on 18.11.2020.
//

import Foundation

enum ApiError: Error {
    case noData
}
protocol ApiClient {
    func getPlayers(onResult: @escaping (Result<[Player], Error>) -> Void)
}

class ApiClientImpl: ApiClient {
    
    func getPlayers(onResult: @escaping (Result<[Player], Error>) -> Void) {
        
        let session = URLSession.shared
        
        let url = URL(string: "https://www.balldontlie.io/api/v1/players")!
        //let urlRequest = URLRequest(url: url)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let dataTask = session.dataTask(with: urlRequest,
                                        completionHandler: { data, response, error in
                                            
                                            //sleep(5)
                                            //onResult(.failure(ApiError.noData))
                                            //return
                                            
                                            guard let data = data else {
                                                onResult(.failure(ApiError.noData))
                                                return
                                            }
                                            
                                            do {
                                                let playersResponse = try
                                                    JSONDecoder().decode(PlayersResponse.self, from: data)
                                                onResult(.success(playersResponse.data))
                                            } catch {
                                                print(error)
                                                onResult(.failure(error))
                                            }
                                            
                                        })
        
        dataTask.resume()
        
    }
    
}
