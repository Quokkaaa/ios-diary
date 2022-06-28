//
//  Alert.swift
//  Diary
//
//  Created by Taeangel, Quokka on 2022/06/28.
//

import UIKit
import CoreLocation

struct AlertAction {
  let title: String?
  let message: String?
  let firstActionTitle: String?
  let secondActionTitle: String?
  let firstAction: (() -> Void)?
  let secondAction: (() -> Void)?
}

struct NetWork {
  
  func fetchData(
      url: String,
      completionHandler: @escaping (Result<Model, networkError>) -> Void
  ) {
    
    guard let url = URL(string: url) else {
        return
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    
    let session = URLSession.shared
    let task = session.dataTask(with: urlRequest) { data, urlResponse, error in
      
      guard error == nil else {
        completionHandler(.failure(.error))
        return
      }
      
      guard let httpResponse = urlResponse as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
        completionHandler(.failure(.error))
          return
      }
      
      guard let data = data else {
        completionHandler(.failure(.error))
        return
      }
      
      guard let result = try? JSONDecoder().decode(Model.self, from: data) else {
        completionHandler(.failure(.error))
        return
      }
      
      completionHandler(.success(result))
      
    }
    task.resume()
  }
}

struct Model: Decodable {
  let weather: [Weather]
}

struct Weather: Decodable {
  let id: Int
  let main: String
  let description: String
  let icon: String
}

enum networkError: Error {
  case error
}

struct Endpoint {
  static func makeURL(lat: CLLocationDegrees, lon: CLLocationDegrees) -> String{
    
  return "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=5c1c8010db6c5ecf56d05e19c2c11e86"
  }
}
