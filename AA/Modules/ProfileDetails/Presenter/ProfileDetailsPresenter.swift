//
//  ProfileDetailsPresenter.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

class ProfileDetailsPresenter: BasePresenter {

    weak var view: ProfileDetailsViewProtocol?
    private var wireFrame: ProfileDetailsWireFrameProtocol
    private var interactor: ProfileDetailsInteractorProtocol
    private var user: UserModel
    
    init(view: ProfileDetailsViewProtocol, wireFrame: ProfileDetailsWireFrameProtocol, interactor: ProfileDetailsInteractorProtocol, user: UserModel) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireFrame
        self.user = user
    }
    
    func getUserModel() -> UserModel {
        return self.user
    }
}

extension ProfileDetailsPresenter: ProfileDetailsPresenterProtocol {
    func fetchPosts() {
        //self.view?.showLoading(message: "Loading...")

        self.interactor.fetchPosts(userId: String(self.user.id)) { (models, error) in
            if let error = error {
                self.view?.showOkAlertController(title: "Error", message: error.localizedDescription, callback: nil)
                       
            //self.view?.hideLoading()
            return
        }
                   
        if let models = models {
            let convertedModels = PostModel.convert(from: models)
            self.view?.insertPosts(posts: convertedModels)
        
            //self.view?.hideLoading()
            return
        }
                   
           // self.view?.hideLoading()
        }
    }
}
