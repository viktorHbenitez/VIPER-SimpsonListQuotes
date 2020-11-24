//
//  QuotesInteractor.swift
//  VIPER-ListSimpsonQuotes
//
//  Created by Victor Hugo Benitez Bosques on 19/11/20.
//  
//

import Foundation

class QuotesInteractor: QuotesInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: QuotesInteractorOutputProtocol?
    var localDatamanager: QuotesLocalDataManagerInputProtocol?
    var remoteDatamanager: QuotesRemoteDataManagerInputProtocol?
    var quotes: [Quote?]?
    
    func loadQuote() {
        remoteDatamanager?.fetchDataFromWorker()
    }

}

extension QuotesInteractor: QuotesRemoteDataManagerOutputProtocol {
    func didFetchDataSuccess(data: [Quote]) {
        self.quotes = data
        self.presenter?.didFetchDataInteractor(data: data)
    }
    
    func didFetchDataFail(code: Int) {
        self.presenter?.didFetchDataError(code: code)
    }
  
}
