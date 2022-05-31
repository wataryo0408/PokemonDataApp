//
//  Model.swift
//  PokemonDataApp
//
//  Created by 渡邉凌 on 2022/02/02.
//

import Foundation
import UIKit
struct Pokemon: Decodable {
   var id: Int
   var name: String
   var sprites: Sprites
   var typeList: [TypeList]
   struct Sprites: Decodable {
       var frontDefault: String
       private enum CodingKeys: String, CodingKey {
           case frontDefault = "front_default"
       }
   }
   struct TypeList: Decodable {
       var type: Type
       struct `Type`: Decodable {
           var name = "name"
           private enum CodingKeys: String, CodingKey {
               case name = "name"
           }
       }
       private enum CodingKeys: String, CodingKey {
           case type = "type"
       }
   }

   private enum CodingKeys: String, CodingKey {
       case id = "id"
       case name = "name"
       case sprites = "sprites"
       case typeList = "types"
   }
}

struct Models: Codable{
   var id: Int
   var name: String
   var imageUrl: String
}
