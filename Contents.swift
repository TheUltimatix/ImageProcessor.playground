//: Playground - noun: a place where people can play

import UIKit


let image = UIImage(named: "sample")!

let myRGB = RGBAImage(image: image)!
var newImage : UIImage = image
var myRGB1 : RGBAImage = RGBAImage(image: image)!
var totalRed = 0
var totalGreen = 0
var totalBlue = 0
var totalAlpha = 0


for y in 0..<myRGB.height{
    for x in 0..<myRGB.width{
        let index = y*myRGB.width + x
        var pixel = myRGB.pixels[index]
        totalRed += Int(pixel.red)
        totalGreen += Int(pixel.green)
        totalBlue += Int(pixel.blue)
        totalAlpha += Int(pixel.alpha)

    }
}

let count = myRGB.height * myRGB.width
let avgRed = totalRed/count
let avgGreen = totalGreen/count
let avgBlue = totalBlue/count
let avgAlpha = totalAlpha/count



func ImageProcessor(task: [String], intensity: [Int])-> UIImage{
    for i in 0..<task.count{
        myRGB1 = RGBAImage(image: newImage)!
    switch task[i]{
        case "IncreaseRed":
        for y in 0..<myRGB1.height{
            for x in 0..<myRGB1.width{
                let index = y*myRGB1.width + x
                var pixel = myRGB1.pixels[index]
                let redDiff = Int(pixel.red) - avgRed
                if(redDiff > 0){
                    pixel.red = UInt8(max(0,min(255,avgRed+redDiff*intensity[i])))
                    myRGB1.pixels[index] = pixel
                    }
                }
            }
         newImage = myRGB1.toUIImage()!
    case "DecreaseRed":
        for y in 0..<myRGB1.height{
            for x in 0..<myRGB1.width{
                let index = y*myRGB1.width + x
                var pixel = myRGB1.pixels[index]
                let redDiff = Int(pixel.red) - avgRed
                if(redDiff > 0){
                    pixel.red = UInt8(max(0,min(255,avgRed+redDiff/intensity[i])))
                    myRGB1.pixels[index] = pixel
                }
            }
        }
        newImage = myRGB1.toUIImage()!
    case "IncreaseGreen":
        for y in 0..<myRGB1.height{
            for x in 0..<myRGB1.width{
                let index = y*myRGB1.width + x
                var pixel = myRGB1.pixels[index]
                let greenDiff = Int(pixel.green) - avgGreen
                if(greenDiff > 0){
                    pixel.green = UInt8(max(0,min(255,avgGreen + greenDiff*intensity[i])))
                    myRGB1.pixels[index] = pixel
                }
            }
        }
        newImage = myRGB1.toUIImage()!
    case "DecreaseGreen":
        for y in 0..<myRGB1.height{
            for x in 0..<myRGB1.width{
                let index = y*myRGB1.width + x
                var pixel = myRGB1.pixels[index]
                let greenDiff = Int(pixel.green) - avgGreen
                if(greenDiff > 0){
                    pixel.green = UInt8(max(0,min(255,avgGreen + greenDiff/intensity[i])))
                    myRGB1.pixels[index] = pixel
                }
            }
        }
        newImage = myRGB1.toUIImage()!
    case "IncreaseBlue":
        for y in 0..<myRGB1.height{
            for x in 0..<myRGB1.width{
                let index = y*myRGB1.width + x
                var pixel = myRGB1.pixels[index]
                let blueDiff = Int(pixel.blue) - avgBlue
                if(blueDiff > 0){
                    pixel.blue = UInt8(max(0,min(255,avgBlue + blueDiff*intensity[i])))
                    myRGB1.pixels[index] = pixel
                }
            }
        }
        newImage = myRGB1.toUIImage()!
    case "DecreaseBlue":
        for y in 0..<myRGB1.height{
            for x in 0..<myRGB1.width{
                let index = y*myRGB1.width + x
                var pixel = myRGB1.pixels[index]
                let blueDiff = Int(pixel.green) - avgBlue
                if(blueDiff > 0){
                    pixel.blue = UInt8(max(0,min(255,avgBlue + blueDiff/intensity[i])))
                    myRGB1.pixels[index] = pixel
                }
            }
        }
        newImage = myRGB1.toUIImage()!
        
        
    case "IncreaseTransperancy":
        for y in 0..<myRGB1.height{
            for x in 0..<myRGB1.width{
                let index = y*myRGB1.width + x
                var pixel = myRGB1.pixels[index]

                    pixel.alpha = UInt8(max(0,min(255, avgAlpha-intensity[i])))
                    myRGB1.pixels[index] = pixel
            }
        }
       newImage = myRGB1.toUIImage()!
        
    default:
        print("You are in default case...Enter correct task")
    }
    }
    return newImage
}

let result = ImageProcessor(["IncreaseTransperancy","IncreaseRed"], intensity: [100,5])

















