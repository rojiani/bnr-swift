
import UIKit


protocol TabularDataSource {
    /* Computed Properties */
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> String
}


struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Book {
    let title: String
    let author: String
    let avgReview: Double
}


struct Department: TabularDataSource, CustomStringConvertible {
    /* Stored Properties */
    let name: String
    var people = [Person]()
    
    /* Computed Properties */
    var description: String {
        return "Department (\(name))"
    }
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 2
    }
    
    /* Initializers */
    init(name: String) {
        self.name = name
    }
    
    /* Methods */
    mutating func addPerson(person: Person) {
        people.append(person)
    }
    
    func labelForRow(row: Int) -> String {
        return people[row].name
    }
    
    func labelForColumn(column: Int) -> String {
        switch column {
        case 0: return "Age"
        case 1: return "Years of Experience"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> String {
        let person = people[row]
        switch column {
        case 0: return String(person.age)
        case 1: return String(person.yearsOfExperience)
        default: fatalError("Invalid column!")
        }
    }
}

struct BookCollection: TabularDataSource, CustomStringConvertible {
    
    let name: String
    var books = [Book]()
    
    var description: String {
        return "Book Collection: (\(name))"
    }
    
    var numberOfRows: Int {
        return books.count
    }
    
    var numberOfColumns: Int {
        return 2
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addBook(book: Book) {
        books.append(book)
    }
    
    func labelForRow(row: Int) -> String {
        return books[row].title
    }
    
    func labelForColumn(column: Int) -> String {
        switch column {
            case 0: return "Author"
            case 1: return "Avg. Review"
            default: fatalError("Invalid column!")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> String {
        let book = books[row]
        switch column {
            case 0: return book.author
            case 1: return String(book.avgReview)
            default: fatalError("Invalid column!")
        }
    }
}


func printTable(dataSource: protocol<TabularDataSource, CustomStringConvertible>) -> () {
    print("Table: \(dataSource)")
    
    // Create arrays of the row and column labels
    let rowLabels = (0 ..< dataSource.numberOfRows).map { dataSource.labelForRow($0) }
    let columnLabels = (0 ..< dataSource.numberOfColumns).map { dataSource.labelForColumn($0) }
    
    // Create an array of the width of each row label
    let rowLabelWidths = rowLabels.map { $0.characters.count }
    
    // Determine the length of longest row label
    guard let maxRowLabelWidth = rowLabelWidths.maxElement() else {
        return
    }
    
    // Create first row containing column headers
    var firstRow: String = padding(maxRowLabelWidth) + " |"
    
    // Also keep track of the width of each column
    var columnWidths = [Int]()
    
    for col in 0 ..< columnLabels.count {
        // Pad column labels if necessary
        let maxColumnWidth = maxWidthForColumn(col, dataSource: dataSource)
        let columnLabelWidth = columnLabels[col].characters.count
        var columnHeader = ""
        if columnLabelWidth < maxColumnWidth {
            columnHeader = padding(maxColumnWidth - columnLabelWidth) + " \(columnLabels[col]) |"
        } else {
            columnHeader = " \(columnLabels[col]) |"
        }
        firstRow += columnHeader
        columnWidths.append(columnHeader.characters.count)
    }
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        // Pad the row label out so they are all the same length
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"
        
        // Append each item in this row to our string
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(i, column: j)
            let itemString = " \(item) |"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(paddingAmount) + itemString
        }
        
        // Done - print it!
        print(out)
    }
}

func maxWidthForColumn(column: Int, dataSource: protocol<TabularDataSource>) -> Int {
    let columnLabelWidth = dataSource.labelForColumn(column).characters.count
    var maxItemWidth = 0
    for row in 0 ..< dataSource.numberOfRows {
        let item = dataSource.itemForRow(row, column: column)
        let itemString = String(item)
        maxItemWidth = max(itemString.characters.count, maxItemWidth)
    }
    return max(maxItemWidth, columnLabelWidth)
}

/* return string of specified length */
func padding(amount: Int) -> String {
    return String(count: amount, repeatedValue: Character(" "))
}

var department = Department(name: "Engineering")
department.addPerson(Person(name: "Joe", age: 30000, yearsOfExperience: 6))
department.addPerson(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.addPerson(Person(name: "Fred", age: 50, yearsOfExperience: 20))

printTable(department)

var bookCollection = BookCollection(name: "Navid's Books")
bookCollection.addBook(Book(title: "Naked Lunch", author: "William S. Burroughs", avgReview: 3.8))
bookCollection.addBook(Book(title: "Swift Programming: The Big Nerd Ranch Guide", author: "Matthew Matthias & John Gallagher", avgReview: 4.2))
bookCollection.addBook(Book(title: "Clean Code: A Handbook of Agile Software Craftsmanship", author: "Robert C. Martin", avgReview: 4.5))

print("\n\nGold Challenge:\n")
printTable(bookCollection)
