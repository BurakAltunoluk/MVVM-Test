//
//  ViewModel.swift
//  Api-MVVM
//
//  Created by Burak Altunoluk on 28/10/2022.
//

import Foundation

struct CommentViewModel {
    
    var comment: Comment
    
    var bodyEkrem: String {
        
        return self.comment.body
        
    }
    
    init(_ commentElement: Comment) {
        self.comment = commentElement
    }
    
}

struct UserViewModel {
    
    var user: User
    
    var username: String {
        
        return self.user.username
        
    }
    
    init(_ userElement: User) {
        self.user = userElement
    }

}

struct CommentListViewModel {
    
    var commentList = [Comment]()
    
    func numberOfRow() ->Int {
        return self.commentList.count 
    }
    
    func getDataFromAPI(completion: @escaping([Comment]) ->()) {
        
       let url = URL(string: "https://dummyjson.com/comments")!
       
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
          
                let listArray = try? JSONDecoder().decode(Welcome.self, from: data)
            
                completion(listArray!.comments)
                
             
              
            }
            
        }.resume()
        
        
    }
    
    func showComment(_ index : Int) -> CommentViewModel {
        let choosedComments = commentList[index]
        return CommentViewModel(choosedComments)
    }
    
    
}
