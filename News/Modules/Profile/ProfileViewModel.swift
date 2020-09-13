//
//  ProfileViewModel.swift
//  News
//
//  Created by Nguyen The Phuong on 9/13/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import Foundation
import RxSwift

struct ProfileViewModel: ViewModelType {
    struct Input {
        let keyword: Observable<String>
    }
    
    struct Output {
        let user: User?
        let updateUserStream: Observable<Void>
    }
    
    func transform(input: Input) -> Output {
        let user = CoreDataManager.shared.getCurrentUser()
        let updateUserStream = input.keyword.map { keyword -> Void in
            user?.category = keyword
            try? CoreDataManager.shared.saveContext()
        }
        return Output(
            user: user,
            updateUserStream: updateUserStream
        )
    }
}
