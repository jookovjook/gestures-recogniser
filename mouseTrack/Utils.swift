//
//  Utils.swift
//  mouseTrack
//
//  Created by Жека on 14/01/2018.
//  Copyright © 2018 Жека. All rights reserved.
//

import Foundation

//  g1
//
//   /\
//  /  \
// /   _\|
let g1_x : [CGFloat] = [0, 0.5, 1]
let g1_y : [CGFloat] = [0, 1, 0]

//  g2
//
//    /\
//   /  \
// |/_   \
let g2_x : [CGFloat] = [1, 0.5, 0]
let g2_y : [CGFloat] = [0, 1, 0]

//  g3
//
//   --->
//  |
//  |
let g3_x : [CGFloat] = [0, 0, 1]
let g3_y : [CGFloat] = [0, 1, 1]

//  g4
//
//      |
//      |
//  <---
let g4_x : [CGFloat] = [1, 1, 0]
let g4_y : [CGFloat] = [1, 0, 0]

enum Gestures {
    case none
    case g1
    case g2
    case g3
    case g4
}

func compare(_ xs: [CGFloat], _ ys: [CGFloat]) -> Gestures {
    
    if(xs.count < 5) { return Gestures.none }
    
    let treshold = CGFloat(0.1)
    var minGesture = Gestures.none
    var minDistance = CGFloat(1)
    var distance = CGFloat(1)
    
    distance = compareWith(xs, ys, Gestures.g1)
    if(distance < minDistance){
        minDistance = distance
        minGesture = Gestures.g1
    }
    
    distance = compareWith(xs, ys, Gestures.g2)
    if(distance < minDistance){
        minDistance = distance
        minGesture = Gestures.g2
    }
    
    distance = compareWith(xs, ys, Gestures.g3)
    if(distance < minDistance){
        minDistance = distance
        minGesture = Gestures.g3
    }
    
    distance = compareWith(xs, ys, Gestures.g4)
    if(distance < minDistance){
        minDistance = distance
        minGesture = Gestures.g4
    }
    
    return minDistance < treshold ? minGesture : Gestures.none
}

func compareWith(_ xs: [CGFloat], _ ys: [CGFloat], _ gesture: Gestures) -> CGFloat {
    let normalSize = 20
    var gx: [CGFloat] = []
    var gy: [CGFloat] = []
    switch gesture {
    case Gestures.g1:
        gx = g1_x
        gy = g1_y
        break
    case Gestures.g2:
        gx = g2_x
        gy = g2_y
        break
    case Gestures.g3:
        gx = g3_x
        gy = g3_y
        break
    case Gestures.g4:
        gx = g4_x
        gy = g4_y
        break
    default:
        return CGFloat(1)
    }
    let g1x = rescaleArray(gx, normalSize)
    let g1y = rescaleArray(gy, normalSize)
    var ixs = xs
    var iys = ys
    normalizeArrays(&ixs, &iys)
    ixs = rescaleArray(ixs, normalSize)
    iys = rescaleArray(iys, normalSize)
    for i in 0...(normalSize - 1){
        ixs[i] = abs(ixs[i] - g1x[i])
        iys[i] = abs(iys[i] - g1y[i])
    }
    return (ixs.reduce(0, +) + iys.reduce(0, +))/(2*CGFloat(normalSize))
}

func rescaleArray(_ array: [CGFloat], _ size: Int) -> [CGFloat]{
    let count = array.count
    if(count == size){ return array }
    var outputArray : [CGFloat] = []
    let k = CGFloat(count - 1)/CGFloat(size - 1)
    for i in 0...(size - 1){
        let fIndex = CGFloat(i)*k
        var lIndex = fIndex.rounded(.down)
        var rIndex = fIndex.rounded(.up)
        if(rIndex > CGFloat(count - 1)){ rIndex = CGFloat(count - 1) }
        if(lIndex < 0){ lIndex = CGFloat(0) }
        if(lIndex - rIndex == 0){
            outputArray.append(array[Int(fIndex)])
        }else{
            outputArray.append(array[Int(lIndex)] + (array[Int(rIndex)] - array[Int(lIndex)])*(fIndex - lIndex))
        }
    }
    return outputArray
}

func normalizeArrays( _ xs: inout [CGFloat], _ ys: inout [CGFloat]) {
    
    let xmax = xs.max()!
    let ymax = ys.max()!
    let xmin = xs.min()!
    let ymin = ys.min()!
    
    let kx = 1.0/(xmax - xmin)
    let ky = 1.0/(ymax - ymin)
    
    for i in 0...(xs.count-1){
        xs[i] = kx*(xs[i] - xmin)
        ys[i] = ky*(ys[i] - ymin)
    }
    
}
