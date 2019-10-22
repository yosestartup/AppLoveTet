//
//  BaseNavigationControllerPresenter.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

class BaseNavigationControllerPresenter: BasePresenter {

    weak var view: BaseNavigationControllerViewProtocol?
    private var wireFrame: BaseNavigationControllerWireFrameProtocol
    private var interactor: BaseNavigationControllerInteractorProtocol

    init(view: BaseNavigationControllerViewProtocol, wireFrame: BaseNavigationControllerWireFrameProtocol, interactor: BaseNavigationControllerInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireFrame
    }
}

extension BaseNavigationControllerPresenter: BaseNavigationControllerPresenterProtocol { }
