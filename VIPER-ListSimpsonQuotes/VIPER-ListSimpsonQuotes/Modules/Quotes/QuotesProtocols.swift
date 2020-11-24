//
//  QuotesProtocols.swift
//  VIPER-ListSimpsonQuotes
//
//  Created by Victor Hugo Benitez Bosques on 19/11/20.
//  
//

import Foundation
import UIKit

protocol QuotesViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: QuotesPresenterProtocol? { get set }
    
    func onFetchQuotesSuccess()
    func onFetchQuotesFailure(error: String)
    func showHUD()
    func hideHUD()
}

protocol QuotesWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createQuotesModule() -> UINavigationController
}

protocol QuotesPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: QuotesViewProtocol? { get set }
    var interactor: QuotesInteractorInputProtocol? { get set }
    var wireFrame: QuotesWireFrameProtocol? { get set }
    
    var viewModelQuotes: [QuoteViewModel]? {get set}
    
    func viewDidLoad()
    func refresh()
    
    func numberOfRowsInSection() -> Int
    func textLabelText(indexPath: IndexPath) -> String?
    
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)
}

protocol QuotesInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func didFetchDataInteractor(data: [Quote])
    func didFetchDataError(code: Int)
}

protocol QuotesInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: QuotesInteractorOutputProtocol? { get set }
    var localDatamanager: QuotesLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: QuotesRemoteDataManagerInputProtocol? { get set }
    
    func loadQuote()
}

protocol QuotesDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol QuotesRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: QuotesRemoteDataManagerOutputProtocol? { get set }
    func fetchDataFromWorker()
}

protocol QuotesRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func didFetchDataSuccess(data: [Quote])
    func didFetchDataFail(code: Int)
}

protocol QuotesLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
