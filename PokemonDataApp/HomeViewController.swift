//
//  HomeViewController.swift
//  PokemonDataApp
//
//  Created by 渡邉凌 on 2022/01/30.
//

import Foundation
import UIKit
import Alamofire

class HomeViewController: UIViewController{
    
    private let cellId = "cellId"
    var pokemonList = [Models]()
    var pokemonData: Pokemon?
    var pokemonTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        setData()
        request()
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
        
//        let pokemon1 = Models(id: 1, name: "フシギソウ", imageUrl: "https://sp2.raky.net/poke/icon96/n1.gif")
//        let pokemon2 = Models(id: 2, name: "フシギソウ", imageUrl: "https://sp2.raky.net/poke/icon96/n2.gif")
//        let pokemon3 = Models(id: 3, name: "フシギバナ", imageUrl: "https://sp2.raky.net/poke/icon96/n3.gif")
//        pokemonList = [pokemon1, pokemon2, pokemon3]
        
        
        
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
    
    
    
    func request(){
        AF.request("https://sp2.raky.net/poke/icon96/n1.gif",
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: nil)
            .response { response in
                guard let data = response.data else { return }
                
                do{
                    self.pokemonData = try JSONDecoder().decode(Pokemon.self, from: data)
    //                return pokemon
    //                print(pokemon)
    //                print(type(of: pokemon))
                }catch{
                    print("error")
                }
            }
    }
    
    func 
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
        cell.pokemonImageView.image = getImageByUrl(url: pokemonList[indexPath.row].imageUrl)
        
        
        
        return cell
    }
    
    
}
