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
    
    print("Interactor receives the request from Presenter to get image data from the server.")
    
    guard let quote = self.quote, let quotesImege = quote.image else { return }
    KingfisherService.shared.loadImageFrom(urlString: quotesImege) { data  in
      self.presenter?.getDataFromURLSucces(quote: quote, data: data)
    } failure: { error in
      self.presenter?.getImageFromURLFailure(quote)
    }
  }
  
}

extension DetailQuotesInteractor: DetailQuotesRemoteDataManagerOutputProtocol {
  // TODO: Implement use case methods
}
