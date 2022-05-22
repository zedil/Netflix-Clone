//
//  HomeVC.swift
//  netflixApp
//
//  Created by Dilara Şimşek on 12.05.2022.
//

import UIKit


enum Sections: Int {
    case TrendMovies = 0
    case TrendTv = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}




class HomeVC: UIViewController {
    
    let sectionTitles: [String] = ["Trending Movies", "Trending Tv" ,"Popular" ,"Upcoming Movies", "Top rated"]
    
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
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
        
        customNavBar()
        
        getTrendMovies()

    }
    
    private func customNavBar() {
        var image = UIImage(named: "netflixImage")
        image = image?.withRenderingMode(.alwaysOriginal)
        //navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        
        navigationController?.navigationBar.tintColor = .systemOrange
        
    }
    
    //give frame to tableview
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //tüm ekranı kaplasın
        homeFeedTable.frame = view.bounds
    }
    
    private func getTrendMovies() {
        /*
        APICaller.shared.getTrendingTvs { results in
            
        }
        
        
        APICaller.shared.getTrendMovies { results in
            switch results {
            case .success(let movies):
                print(movies)
                
            case .failure(let error):
                print(error)
            }
            
        } */
        
        APICaller.shared.getPopularMovie { _ in
            
        }

    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
        
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
    
    //titles
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .systemOrange
        header.textLabel?.text = header.textLabel?.text?.capitalFirstLetter()
    }
    
    
    //set navigation bar with scrolling behaviour
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    
    
}
