
//
//  Organization.swift
//  
//
//
import Foundation

struct Organziation {
	let organization_id: String?
	let message: URL?
	let date: Int?
  let createDate: Int?
}

extension Organization {
	private enum Keys: String, SerializationKey {
		case reputation
		case name = "display_name"
		case profileImage = "profile_image"
	}
	
	init(serialization: Serialization) {
		name = serialization.value(forKey: Keys.name)
		reputation = serialization.value(forKey: Keys.reputation)
		if let url: String = serialization.value(forKey: Keys.profileImage) {
			profileImageURL = URL(string: url)
		} else {
			profileImageURL = nil
		}
	}
}
