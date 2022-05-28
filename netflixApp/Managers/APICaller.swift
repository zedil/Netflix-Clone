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
    static let upcoming = "upcoming"
    static let popular = "popular"
    static let top_rated = "top_rated"
}

enum APIError: Error {
    case failedGetData
}

class APICaller {
    static let shared = APICaller()
    
    
    func getTrendMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL+Constants.trending)movie/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) // this function throws and error, we must write it into do catch statement and "try"
                
                let results = try JSONDecoder().decode(TrendTitleResponse.self, from: data)
                completion(.success(results.results))
                
                print(results.results[0].overview)
                
            } catch {
                
                completion(.failure(APIError.failedGetData))
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
        
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL+Constants.trending)tv/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedGetData))
                print(error.localizedDescription)
            }

            
        }
        
        task.resume()
        
        
    }
    
    
    //https://api.themoviedb.org/3/movie/upcoming?api_key=<<api_key>>&language=en-US&page=1
    
    
    func getUpcomingMovie(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)movie/\(Constants.upcoming)?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedGetData))
                print(error.localizedDescription)
            }

            
        }
        
        task.resume()
        
    }
    
    func getPopularMovie(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)movie/\(Constants.popular)?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedGetData))
                print(error.localizedDescription)
            }

            
        }
        
        task.resume()
        
    }
    
    //https://api.themoviedb.org/3/movie/top_rated?api_key=<<api_key>>&language=en-US&page=1
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)movie/\(Constants.top_rated)?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedGetData))
                print(error.localizedDescription)
            }

            
        }
        
        task.resume()
        
    }
    
    //https://api.themoviedb.org/3/movie/popular?api_key=<<api_key>>&language=en-US&page=1
}





