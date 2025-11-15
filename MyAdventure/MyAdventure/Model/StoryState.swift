//
//  StoryState.swift
//  MyAdventure
//
import Foundation

enum StoryState {
    // Starting state
    case start
    
    // Layer 2 states
    case bootstrapAlone
    case findCofounder
    
    // Layer 3 states
    case bootstrapMVP
    case bootstrapInvestors
    case cofounderMVP
    case cofounderInvestors
    
    // Ending states
    case ipoSuccess
    case acquisition
    case moderateSuccess
    case bankruptcy
}

