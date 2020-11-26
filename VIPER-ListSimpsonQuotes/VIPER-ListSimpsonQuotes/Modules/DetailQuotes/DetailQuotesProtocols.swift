//
//  DetailQuotesProtocols.swift
//  VIPER-ListSimpsonQuotes
//
//  Created by Victor Hugo Benitez Bosques on 25/11/20.
//  
//

import Foundation
import UIKit

protocol DetailQuotesViewProtocol: class {
  // PRESENTER -> VIEW
  var presenter: DetailQuotesPresenterProtocol? { get set }
  
  func onGetImageFromURLSuccess(_ quote: String, character: String, image: UIImage)
  func onGetImageFromURLFailure(_ quote: String, character: String)
}

protocol DetailQuotesWireFrameProtocol: class {
  // PRESENTER -> WIREFRAME
  static func createDetailQuotesModule(with quote: Quote) -> UIViewController
}

protocol DetailQuotesPresenterProtocol: class {
  // VIEW -> PRESENTER
  var view: DetailQuotesViewProtocol? { get set }
  var interactor: DetailQuotesInteractorInputProtocol? { get set }
  var wireFrame: DetailQuotesWireFrameProtocol? { get set }
  
  func viewDidLoad()
}

protocol DetailQuotesInteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
  
  func getDataFromURLSucces(quote: Quote, data: Data?)
  func getImageFromURLFailure(_ quote: Quote)
  
}

protocol DetailQuotesInteractorInputProtocol: class {
  // PRESENTER -> INTERACTOR
  var presenter: DetailQuotesInteractorOutputProtocol? { get set }
  var localDatamanager: DetailQuotesLocalDataManagerInputProtocol? { get set }
  var remoteDatamanager: DetailQuotesRemoteDataManagerInputProtocol? { get set }
  var quote: Quote? {get set}
  
  func getDataFromInteractor()
}

protocol DetailQuotesDataManagerInputProtocol: class {
  // INTERACTOR -> DATAMANAGER
}

protocol DetailQuotesRemoteDataManagerInputProtocol: class {
  // INTERACTOR -> REMOTEDATAMANAGER
  var remoteRequestHandler: DetailQuotesRemoteDataManagerOutputProtocol? { get set }
}

protocol DetailQuotesRemoteDataManagerOutputProtocol: class {
  // REMOTEDATAMANAGER -> INTERACTOR
}

protocol DetailQuotesLocalDataManagerInputProtocol: class {
  // INTERACTOR -> LOCALDATAMANAGER
}
