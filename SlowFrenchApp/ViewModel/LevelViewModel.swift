//
//  LevelViewModel.swift
//  SlowFrenchApp
//
//  Created by Andrea on 8/27/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


class FirestoreManager : ObservableObject {
    
    //watch for changes
    //instansiates an empty array
    @Published var levels = [Level]()
    
    //handle for default firestore
    private var db = Firestore.firestore()
    
    init(){
        fetchData()
    }
    
    //snapshot: when something changes in the db it changes in the app
    //snapshotListener has 2 parameters, the querrySnapshot holds the documents from the collection
    func fetchData() {
        db.collection("levels").addSnapshotListener { (querrySnapshot, error ) in
            //make sure we get a collection of documents
            guard let documents =  querrySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.levels = documents.compactMap{ (queryDocumentSnapshot) -> Level? in
                return try? queryDocumentSnapshot.data(as: Level.self)} //using Codable
            }
        }
    /*
    func getRatingsSubcollection() {
            // [START get_ratings_subcollection]
            db.collection("levels")
                .document("1")
                .collection("1")
                .getDocuments { (querySnapshot, error) in
                    guard let documents =  querrySnapshot?.documents else {
                        print("No documents")
                        return
                    }
                }
        
        
//                .getDocuments() { (querySnapshot, err) in
//            }
//
   
    */
    
    }
    



