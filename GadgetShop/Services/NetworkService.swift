//
//  NetworkService.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 04.12.2022.
//

import Foundation

protocol NetwokrServiceProtocol: AnyObject {
    func getProductList(completion: @escaping(ProductList?, NetworkErrors?) -> ())
    func getProductDetailFor(id: Int, completion: @escaping(DetailProduct?, NetworkErrors?) -> ())
    func getCart(completion: @escaping(Cart?, NetworkErrors?) -> ())
    func getImageFor(urlString: String, completion: @escaping (Data?, NetworkErrors?) -> ())
    func getImageFor(urlString: [String], completion: @escaping ([Data?]?, NetworkErrors?) -> ())
}

enum NetworkErrors: Error {
    case noResponseFromServer
    case nilData
    case dataParsingError(error: Error)
    case connectingError(error: Error)
    case urlPharseFail
}

final class NetwokrService: NetwokrServiceProtocol {
    
    static let shared = NetwokrService()
    private enum Paths: String {
        case productList = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
        case productDetail = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
        case cart = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
        
        var url: URL? {
            return URL(string: rawValue)
        }
    }
    
    private init() { }
    
    // MARK: - Private funcs
    
    private func connectionHandle(response: URLResponse?, error: Error?) -> NetworkErrors? {
        if response == nil {
            return NetworkErrors.noResponseFromServer
        }
        if let error = error {
            return NetworkErrors.connectingError(error: error)
        }
        return nil
    }
    
    private func dataPharseTaskWith<T: Decodable>(url: URL?, completion: @escaping(T? , NetworkErrors?) -> ()) {
        guard let url = url else { completion(nil, .urlPharseFail); return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            var result: T?
            var errors = self.connectionHandle(response: response, error: error)
            do {
                guard let data = data else { throw NetworkErrors.nilData }
                result = try JSONDecoder().decode(T.self, from: data)
            } catch {
                errors = .dataParsingError(error: error)
            }
            DispatchQueue.main.async {
                completion(result, errors)
            }
        }.resume()
    }
    
    // MARK: - Public funcs
    
    func getProductList(completion: @escaping(ProductList?, NetworkErrors?) -> ()) {
        dataPharseTaskWith(url: Paths.productList.url, completion: completion)
    }

    func getProductDetailFor(id: Int, completion: @escaping(DetailProduct?, NetworkErrors?) -> ()) { // id is not currently used
        dataPharseTaskWith(url: Paths.productDetail.url, completion: completion)
    }

    func getCart(completion: @escaping(Cart?, NetworkErrors?) -> ()) {
        dataPharseTaskWith(url: Paths.cart.url, completion: completion)
    }
    
    func getImageFor(urlString: String, completion: @escaping (Data?, NetworkErrors?) -> ()) {
        guard let url = URL(string: urlString) else { completion(nil, .urlPharseFail); return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let errors = self.connectionHandle(response: response, error: error)
            DispatchQueue.main.async {
                completion(data, errors)
            }
        }.resume()
    }
    
    // FIXME: - Race Condition when appending image
    
    func getImageFor(urlString: [String], completion: @escaping ([Data?]?, NetworkErrors?) -> ()) {
        let loadingGroup = DispatchGroup()
        var images: [Data?]? = []
        var errorr: NetworkErrors?
        for urlPath in urlString {
            guard let url = URL(string: urlPath) else { images?.append(nil); break }
            loadingGroup.enter()
            URLSession.shared.dataTask(with: url) { data, response, error in
                errorr = self.connectionHandle(response: response, error: error)
                images?.append(data)
                loadingGroup.leave()
            }.resume()
        }
        loadingGroup.notify(queue: .main) {
            completion(images, errorr)
        }
    }
}
