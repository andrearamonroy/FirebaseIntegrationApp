//
//  LevelsViews.swift
//  SlowFrenchApp
//
//  Created by Andrea on 8/27/22.
//

import SwiftUI

struct LevelsView: View {
    //@StateObjectsouce of truth, creates an observable object in the view. @Observed object when you created the object in another view and your passing it
   
    @ObservedObject private var viewModel = FirestoreManager()
    
    var body: some View {
       
        VStack{
            ForEach(viewModel.levels){ level in
                    LevelButton(levelButton: level)
                } .padding()
            }
           
            .navigationTitle("Levels")
        }
      
        /*
        .onAppear() {
            self.viewModel.fetchData()           
        }*/
    }


struct LevelButton: View {
        var levelButton : Level
        var body: some View {
            
                Text(levelButton.levelName) //using var to access a property in a struct
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(.purple)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(7)
                        .overlay(RoundedRectangle(cornerRadius: 40).stroke(.purple, lineWidth: 5))
            }
}

