//
//  FirebaseManager.swift
//  Firechat
//
//  Created by Johann Kerr on 3/23/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase



class FirebaseManager {
    
    class func login(email: String, password:String, completion: @escaping (Bool,Error?) -> ()) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if let user = user {
                print(user, "logged in")
                completion(true, nil)
            }
            if error != nil {
                print("there was an error")
                completion(false, error)
            }
        })
        
    }
    
    class func signUp(email: String,password:String) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            guard let user = user else {return}
            print(user)
        })
    }
    
    class func logOut() {
        let firebaseAuth = FIRAuth.auth()
        do { try firebaseAuth?.signOut()
            print("signed out")
        }
        catch let signOutError as NSError{
            print("error signing out as", signOutError)
        }
        
    }
    
}

