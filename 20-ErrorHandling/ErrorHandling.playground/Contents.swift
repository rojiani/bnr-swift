import UIKit

enum Token {
    case Number(Int)
    case Plus
}


class Lexer {
    
    enum Error: ErrorType {
        case InvalidCharacter(Character)
    }
    
    let input: String.CharacterView
    var position: String.CharacterView.Index
    
    init(input: String) {
        self.input = input.characters
        self.position = input.characters.startIndex
    }
    
    /// Builds up integers one digit at a time
    /// - returns: the parsed integer
    func getNumber() -> Int {
        var value = 0
        
        while let nextCharacter = peek() {
            switch nextCharacter {
                case "0" ... "9":
                    // Another digit - add it into value
                    let digitValue = Int(String(nextCharacter))!    // Since you know nextCharacter is a digit, this will not fail
                    value = (10 * value) + digitValue
                    advance()
                
                default:
                    // A non-digit
                    return value
            }
        }
        
        return value
    }

    /// Get the character at the current position
    /// - parameters: 
    ///     - None
    /// - returns: The Character at the current position, or nil
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }

    /// Advance the lexer's current position
    func advance() {
        assert(position < input.endIndex, "Cannot advance past the end of the input!")
        position = position.successor()
    }
    
    /// Lexing function
    /// - returns: Array of tokens
    /// - throws: `Lexer.Error.InvalidCharacter` if unexpected
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            switch nextCharacter {
                case "0" ... "9":
                    let value = getNumber()
                    tokens.append(.Number(value))
                
                case "+":
                    tokens.append(.Plus)
                    advance()
                
                case " ":
                    // ignore spaces
                    advance()
                
                default:
                    // Something unexpected - need to send back an error
                    throw Error.InvalidCharacter(nextCharacter)
            }
        }
        
        return tokens
    }
}


func evaluate(input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
    } catch Lexer.Error.InvalidCharacter(let character) {
        print("Input contained an invalid character: \(character)")
    } catch {
        print("An error occurred: \(error)")
    }
}

evaluate("10 + 3 + 5")

