//
//  QuotesRemoteDataManager.swift
//  VIPER-ListSimpsonQuotes
//
//  Created by Victor Hugo Benitez Bosques on 19/11/20.
//  
//

import Foundation

class QuotesRemoteDataManager:QuotesRemoteDataManagerInputProtocol {
    var remoteRequestHandler: QuotesRemoteDataManagerOutputProtocol?
    var apiWorker: QuoteAPIWorkerProtocol
    
    
    init(with worker: QuoteAPIWorkerProtocol = QuotesService()) {
        self.apiWorker = worker
    }
    
    func fetchDataFromWorker() {
        self.apiWorker.loadQuotes { [weak self] code, quoteElement in
            guard let `self` = self else {return}
            self.remoteRequestHandler?.didFetchDataSuccess(data: quoteElement)
        } failure: { code in
            self.remoteRequestHandler?.didFetchDataFail(code: code)
        }
    }
}

protocol QuoteAPIWorkerProtocol {
    func loadQuotes(success: @escaping (Int, [Quote]) -> Void,
                     failure: @escaping (Int) -> Void)
}

class QuotesService: QuoteAPIWorkerProtocol{
    
    func loadQuotes(success: @escaping (Int, [Quote]) -> Void,
                     failure: @escaping (Int) -> Void){
        
        QuoteService.shared.getQuotes(count: 6, success: { (code, quotes) in
            success(code, quotes)
        }) { (code) in
            failure(code)
        }
    }
    
    
}


