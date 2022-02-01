//
//  HomeViewController.swift
//  PokemonDataApp
//
//  Created by 渡邉凌 on 2022/01/30.
//

import Foundation
import UIKit

class HomeViewController: UIViewController{
    
    private let cellId = "cellId"
    var pokemonList = [pokemon]()
    var pokemonTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        setData()
    }

    func setTableView(){
        
        pokemonTableView = UITableView(frame: self.view.bounds, style: .plain)
        pokemonTableView.backgroundColor = .blue
        pokemonTableView.showsVerticalScrollIndicator = false
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        pokemonTableView.register(UINib(nibName: "PokemonTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        self.view.addSubview(pokemonTableView)
    }
    
    func setData(){
        
        let pokemon1 = pokemon(id: 1, name: "フシギソウ", imageUrl: getImageByUrl(url: "https://sp2.raky.net/poke/icon96/n1.gif"))
        let pokemon2 = pokemon(id: 2, name: "フシギソウ", imageUrl: getImageByUrl(url: "https://sp2.raky.net/poke/icon96/n2.gif"))
        let pokemon3 = pokemon(id: 3, name: "フシギバナ", imageUrl: getImageByUrl(url: "https://sp2.raky.net/poke/icon96/n3.gif"))
        pokemonList = [pokemon1, pokemon2, pokemon3]
    }
    
    func getImageByUrl(url: String) -> UIImage{
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            print("成功")
            return UIImage(data: data)!
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        return UIImage()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    //cellの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    //cellの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    //cellの定義
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//        cell.textLabel?.text = models[indexPath.row]
        
        let cell = pokemonTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PokemonTableViewCell
        cell.pokemonIdLabel.text = "No.\(pokemonList[indexPath.row].id)"
        cell.pokemonNameLabel.text = pokemonList[indexPath.row].name
        cell.pokemonImageView.image = pokemonList[indexPath.row].imageUrl
        
        
        
        return cell
    }
    
    
}
