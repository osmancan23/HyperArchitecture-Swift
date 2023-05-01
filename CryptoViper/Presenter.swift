//
//  Presenter.swift
//  CryptoViper
//
//  Created by Osmancan Akagündüz on 28.04.2023.
//

import Foundation


protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDidDownloadCrypto(result:Result<[Crypto],Error>)
}


class CryptoPresenter : AnyPresenter {
   
    var view: AnyView?
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
    
        switch result {
        case .success(let cryptos):
            self.view?.update(with: cryptos)
        case .failure(let error):
            self.view?.update(with: error.localizedDescription)
        }
    }
    
}
