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
    
    func loadQuote() {
        
        
        
        
    }

}

extension QuotesInteractor: QuotesRemoteDataManagerOutputProtocol {
   
    // TODO: Implement use case methods
    
}
