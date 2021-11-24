//
//  ViewController.swift
//  FireBaseAPI
//
//  Created by Anatoliy Serputov on 2021-11-24.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {

    @IBOutlet weak var movieTitl: UITextField!
    
    @IBOutlet weak var Id: UITextField!
    @IBOutlet weak var runTime: UITextField!
    
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
        
        guard let timeLab = runTime.text, let movieTitle = movieTitl.text else {
            print("Enter something better, please ")
            return
        }
        
        guard let runninTime = Int(timeLab) else {
            print("OK")
            return
        }
        
        let info:[String:Any] = ["title":movieTitle,"time":runninTime]
        
        db.collection("movies").addDocument(data: info){
            error in
            if let err = error{
                print(err)
            }
            print("Doc is ok")
        }
    }
    
    
    @IBAction func update(_ sender: Any) {
        
        db.collection("movies").document("EMWxeSz1wjgj5vIz80jF").setData(["title":"Dog"])
    }
    
}

