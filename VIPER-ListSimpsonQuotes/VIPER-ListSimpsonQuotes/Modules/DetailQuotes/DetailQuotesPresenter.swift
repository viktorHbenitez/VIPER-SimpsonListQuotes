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
    func getDatafromInteractor(_ quote: Quote) {
        
        
        view?.getSuccesData(quote: quote)
        
    }
  
}
