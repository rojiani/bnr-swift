
// data = [[Int]]
// # rows = data.count

func printTable(rowLabels: [String], data: [[Int]]) {

    // Create an array of the width of each row label 
    let rowLabelWidths = rowLabels.map { $0.characters.count }

    // Determine the length of longest row label
    guard let maxRowLabelWidth = rowLabelWidths.maxElement() else {
        return
    }

    for (i, row) in data.enumerate() {
        
    }

}

func padding(amount: Int) -> String {
    var paddingString = ""
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}

let data = [
    [30, 6],
    [40, 18],
    [50, 20],
]

printTable(data)