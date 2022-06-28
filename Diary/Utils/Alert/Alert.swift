//
//  Alert.swift
//  Diary
//
//  Created by Taeangel, Quokka on 2022/06/28.
//

import UIKit

struct AlertAction {
  let title: String?
  let message: String?
  let firstActionTitle: String?
  let secondActionTitle: String?
  let firstAction: (() -> Void)?
  let secondAction: (() -> Void)?
}

struct netWork {
  let session = URLSession.shared

  func getInfo(urlString: String, completionHandler: @escaping(Result<Model, networkError>) -> Void) {
    
    guard let url = URL(string: urlString) else {return}
    
    
    let _ = session.dataTask(with: url) { data, _, _ in
      
      guard let data = data else {
        completionHandler(.failure(.error))
        return
      }
      
      guard let result = try? JSONDecoder().decode(Model.self, from: data) else {
        completionHandler(.failure(.error))
        return
      }
      
      completionHandler(.success(result))
      
    }.resume()
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
  static func makeURL(lat: String, lon: String) -> String{
  return "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=5c1c8010db6c5ecf56d05e19c2c11e86"

  }
}
