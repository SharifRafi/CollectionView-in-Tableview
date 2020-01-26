//
//  Book.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on January 21, 2020
//
import Foundation
import SwiftyJSON

struct Book {

	let pk: Int?
	let bookName: String?

	init(_ json: JSON) {
		pk = json["pk"].intValue
		bookName = json["bookName"].stringValue
	}

}
