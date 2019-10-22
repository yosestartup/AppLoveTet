//
//  ProfilesPresenter.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

class ProfilesPresenter: BasePresenter {

    weak var view: ProfilesViewProtocol?
    private var wireFrame: ProfilesWireFrameProtocol
    private var interactor: ProfilesInteractorProtocol

    init(view: ProfilesViewProtocol, wireFrame: ProfilesWireFrameProtocol, interactor: ProfilesInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireFrame
    }
}

extension ProfilesPresenter: ProfilesPresenterProtocol {
    func didClick(user: UserModel) {
        self.wireFrame.presentProfileDetail(from: self.view, user: user)
    }
    
    func fetchUsers() {
        self.view?.showLoading(message: "Loading...")
        self.interactor.fetchUsers { (models, error) in
            if let error = error {
                self.view?.showOkAlertController(title: "Error", message: error.localizedDescription, callback: nil)
                
            self.view?.hideLoading()
            return
        }
            
        if let models = models {
            let convertedModels = UserModel.convert(from: models)
            self.view?.insertUsers(users: convertedModels)
 
            self.view?.hideLoading()
            return
        }
            
        self.view?.hideLoading()
        
        }
    }
}
