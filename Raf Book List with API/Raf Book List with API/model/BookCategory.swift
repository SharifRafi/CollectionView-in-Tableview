//
//  RootClass.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on January 21, 2020
//
import Foundation
import SwiftyJSON

struct BookCategory {

	let bookcategoryName: String?
	let book: [Book]?

	init(_ json: JSON) {
		bookcategoryName = json["bookcategoryName"].stringValue
		book = json["book"].arrayValue.map { Book($0) }
	}

}
