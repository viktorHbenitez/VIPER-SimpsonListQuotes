//
//  QuotesView.swift
//  VIPER-ListSimpsonQuotes
//
//  Created by Victor Hugo Benitez Bosques on 19/11/20.
//  
//

import Foundation
import UIKit

class QuotesView: UIViewController {

    // MARK: Properties
    var presenter: QuotesPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension QuotesView: QuotesViewProtocol {
    // TODO: implement view output methods
}
