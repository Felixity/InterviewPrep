//
//  main.swift
//  substringConcatenation
//
//  Created by Laura on 7/26/17.
//  Copyright © 2017 Laura. All rights reserved.
//

/*
 
 You are given a string, S, and a list of words, L, that are all of the same length.
 
 Find all starting indices of substring(s) in S that is a concatenation of each word in L exactly once and without any intervening characters.
 
 Example :
 
 S: "barfoothefoobarman"
 L: ["foo", "bar"]
 You should return the indices: [0,9].
 (order does not matter).
 
 */

import Foundation


class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        
        var result: [Int] = []
        
        if words.count <= 0  {
            return result
        }
        
        var dictionary = [String : Int]()
        
        for word in words {
            if let count = dictionary[word] {
                dictionary[word] = count + 1
            }
            else {
                dictionary[word] = 1
            }
        }
        
        // all words have the same lenght => the lenght of the concatenated word = number of word * lenght of a word
        let lenght = words.count * words[0].characters.count
        let wordLen = words[0].characters.count
        
        var index = 0
        
        while index < s.characters.count - lenght + 1 {
            
            let startIndex = s.index(s.startIndex, offsetBy: index)
            let endIndex = s.index(s.startIndex, offsetBy: index + wordLen)
            let substring = s[startIndex..<endIndex]
            
            
            if let _ = dictionary[substring] {
                
                var newDictionary = dictionary
                
                var newIndex = index
                
                while newIndex < index + lenght {
                    
                    let newStartIndex = s.index(s.startIndex, offsetBy: newIndex)
                    let newEndIndex = s.index(s.startIndex, offsetBy: newIndex + wordLen)
                    let newSubstring = s[newStartIndex..<newEndIndex]
                    
                    if newDictionary[newSubstring] == nil {
                        break
                    }
                    newDictionary[newSubstring] = newDictionary[newSubstring]! - 1
                
                    newIndex += wordLen
                }
                
                let filter = newDictionary.values.filter{$0 == 0}
                
                if  filter.count == dictionary.count {
                    result.append(index)
                }
            }
            
            index += 1
        }
        
        return result
    }
}

let s = "qerhaxggvszzycpzcyjnmatlphjqedowjgdjflsaetbcxsdcrmpfmireqauufjsprvawgsymlbqlttnmicsumjyclvyqeqhxnivwaviowbzrumecqwzchzhuufmayuxlcuhepsunttfphluxhtcqujmpoypmspawlhddbxqwtxmcigarbejvnvmduesovslgbqlfncbibnlkvndyrnueiijcmbthvgqxwbclfduhtftqswpljjrutawgerpzxhytlcfqibzbgurargncrewnevvimmkkuifflmxtnzwvtpxmykppolevizfvmphgamnlzmgmlekhthtrsijiwndepjbbaijavynukviyzsfvaymujxchnglcrpfrxousohoydzyerfztgonplswaajeryjkyxgslqhmvgmzzsbvypkpccndcwhvxrivqqnegwsbeedgyebwtlnvoaaszkqwbattqizzhralyfryjsvegicujcoioggpgblzjmyqgaeegvcrqzwwkysvcgfrpnivovwziuqoxwudrywjasfksxhvgmovbyspupoelgskcopwmmfmelyzkfwqtknuiilezcikicvlqkhdwordzscmzyevkspuadzbfjlnmiacvjhtyzyzralsasnkkfhmignppacblfggqnbqoashcfafxnrhsyvcgkrwnwzydhgtvjkjjerojrvhgmqblmdryvpltrlwyrptbbfmfycppxwxkmyxacqzzgmszyoxpftshahoylfpjdmvqlsspktqsgireyrvdmqmmxdkiibtmpoeaiwrtshlyrfepwbvirjwqmgbxjulylpbvnsqfcefvjjnhniretnxivyfeuqchhfduyvcczhxktktgukmoxjysjfyevblegqagockpmkchuvnrgbhflfawkyahbolkgnsuqdkenmljjacpbjxoqxlavnjzbwjkkbecgqgverfotjfutcllzwoxjxwnufxeidgpuokyfrmybsuwwfhwdvvpvrcrybviedxytizabnachuaeckchfxwcqytqbqygvwgoghohvqmclmipwmwejtgbtctvssdqqjeyrvholtsyibpenmkzhtccvwxpqafimmifjptujlvtokxeykffdhiafhpxkxfwjnbsfuoqhljywgcwshcvqmvyvnvfkdbtsenxadnipwglfkhxrlvjzqhvfdapgekyixyjbltqkbdrlmqealnzexwjaxzidjinjgymureeujxfvnlvzzxfwtoyspixbqlkzjwtdczxlwfglqemrdrpygprvxqyqbipngkqilpvjweupkhinyangpgepxcfynwltgdetvbctfwkpftegtsmkysbvvgwiehdmnjfklhfsgqiljoreggqhyscvayffijrxuxjhgoamekapytvhbmoagqxgrdnbohyighsmvsbccbrcwnjybxahqzphcdismidsrveonhqrkithxfhycjhuiwblzldlvgfmdmbqttjedfnakwaofhjnemafaetvmykqkliggumkzbmlxnbcukpazqgzwbwkzgamtluafgkghyrglsiifzierqfnrbytiahbnbdsjpysoryzkijphsvzkamcdmxlpepehsxskxkypkzbsjszdpynrnpuboissxxbrwtdtdbknblfmfhpufcluugwiqobpncijwmfbnprqdyckfrfnus"
let l = ["tbbfmfycppxwxkmyxacqzz","gmszyoxpftshahoylfpjdm","vqlsspktqsgireyrvdmqmm","xdkiibtmpoeaiwrtshlyrf","epwbvirjwqmgbxjulylpbv","nsqfcefvjjnhniretnxivy","feuqchhfduyvcczhxktktg","ukmoxjysjfyevblegqagoc","kpmkchuvnrgbhflfawkyah","bolkgnsuqdkenmljjacpbj","xoqxlavnjzbwjkkbecgqgv","erfotjfutcllzwoxjxwnuf","xeidgpuokyfrmybsuwwfhw","dvvpvrcrybviedxytizabn","achuaeckchfxwcqytqbqyg","vwgoghohvqmclmipwmwejt","gbtctvssdqqjeyrvholtsy","ibpenmkzhtccvwxpqafimm","ifjptujlvtokxeykffdhia","fhpxkxfwjnbsfuoqhljywg","cwshcvqmvyvnvfkdbtsenx"]

var sol = Solution()
let result = sol.findSubstring(s, l)

for element in result {
    print("\(element)")
}
