//
//  DetailQuotesPresenter.swift
//  VIPER-ListSimpsonQuotes
//
//  Created by Victor Hugo Benitez Bosques on 25/11/20.
//  
//

import Foundation

class DetailQuotesPresenter  {
    
    // MARK: Properties
    weak var view: DetailQuotesViewProtocol?
    var interactor: DetailQuotesInteractorInputProtocol?
    var wireFrame: DetailQuotesWireFrameProtocol?
    
}

extension DetailQuotesPresenter: DetailQuotesPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.getDataFromInteractor()
    }
}

extension DetailQuotesPresenter: DetailQuotesInteractorOutputProtocol {
  func getDataFromURLSucces(quote: Quote, data: Data?) {
    
    print("Presenter receives the result from Interactor after it's done its job.")
    
    guard let quoteElement = quote.quote, let character = quote.character, let data = data else {return }
    
    view?.onGetImageFromURLSuccess(quoteElement, character: character, image: ImageDataService.shared.convertToUIImage(from: data))
    
  }
  
  func getImageFromURLFailure(_ quote: Quote) {
    guard let quoteElement = quote.quote,
          let character = quote.character else {return}
    view?.onGetImageFromURLFailure(quoteElement, character: character)
  }
  
    
}
