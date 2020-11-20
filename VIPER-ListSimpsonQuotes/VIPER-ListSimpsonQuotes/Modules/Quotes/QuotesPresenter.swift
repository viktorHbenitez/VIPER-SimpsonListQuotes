//
//  QuotesPresenter.swift
//  VIPER-ListSimpsonQuotes
//
//  Created by Victor Hugo Benitez Bosques on 19/11/20.
//  
//

import Foundation

class QuotesPresenter  {
    
    // MARK: Properties
    weak var view: QuotesViewProtocol?
    var interactor: QuotesInteractorInputProtocol?
    var wireFrame: QuotesWireFrameProtocol?
    
}

extension QuotesPresenter: QuotesPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        
        
        // go to interactor layer and ejecuted a method
        // interactor fetch data
        
    }
}

extension QuotesPresenter: QuotesInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
