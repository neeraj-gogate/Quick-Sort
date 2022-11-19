func printArr(_ arr:[String]){
    for word in arr{
        print(word)
    }
}
func readInput() -> [String]{
    var unsorted = [String]()
    while let line = readLine() {
        unsorted.append(line)
    }
    return unsorted
}

func pivot(unsorted: inout [String], low: Int, high: Int) -> Int{
    let piv = unsorted[high]
    var y = low-1
    for i in low...high-1 {
        
        if unsorted[i] <= piv{
            y += 1
            unsorted.swapAt(i,y)
        }
    }
    unsorted.swapAt(y+1,high)
    return y+1
}
func quickSort(unsorted: inout [String], low: Int, high: Int){
    if low < high{
        let piv = pivot(unsorted:&unsorted, low: low, high: high)
        quickSort(unsorted:&unsorted, low: low, high: piv-1)
        quickSort(unsorted:&unsorted, low: piv+1, high: high)
    }
}

var unsorted = readInput()
quickSort(unsorted: &unsorted, low:0, high: unsorted.count - 1)
printArr(unsorted)
