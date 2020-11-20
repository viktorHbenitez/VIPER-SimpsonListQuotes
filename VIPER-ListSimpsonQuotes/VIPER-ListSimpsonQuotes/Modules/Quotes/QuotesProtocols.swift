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
    
    func viewDidLoad()
}

protocol QuotesInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
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
}

protocol QuotesRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR

}

protocol QuotesLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}