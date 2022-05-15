//
//  HomeVC.swift
//  netflixApp
//
//  Created by Dilara Şimşek on 12.05.2022.
//

import UIKit

class HomeVC: UIViewController {
    
    //created tableview programatically
    private let homeFeedTable: UITableView = {
       
        let tableHome = UITableView(frame: .zero, style: .grouped)
        tableHome.register(CollectionViewTBC.self, forCellReuseIdentifier: CollectionViewTBC.identifier)
        return tableHome
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(homeFeedTable) //tableview added to view
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self

    }
    
    //give frame to tableview
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //tüm ekranı kaplasın
        homeFeedTable.frame = view.bounds
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTBC.identifier, for: indexPath) as? CollectionViewTBC else {
            
            return UITableViewCell()
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    
}
