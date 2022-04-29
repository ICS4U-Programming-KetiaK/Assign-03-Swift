//
//  Palindrome.swift
//
//  Created by Ketia Gaelle Kaze
//  Created on 2022-04-11
//  Version 1.0
//  Copyright (c) 2022 IMH. All rights reserved.
//
//  This program takes a number and checks if it is a
//  palindrome or not. If not, it adds the reverse of the
//  number to itself and checks again.

import Foundation

// declaring variables
var initialDepth = 0
var depthArray: [String] = []
var depthString: [String] = []
var strings: String

func depth(number: Int, depthInt: Int) -> [String] {
  let numberStr = String(number)
  var newString = ""

  // Create a reverse string of the numbers as strings
  for character in numberStr {
    newString = String(character) + newString
  }
  let reverseNum = Int(newString) ?? 0

  // Check if the number is a palindrome
  if newString == numberStr {
    // Create array with the depth and palindrome of the number
    var returnArray: [String] = []
    returnArray.insert(String(depthInt), at: 0)
    returnArray.insert(String(reverseNum), at: 1)
    return returnArray

  } else {
    // Call the function again if the number is not a palindrome
    return depth(number: number + reverseNum, depthInt: depthInt + 1)
  }
}

// declaring constants and variables
let userInput = "/home/runner/Assign-03-Swift/input.txt"
var resultStrings: String = ""
var text: String = ""
var arrayToString: String
let resultStringsArray: [String]
var counter1 = 0
var numberStr: String?

// read user input file into an array
let listOfStrings: String = try String(contentsOfFile: userInput)
let arrayOfStrings: [String] = listOfStrings.components(separatedBy: "\n")

for numberStr in arrayOfStrings {
  let numberInt = Int(numberStr) ?? -15645198542684

  // Handle errors for negative integers and non-integers
  if numberInt == -15645198542684 {
    strings = "Please enter a valid integer.\n"
  } else if numberInt < 0 {
    strings = "Please enter a positive integer.\n"
  } else {
    depthArray = depth(number: numberInt, depthInt: initialDepth)
    strings = "\(arrayOfStrings[counter1]) is a depth of \(depthArray[0]) with a palindrome of \(depthArray[1])\n"
  }
  resultStrings.append(strings)
  counter1 += 1
}
// convert the result array to another array
resultStringsArray = resultStrings.components(separatedBy: "\n")

// write the result to the output file
try text.write(to: URL(fileURLWithPath: "/home/runner/Assign-03-Swift/output.txt"), atomically: false, encoding: .utf8)
if let fileWriter = try? FileHandle(forUpdating: URL(fileURLWithPath: "/home/runner/Assign-03-Swift/output.txt")) {

  // add each string to the output file
  for counter2 in 0..<resultStringsArray.count {
    if counter2 != resultStringsArray.count-1 {
      arrayToString = resultStringsArray[counter2] + "\n"
    } else {
      arrayToString = resultStringsArray[counter2]
    }
    fileWriter.seekToEndOfFile()
    fileWriter.write(arrayToString.data(using: .utf8)!)
  }
  fileWriter.closeFile()
}
print("Assigned the result to the output file.")
