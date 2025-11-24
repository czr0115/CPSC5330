//
//  Park.swift
//  NationalParks
//
import Foundation

struct Park {
    let name: String
    let state: String
    let location: String
    let yearEstablished: Int
    let size: String
    let bestTimeToVisit: String
}

let parksData: [Park] = [
    Park(name: "Yellowstone", state: "WY", location: "Wyoming, Montana, Idaho", yearEstablished: 1872, size: "2.2 million acres", bestTimeToVisit: "May - September"),
    Park(name: "Yosemite", state: "CA", location: "Central California", yearEstablished: 1890, size: "759,620 acres", bestTimeToVisit: "May - October"),
    Park(name: "Grand Canyon", state: "AZ", location: "Northern Arizona", yearEstablished: 1919, size: "1.2 million acres", bestTimeToVisit: "March - May"),
    Park(name: "Zion", state: "UT", location: "Southwestern Utah", yearEstablished: 1919, size: "147,243 acres", bestTimeToVisit: "April - October"),
    Park(name: "Acadia", state: "ME", location: "Maine Coast", yearEstablished: 1919, size: "49,075 acres", bestTimeToVisit: "June - October"),
    Park(name: "Rocky Mountain", state: "CO", location: "Northern Colorado", yearEstablished: 1915, size: "265,807 acres", bestTimeToVisit: "June - September"),
    Park(name: "Great Smoky Mountains", state: "TN/NC", location: "Tennessee and North Carolina", yearEstablished: 1934, size: "522,427 acres", bestTimeToVisit: "Year-round"),
    Park(name: "Olympic", state: "WA", location: "Northwestern Washington", yearEstablished: 1938, size: "922,649 acres", bestTimeToVisit: "June - September"),
    Park(name: "Joshua Tree", state: "CA", location: "Southern California", yearEstablished: 1994, size: "790,636 acres", bestTimeToVisit: "October - May"),
    Park(name: "Glacier", state: "MT", location: "Northern Montana", yearEstablished: 1910, size: "1 million acres", bestTimeToVisit: "July - September"),
    Park(name: "Arches", state: "UT", location: "Eastern Utah", yearEstablished: 1971, size: "76,679 acres", bestTimeToVisit: "April - May"),
    Park(name: "Denali", state: "AK", location: "Interior Alaska", yearEstablished: 1917, size: "6 million acres", bestTimeToVisit: "June - August")
]
