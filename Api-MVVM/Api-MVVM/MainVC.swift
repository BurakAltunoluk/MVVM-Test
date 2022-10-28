//
//  ViewController.swift
//  Api-MVVM
//
//  Created by Burak Altunoluk on 28/10/2022.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var commentListViewModel : CommentListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setup()
     
    }

    func setup() {
      
        
        let viewmodel = CommentListViewModel()
        
        viewmodel.getDataFromAPI { datam in
        
            self.commentListViewModel = CommentListViewModel(commentList: datam)
            self.reloadTableView()
        }
    }
    
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.commentListViewModel == nil ? 0 : commentListViewModel.numberOfRow()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        cell.textLabel?.text = commentListViewModel.showComment(indexPath.row).bodyEkrem
        return cell
    }








}
