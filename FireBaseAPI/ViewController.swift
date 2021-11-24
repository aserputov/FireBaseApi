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
        // Do any additional setup after loading the view.
    }

    @IBAction func get(_ sender: Any) {
        db.collection("movies").getDocuments { queryResults, error in
            if let err = error{
                print(err)
                return
            }
            print(queryResults!.count)
        }
    }
    
    @IBAction func save(_ sender: Any) {
    }
}

