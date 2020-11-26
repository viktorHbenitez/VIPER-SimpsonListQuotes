//
//  DetailQuotesInteractor.swift
//  VIPER-ListSimpsonQuotes
//
//  Created by Victor Hugo Benitez Bosques on 25/11/20.
//  
//

import Foundation

class DetailQuotesInteractor: DetailQuotesInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: DetailQuotesInteractorOutputProtocol?
    var localDatamanager: DetailQuotesLocalDataManagerInputProtocol?
    var remoteDatamanager: DetailQuotesRemoteDataManagerInputProtocol?
    
    var quote: Quote?
    
    func getDataFromInteractor() {
        guard let element = quote else {
            fatalError("Not element sending")
        }
        presenter?.getDatafromInteractor(element)
    }
    
}

extension DetailQuotesInteractor: DetailQuotesRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
