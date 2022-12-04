//
//  NetworkService.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 04.12.2022.
//

import Foundation

protocol NetwokrServiceProtocol: AnyObject {
    func getProductList(completion: @escaping(ProductList?, NetworkErrors?) -> ())
    func getProductDetail(completion: @escaping(DetailProduct?, NetworkErrors?) -> ())
    func getCart(completion: @escaping(Cart?, NetworkErrors?) -> ())
}

enum NetworkErrors: Error {
    case noResponseFromServer
    case nilData
    case dataPharseError(error: Error)
    case connectingError(error: Error)
}

final class NetwokrService: NetwokrServiceProtocol {
    
    static let shared = NetwokrService()
    
    private enum Paths: String {
        case productList = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
        case productDetail = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
        case cart = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
        
        var url: URL? {
            switch self {
            case .productList:
                return URL(string: NetwokrService.Paths.productList.rawValue)
            case .productDetail:
                return URL(string: NetwokrService.Paths.productDetail.rawValue)
            case .cart:
                return URL(string: NetwokrService.Paths.cart.rawValue)
            }
        }
    }
    
    private init() { }
    
    private func connectionHandle(response: URLResponse?, error: Error?) -> NetworkErrors? {
        if response == nil {
            return NetworkErrors.noResponseFromServer
        }
        if let error = error {
            return NetworkErrors.connectingError(error: error)
        }
        return nil
    }
    
    func getProductList(completion: @escaping(ProductList?, NetworkErrors?) -> ()) {
        guard let url = Paths.productList.url else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = self.connectionHandle(response: response, error: error) {
                completion(nil, error)
                return
            }
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(ProductList.self, from: data)
                completion(result, nil)
            } catch {
                print(error)
                completion(nil, NetworkErrors.dataPharseError(error: error))
            }
        }.resume()
    }

    func getProductDetail(completion: @escaping(DetailProduct?, NetworkErrors?) -> ()) {
        guard let url = Paths.productDetail.url else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = self.connectionHandle(response: response, error: error) {
                completion(nil, error)
                return
            }
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(DetailProduct.self, from: data)
                completion(result, nil)
            } catch {
                print(error)
                completion(nil, NetworkErrors.dataPharseError(error: error))
            }
        }.resume()
    }

    func getCart(completion: @escaping(Cart?, NetworkErrors?) -> ()) {
        guard let url = Paths.cart.url else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = self.connectionHandle(response: response, error: error) {
                completion(nil, error)
                return
            }
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(Cart.self, from: data)
                completion(result, nil)
            } catch {
                print(error)
                completion(nil, NetworkErrors.dataPharseError(error: error))
            }
        }.resume()
    }
}
