//
//  PokemonTableViewCell.swift
//  PokemonDataApp
//
//  Created by 渡邉凌 on 2022/01/31.
//

import Foundation
import UIKit

class PokemonTableViewCell: UITableViewCell{
    
    let pokemonTableViewCell = UITableViewCell()
    
//    var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIdLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pokemonImageView.backgroundColor = .red
        
    }
    
}
