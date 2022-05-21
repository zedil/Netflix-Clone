//
//  APICaller.swift
//  netflixApp
//
//  Created by Dilara Şimşek on 21.05.2022.
//

import Foundation

struct Constants {
    static let API_KEY = "cb302cf2fa7bf2f641c72d4683998f42"
    static let baseURL = "https://api.themoviedb.org/3/"
    static let trending = "trending/"
}

enum APIError: Error {
    case failedGetData
}

class APICaller {
    static let shared = APICaller()
    
    
    func getTrendMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL+Constants.trending)all/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) // this function throws and error, we must write it into do catch statement and "try"
                
                let results = try JSONDecoder().decode(TrendMovieResponse.self, from: data)
                completion(.success(results.results))
                
                print(results.results[0].overview)
                //1.39
            } catch {
                
                completion(.failure(error))
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
        
    }
}



