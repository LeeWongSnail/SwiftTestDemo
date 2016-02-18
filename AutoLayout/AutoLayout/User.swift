//
//  User.swift
//  AutoLayout
//
//  Created by LeeWong on 16/2/18.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import Foundation

struct User {
    let name : String
    let company : String
    let login : String
    let password : String
    
    static let database : Dictionary<String,User> = {
        
        var theDatabase = Dictionary<String,User>()
        
        for user in [
            User(name: "LeeWong", company: "ArtBox", login: "Lee", password: "Lee"),
            User(name: "Leoliu", company: "DesignBox", login: "leo", password: "leo")
            ]{
                theDatabase[user.login] = user
        }
        
        return theDatabase
    }()
    
    
    static func login(login:String,passwd:String) -> User? {
        if let user = database[login] {
            if user.password == passwd {
                return user
            }
        }
        return nil
    }
}