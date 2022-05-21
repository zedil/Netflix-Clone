//
//  ViewController.swift
//  netflixApp
//
//  Created by Dilara Şimşek on 12.05.2022.
//

import UIKit

class MainTabbar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemCyan
            
        
        let vc1 = UINavigationController(rootViewController: HomeVC())
        let vc2 = UINavigationController(rootViewController: UpcomingVC())
        let vc3 = UINavigationController(rootViewController: SearchVC())
        let vc4 = UINavigationController(rootViewController: DownloadVC())
        
        
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        vc1.title = "Home"
        vc2.title = "ComingSoon"
        vc3.title = "Search"
        vc4.title = "Downloads"
        
        tabBar.tintColor = .systemOrange
        
        
        
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
    }
    


}

