//
//  QuotesWireFrame.swift
//  VIPER-ListSimpsonQuotes
//
//  Created by Victor Hugo Benitez Bosques on 19/11/20.
//  
//

import Foundation
import UIKit

class QuotesWireFrame: QuotesWireFrameProtocol {
  
  class func createQuotesModule() -> UINavigationController {
    
    // View
    let viewController = QuotesView()
    let navigationController = UINavigationController(rootViewController: viewController)
    
    let presenter: QuotesPresenterProtocol & QuotesInteractorOutputProtocol = QuotesPresenter()
    let interactor: QuotesInteractorInputProtocol & QuotesRemoteDataManagerOutputProtocol = QuotesInteractor()
    let localDataManager: QuotesLocalDataManagerInputProtocol = QuotesLocalDataManager()
    let remoteDataManager: QuotesRemoteDataManagerInputProtocol = QuotesRemoteDataManager()
    let wireFrame: QuotesWireFrameProtocol = QuotesWireFrame()
    
    viewController.presenter = presenter
    
    presenter.view = viewController
    presenter.wireFrame = wireFrame
    presenter.interactor = interactor
    
    interactor.presenter = presenter
    interactor.localDatamanager = localDataManager
    interactor.remoteDatamanager = remoteDataManager
    remoteDataManager.remoteRequestHandler = interactor
    
    
    return navigationController
  }
  
  
  func pushToQuoteDetail(with view: QuotesViewProtocol
                         , _ quotesElement: Quote){
    
    if let viewController = view as? QuotesView{
      viewController.navigationController?.pushViewController( DetailQuotesWireFrame.createDetailQuotesModule(with: quotesElement) , animated: true)
    }
  }
  
}
