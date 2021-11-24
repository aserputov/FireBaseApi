//
//  ViewController.swift
//  FireBaseAPI
//
//  Created by Anatoliy Serputov on 2021-11-24.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {

    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var time: UITextField!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ok ")
        // Do any additional setup after loading the view.
    }

    @IBAction func get(_ sender: Any) {
//        print("Place a string here, and a variable ")
     
        db.collection("movies").getDocuments { (results, error) in
            if let err = error{
                print("shot")
                print(err)
                return
            }
            print(results!.count)
            
            for document in results!.documents{
//                print(document.documentID)
//                print(document.data())
                let dc = document.data()
                print(dc["time"])
                print(dc["title"])
            }
         
        }
            
            
    
            
       
    }
    
    @IBAction func save(_ sender: Any) {
    }
}

