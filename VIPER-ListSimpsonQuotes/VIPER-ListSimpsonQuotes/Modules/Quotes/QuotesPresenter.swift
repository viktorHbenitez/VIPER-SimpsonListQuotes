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
    var viewModelQuotes: [QuoteViewModel]?
}

extension QuotesPresenter: QuotesPresenterProtocol {
    func refresh() {
        interactor?.loadQuote()
    }
    
    func numberOfRowsInSection() -> Int {
        self.viewModelQuotes?.count ?? 0
    }
    
    func textLabelText(indexPath: IndexPath) -> String? {
        guard let viewModel = self.viewModelQuotes else {return nil}
        return viewModel[indexPath.row].label
    }
    
    func didSelectRowAt(index: Int) {
        
    }
    
    func deselectRowAt(index: Int) {
        
    }

    func viewDidLoad() {
        view?.showHUD()
        interactor?.loadQuote()
    }
}

extension QuotesPresenter: QuotesInteractorOutputProtocol {
    func didFetchDataInteractor(data: [Quote]) {
        self.viewModelQuotes = data.compactMap{QuoteViewModel(quotes: $0)}
        view?.hideHUD()
        view?.onFetchQuotesSuccess()
    }
    
    func didFetchDataError(code: Int) {
        view?.hideHUD()
        view?.onFetchQuotesFailure(error: "Couldn't fetch quoes \(code)")
    }
    
}


struct QuoteViewModel{
    var quotes: Quote
    init(quotes: Quote){
        self.quotes = quotes
    }
    
    var label: String{
        return self.quotes.quote ?? ""
    }
}
