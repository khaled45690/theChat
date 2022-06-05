function ArrayChallenge(arr) {
    // 1. For input [5,10,4,6,7] the output was incorrect. The correct output is 5ge7wu4o13
    //For input [2,10,22,1,100] the output was incorrect. The correct output is 9g9e7wu4o13
    // arr = [5,10,4,6,7]
    // initializing the variables that i will use
    // set minPrice to the first value of arr to guranteethe code will not have bugs
    // set the other two variables as 0 as it will not effect howthe algorithms will work
    var minPrice = arr[0], maxPrice = 0, maxProfit = 0;


    // will loop just once so the bigO is O(n)
    for (var i = 0; i < arr.length; i++) {
        // will check if there is any minimum prices to set to minPrice variable
        // also set the maxPrice with same value as maximum prices of the previous days is neglected
        // as we need the valuse that will buy and sell later
        if (minPrice > arr[i]) {
            // also check if it's not the last value as 
            // we can't set the last value as minPrice
            if (i != arr.length - 1) {
                minPrice = arr[i]
                maxPrice = arr[i]
            }
        }
        // check if there is maximum value available after the minPrice was set to set into maxPrice
        if (maxPrice < arr[i]) {
            maxPrice = arr[i]
            if (maxPrice - minPrice > maxProfit) {
                maxProfit = maxPrice - minPrice
            }
        }

    }
    // calculate the profit
    // maxProfit = maxPrice - minPrice
    // exam condition
    // check if maxProfit is equal to zero then reset it as -

    // if (maxProfit == 0) {
    //     maxProfit = "-g1e7wu4o13"
    // } else if (maxProfit > 9) {
    //     var s = "" + maxProfit
    //     maxProfit = s[0] + "g" + s[1] + "e7wu4o13"

    // } else {
    //     maxProfit = maxProfit + "ge7wu4o13"
    // }
    // return the output with the challenge token as requested
    return maxProfit;

}


// keep this function call here 
console.log(ArrayChallenge([2, 10, 22, 1, 100, 20, 500, 12, 30, 40, 60]));