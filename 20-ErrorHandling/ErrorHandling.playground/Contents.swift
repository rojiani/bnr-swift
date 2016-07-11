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

class Parser {
    
    enum Error: ErrorType {
        case UnexpectedEndOfInput
        case InvalidToken(Token)
    }
    
    let tokens: [Token]
    var position = 0
    
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    /// Get the next token, if one exists
    /// - returns: The next Token, or nil if no remaining tokens
    func getNextToken() -> Token? {
        guard position < tokens.endIndex else {
            return nil
        }
        let token = tokens[position]
        position += 1
        return token
    }
    
    /// Get the next number
    /// - returns: the next Integer
    /// - throws: `Parser.Error.UnexpectedEndOfInput` if no more tokens
    ///           `Parser.Error.InvalidToken` if token is not a number
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw Error.UnexpectedEndOfInput
        }
        
        switch token {
            case .Number(let value):
                return value
            case .Plus:
                throw Error.InvalidToken(token)
        }
    }
    
    /// Parses the tokens
    /// - returns: Evaluated input
    /// - throws: `Parser.Error.UnexpectedEndOfInput` or `Parser.Error.InvalidToken`
    func parse() throws -> Int {
        // Require a number first
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token {
                // Getting a Plus after a Number is legal
                case .Plus:
                    // After a plus, we must get a number
                    let nextNumber = try getNumber()
                    value += nextNumber
                
                // Getting a Number after a Number is not legal
                case .Number:
                    throw Error.InvalidToken(token)
            }
        }
        
        return value
    }
    
}


func evaluate(input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)

    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.Error.InvalidCharacter(let character) {
        print("Input contained an invalid character: \(character)")
    } catch Parser.Error.UnexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.InvalidToken(let token) {
        print("Invalid token found during parsing: \(token)")
    } catch {
        print("An error occurred: \(error)")
    }
}

evaluate("10 + 3 + 5 + 71")

