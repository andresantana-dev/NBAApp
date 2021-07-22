//
//  ServiceAPI.swift
//  NBAApp
//
//  Created by André Santana on 15/07/2021.
//

import Foundation

enum ServiceError: Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to fetch data"
        case .invalidEndpoint: return "Invalid Endpoint"
        case .invalidResponse: return "Invalid Response"
        case .noData: return "No Data"
        case .serializationError: return "Failed to Decode Data"
        }
    }
}

class ServiceAPI {
    
    // MARK: - Properties
    
    static let shared = ServiceAPI()
    
    private let apiKey = ""
    private let apiURL = "https://fly.sportsdata.io/v3/nba/scores/json/"
    private var dataTask: URLSessionDataTask?
    
    // MARK: - Methods
    
    func getGames(date: String, completion: @escaping(Result<[Game], ServiceError>) -> Void) {
        guard let url = URL(string: "\(apiURL)/GamesByDate/\(date)?key=e6496d3bff164fa6b02ff24019d72f93") else {
            self.executeHandlerInMainThread(with: .failure(.invalidEndpoint), completion: completion)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
                
        dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil {
                self.executeHandlerInMainThread(with: .failure(.apiError), completion: completion)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.executeHandlerInMainThread(with: .failure(.invalidResponse), completion: completion)
                return
            }
            
            guard let data = data else {
                self.executeHandlerInMainThread(with: .failure(.noData), completion: completion)
                return
            }
            
            do {
                let games = try JSONDecoder().decode([Game].self, from: data)
                self.executeHandlerInMainThread(with: .success(games), completion: completion)
            } catch {
                self.executeHandlerInMainThread(with: .failure(.serializationError), completion: completion)
            }
        }
        dataTask?.resume()
    }
    
    func getStandings(completion: @escaping(Result<[Standing], ServiceError>) -> Void) {
        guard let url = URL(string: "\(apiURL)/Standings/2021?key=e6496d3bff164fa6b02ff24019d72f93") else {
            self.executeHandlerInMainThread(with: .failure(.invalidEndpoint), completion: completion)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
                
        dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil {
                self.executeHandlerInMainThread(with: .failure(.apiError), completion: completion)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.executeHandlerInMainThread(with: .failure(.invalidResponse), completion: completion)
                return
            }
            
            guard let data = data else {
                self.executeHandlerInMainThread(with: .failure(.noData), completion: completion)
                return
            }
            
            do {
                let standings = try JSONDecoder().decode([Standing].self, from: data)
                self.executeHandlerInMainThread(with: .success(standings), completion: completion)
            } catch {
                self.executeHandlerInMainThread(with: .failure(.serializationError), completion: completion)
            }
        }
        dataTask?.resume()
    }
    
    private func executeHandlerInMainThread(with result: Result<[Game], ServiceError>, completion: @escaping(Result<[Game], ServiceError>) -> Void) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
    
    private func executeHandlerInMainThread(with result: Result<[Standing], ServiceError>, completion: @escaping(Result<[Standing], ServiceError>) -> Void) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
