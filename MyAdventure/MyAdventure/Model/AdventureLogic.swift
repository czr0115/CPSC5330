//
//  AdventureLogic.swift
//  MyAdventure
//
import Foundation

class AdventureLogic {
    private var currentState = StoryState.start
    private var pathHistory: [StoryState] = []
    
    init() {
        pathHistory.append(currentState)
    }
    
    func getCurrentAdventure() -> Adventure {
        switch currentState {
        case .start:
            return Adventure(
                state: .start,
                storyText: "You have a brilliant idea for PetPal - an AI app that translates your pet's sounds into human language! You have $10,000 in savings. What's your first move?",
                choice1Text: "Bootstrap alone - I don't need anyone!",
                choice2Text: "Find a co-founder - Teamwork!",
                isEnding: false
            )
            
        case .bootstrapAlone:
            return Adventure(
                state: .bootstrapAlone,
                storyText: "Going solo! Your garage is now PetPal HQ. Your dog is employee #1 and seems skeptical. How do you proceed?",
                choice1Text: "Build MVP - Dogs will talk!",
                choice2Text: "Seek investors - Show me money!",
                isEnding: false
            )
            
        case .findCofounder:
            return Adventure(
                state: .findCofounder,
                storyText: "You found Dr. Sarah Chen, a veterinary AI researcher! She loves the idea and her cat is very interested. What's the plan?",
                choice1Text: "Build MVP with her expertise!",
                choice2Text: "Use her MIT connections for funding!",
                isEnding: false
            )
            
        case .bootstrapMVP:
            return Adventure(
                state: .bootstrapMVP,
                storyText: "Your app is live! Dogs are 'speaking' but some users say it just sounds like fortune cookies for pets. Critical decision time!",
                choice1Text: "Pivot to pet health monitoring",
                choice2Text: "Dogs don't lie - stay the course!",
                isEnding: false
            )
            
        case .bootstrapInvestors:
            return Adventure(
                state: .bootstrapInvestors,
                storyText: "VCs think you're barking mad. 'Where's your co-founder?' they ask. Your dog is not considered a valid co-founder apparently.",
                choice1Text: "Pivot to pet dating app",
                choice2Text: "Prove solo founders can win!",
                isEnding: false
            )
            
        case .cofounderMVP:
            return Adventure(
                state: .cofounderMVP,
                storyText: "The app goes viral on TikTok! #MyDogFinallySpeaks has 10M views but your servers are melting faster than ice cream in summer!",
                choice1Text: "Pivot to enterprise vet clinics",
                choice2Text: "Scale up - pets worldwide need this!",
                isEnding: false
            )
            
        case .cofounderInvestors:
            return Adventure(
                state: .cofounderInvestors,
                storyText: "Sequoia Capital loves it! They offer $2M but want you to add cat translations ASAP. Dogs are offended.",
                choice1Text: "Pivot - Duolingo for pet speak!",
                choice2Text: "Stay focused on dogs first!",
                isEnding: false
            )
            
        // Endings
        case .ipoSuccess:
            return Adventure(
                state: .ipoSuccess,
                storyText: "🚀 SUCCESS! PetPal goes public at $1B valuation! Dogs ring the opening bell at NYSE! Every pet owner wants the app. You're on the cover of Forbes with your dog!",
                choice1Text: nil,
                choice2Text: nil,
                isEnding: true
            )
            
        case .acquisition:
            return Adventure(
                state: .acquisition,
                storyText: "🎯 ACQUIRED! Google buys PetPal for $100M! They integrate it with Google Assistant. Your dog gets stock options. Nice exit!",
                choice1Text: nil,
                choice2Text: nil,
                isEnding: true
            )
            
        case .moderateSuccess:
            return Adventure(
                state: .moderateSuccess,
                storyText: "💰 MODERATE SUCCESS! PetPal has 50K happy subscribers. You're making good money and can finally understand what your dog wants for dinner. Living the dream!",
                choice1Text: nil,
                choice2Text: nil,
                isEnding: true
            )
            
        case .bankruptcy:
            return Adventure(
                state: .bankruptcy,
                storyText: "💔 BANKRUPTCY! PetPal is dead. The office is empty. Your dog looks at you sympathetically, probably saying 'I told you so' but you'll never know for sure...",
                choice1Text: nil,
                choice2Text: nil,
                isEnding: true
            )
        }
    }
    
    func makeChoice(_ choiceNumber: Int) {
        switch currentState {
        case .start:
            currentState = choiceNumber == 1 ? .bootstrapAlone : .findCofounder
            
        case .bootstrapAlone:
            currentState = choiceNumber == 1 ? .bootstrapMVP : .bootstrapInvestors
            
        case .findCofounder:
            currentState = choiceNumber == 1 ? .cofounderMVP : .cofounderInvestors
            
        case .bootstrapMVP:
            currentState = choiceNumber == 1 ? .moderateSuccess : .acquisition
            
        case .bootstrapInvestors:
            currentState = choiceNumber == 1 ? .bankruptcy : .moderateSuccess
            
        case .cofounderMVP:
            currentState = choiceNumber == 1 ? .bankruptcy : .ipoSuccess
            
        case .cofounderInvestors:
            currentState = choiceNumber == 1 ? .acquisition : .ipoSuccess
            
        default:
            break // Endings have no choices
        }
        
        pathHistory.append(currentState)
    }
    
    func restart() {
        currentState = .start
        pathHistory = [.start]
    }
    
    func getPathSummary() -> String {
        var summary = "Your journey: "
        for state in pathHistory {
            switch state {
            case .start: summary += "Had idea → "
            case .bootstrapAlone: summary += "Went solo → "
            case .findCofounder: summary += "Found partner → "
            case .bootstrapMVP: summary += "Built MVP → "
            case .bootstrapInvestors: summary += "Sought funding → "
            case .cofounderMVP: summary += "Built together → "
            case .cofounderInvestors: summary += "Got investment → "
            case .ipoSuccess: summary += "IPO! 🚀"
            case .acquisition: summary += "Got acquired! 🎯"
            case .moderateSuccess: summary += "Succeeded! 💰"
            case .bankruptcy: summary += "Failed 💔"
            }
        }
        return summary
    }
}

