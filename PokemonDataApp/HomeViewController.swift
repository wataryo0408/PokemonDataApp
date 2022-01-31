//
//  HomeViewController.swift
//  PokemonDataApp
//
//  Created by 渡邉凌 on 2022/01/30.
//

import Foundation
import UIKit

class HomeViewController: UIViewController{
   
    
    var models = [
    
        "フシギダネ",
        "フシギソウ",
        "フシギバナ"

    ]
    
    var pokemonTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        pokemonTableView = UITableView(frame: self.view.bounds, style: .plain)
        pokemonTableView.backgroundColor = .blue
        pokemonTableView.showsVerticalScrollIndicator = false
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        
        self.view.addSubview(pokemonTableView)
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    //cellの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    //cellの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    //cellの定義
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = models[indexPath.row]
        
        return cell
    }
    
    
}
