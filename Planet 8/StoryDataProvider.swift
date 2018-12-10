//
//  SoryDataProvider.swift
//  Planet 8
//
//  Created by MSadri on 12/4/18.
//  Copyright © 2018 MSadri. All rights reserved.
//

import Foundation

class StoryDataProvider {
    
    enum DecesionType {
        case doubbleButtonsType
        case delayType
    }
    
    struct StorySection {
        //var Tag : String
        var sectionPart : [String]
        var buttonsDetail : [(title: String, targetTag: String)]
        var delayDetail : (time: String, targetTag: String)
        
        var decesionType : DecesionType
    }
    
    let myStory : String = {
        let thisMyStory : String = """
:: launch
[establishing connection]
[receiving message]
Hello?
Is this thing working?
Can anyone read me?
<<choice [[Who is this?|whois]]>> | <<choice [[I read you.|message received]]>>


:: whois
<<silently>><<set $toldname = 1>><<endsilently>>
Right, right, sorry. Should've started with that.
I was just excited to get a response to my signal.
My name's Taylor. I was a... an astronaut on board the starship Varia.
<<choice [[The Varia?|Variainfo]]>> | <<choice [["Was?" What happened?|whathappened]]>>


:: Variainfo
The Varia was a transport ship. Nothing fancy. Crew of less than a dozen.
We were en route to Tau Ceti IV and, as far as I knew, everything was going fine!
We were set to dock in six more days.
But then... I don't know what happened. We crashed on some moon.
I don't know where.
<<choice [[How do you not know?|dontknow]]>> | <<choice [[Try using a map.|usemap]]>>


:: dontknow
<<silently>><<set $toldstudent = 1>><<endsilently>>
<<if $mapsuggest is 1>>Yeah, I seriously don't know.<<endif>>
Why don't I know? Why don't I have this whole sector memorized, like any astronaut worth a damn would?
Because I'm a STUDENT, okay?
My number came up in a lottery of science students, and I got to join this mission.
I was on board the Varia running zero-G experiments on rats and lichens and stuff, all right?
I was never, ever meant to be without a trained supervisor by my side at any time.
So it's safe to say that this crash landing wasn't covered anywhere in my student handbook.
<<choice [[Okay. Calm down.|calmdown]]>> | <<choice [[Whoa. Take it easy.|whoatakeiteasy]]>>


:: calmdown
Right. Sorry. As you can imagine, I'm pretty freaked out right now.
We covered a ton of different protocols in training, but this was never one of them.
But it's cool. It's cool. I just have to find the other survivors, and they'll know what to do.
Only...
[[delay 4s|nosurvivors]]


:: nosurvivors
...what if there ARE no other survivors?
What if I'm the only one who made it?
Aw, God, Captain Aya is probably dead. And all the others, too. Colby... dammit. Colby.
I just... what if I'm all alone out here?
<<choice [[Easy, now. Just breathe.|justbreathe]]>> | <<choice [[Want to talk about Colby?|talkColby]]>>


:: justbreathe
Right. You're right. The atmosphere is breathable, might as well breathe it.
I mean, it's like Colby said, more than once:
Don't waste time worrying about "what if," just concentrate on "what is."
So. Let's do that.
<<choice [[Okay. Where are you?|whereareyou]]>> | <<choice [[Are you hurt?|areyouallright]]>>


:: sorryaboutearlier
It's all good. Tensions are running pretty high. People are bound to say things they don't mean.
I'm glad to have someone to talk me through this. I have no idea what I'd do if you weren't here.
Okay. So. Let's deal with what we DO know, at this point.
<<choice [[Where are you?|whereareyou]]>> | <<choice [[Are you hurt?|areyouallright]]>>


:: message received
Oh, thank God! It's so good to have human contact!
It's been hours!
<<choice [[Who are you?|whois]]>> | <<choice [[What happened?|whathappened]]>>


:: whathappened
Our ship crashed on some moon. I have no idea where.
I managed to get to an escape pod, but I couldn't tell if anyone else made it into one.
My IEVA suit sensor tells me that the air here is breathable, at least, so that's nothing short of a miracle.
But I've got no food or water rations on me. The toolkit on the pod is about as basic as they come.
I managed to get the pod's mobile transmitter working, but -- lucky you -- you seem to be the only one in range of the signal.
Whoever and wherever you might be.
<<choice [[Are you all right?|areyouallright]]>> | <<choice [[Where are you?|whereareyou]]>>


:: StoryTitle
Lifeline 041115


:: usemap
<<silently>><<set $mapsuggest = 1>><<endsilently>>
Yeah, that'd be a fantastic plan, if it weren't for the tiny problem that I, and my escape pod, are right here...
...whereas the astromap room is still in the Varia.
Which, given the two separate plumes of black smoke to the south, is in AT LEAST two pieces, nowhere near me.
So you'll forgive me if "use a map" isn't at the very top of my "to do" list.
<<choice [[You seriously have no idea?|dontknow]]>> | <<choice [[Sorry. Are you all right?|areyouallright]]>>


:: whoatakeiteasy
"Easy" isn't exactly at the top of my list of ways to take it, at the moment.
I am marooned in deep space and -- if we're being honest -- I'm freaking the hell out!
<<choice [[It'll be okay. Calm down.|calmdown]]>> | <<choice [[Don't be a baby.|dontbeababy]]>>


:: dontbeababy
"Don't be a baby"?
Oh, and I suppose YOU get stranded on a desert moon every day, huh?
You wouldn't be much good on a crisis hotline, anyone ever tell you that?
I think I was doing better before I got this transmitter hooked up.
Just... I'm gonna take a break for a while. Try to assess the situation.
I'll call you when I'm ready to talk again, okay?
[[delay 30m|readytotalk]]


:: readytotalk
Okay, look. I hate to admit you're even a little bit right.
But sitting here feeling sorry for myself isn't going to get me rescued. So I guess it's time to take action.
Please, just... remember I'm scared out of my mind, okay?
I'm grateful to have any human contact at all, I really am, but... take it easy on me, all right?
<<choice [[Sorry about earlier.|sorryaboutearlier]]>> | <<choice [[Grow some thicker skin.|thickerskin]]>>


:: thickerskin
Damn. You've got the "tough" part of "tough love" down cold, but the rest could use some work.
Look, I'm going to keep this channel open...
...but only because having you on the other end of the line is better than bouncing my thoughts into the void.
Any help you can offer, well, that'd just be peachy.
<<choice [[Any idea where you are?|whereareyou]]>> | <<choice [[You all in one piece?|areyouallright]]>>


:: whereareyou
The only way I can answer that with any confidence is to say "stranded."
If you know where nowhere is, just look right in the middle of it, and you'll spot me.
<<if $toldname is 0>>My name's Taylor, by the way. Probably should've started with that.<<endif>>
The Varia was on a gentle elliptical path toward Tau Ceti IV.
I don't know whether we went off course, or by how much.
I was nowhere near the bridge when it all went down.
Colby, she... she shoved me into an escape pod and then went to see how she could help the others. That's just who she was.
I guess I blacked out in the pod, from shock or fear or something -- I don't know how long --
...and when I came to, I was here.
<<choice [[Describe "here."|describehere]]>> | <<choice [[Want to talk about Colby?|talkColby]]>>


:

"""
        return thisMyStory
    }()
    
    var properStory =  [[String : StorySection]]()
    
    private init() {
        let p = plainStoryToLineByLineStory(plainStory: myStory)
        properStory = lineByLineStoryToProperStory(lineByLineStory: p)
        print(properStory)
    }
    
    static let sharedObject = StoryDataProvider()
    
    func plainStoryToLineByLineStory(plainStory : String ) -> [String]{
        
        var returner : [String] = []
        
        let myArray = Array(plainStory)
        var preveousIndex = -1
        var counter = 0
        for currentIndex in 0...myArray.count - 1 {
            if myArray[currentIndex] == "\n" {
                // do something between previous...current
                var text : String =  ""
                if (currentIndex ) > (preveousIndex + 1) {
                    for thisIndex in (preveousIndex+1)...(currentIndex-1) {
                        text.append(myArray[thisIndex])
                    }
                    if ( text != "\n") {
                        counter += 1
                        returner.append(text)
                    }
                    preveousIndex = currentIndex
                }
                
            }
            
        }
        return returner
    }
    
    func lineByLineStoryToProperStory(lineByLineStory : [String]) -> [[String : StorySection]] {
        var returner = [ [String : StorySection]]()
        
        var previousIndex = 0
        for currentIndex in 1...lineByLineStory.count-1 {
            
            let myArray = Array(lineByLineStory[currentIndex])
            if myArray[0] == ":" {
                //do something between preveousIndex and Curret Index
                var thisSectionLineByLineInString : [String] = []
                for i in previousIndex...currentIndex-1 {
                    thisSectionLineByLineInString.append(lineByLineStory[i])
                }
                previousIndex = currentIndex
                // print("\n\n\nThisSection: \n \(thisSectionLineByLineInString)")
                
                // here section is ready now extract tag, storyParts and so on
                var tag = ""
                let arrayTag = Array(thisSectionLineByLineInString[0])
                for i in 3...arrayTag.count - 1 {
                    tag.append(arrayTag[i])
                }
                var storyParts : [String] = []
                if thisSectionLineByLineInString.count > 3 {
                    for i in 1...thisSectionLineByLineInString.count-2 {
                        storyParts.append(thisSectionLineByLineInString[i])
                    }
                } else if thisSectionLineByLineInString.count == 3 {
                    storyParts.append(thisSectionLineByLineInString[1])
                }
                //print(storyParts)
                
                var thisDecisionTypeM :  DecesionType?
                var buttonsDetail : [(title: String , targetTag: String)] = []
                var delayDetail = (time: "1", targetTag: "Unknown")
                if (thisSectionLineByLineInString.last!.contains("choice") ||  thisSectionLineByLineInString.last!.contains("delay") ){
                    let lastRowToInterpert : [Character] = Array(thisSectionLineByLineInString.last!)
                    
                    if thisSectionLineByLineInString.last!.contains("choice") {
                        //Double Button Cell
                        thisDecisionTypeM = .doubbleButtonsType
                        var positionOfStarters : [Int] = []
                        var positionOfSeperators : [Int] = []
                        var positionOfEnds : [Int] = []
                        
                        var isItOdd = true
                        for i in 3...lastRowToInterpert.count-1 {
                            if (lastRowToInterpert[i-1] == "[" && lastRowToInterpert[i] == "[") {
                                positionOfStarters.append(i)
                            }
                            if (lastRowToInterpert[i-1] == "]" && lastRowToInterpert[i] == "]") {
                                positionOfEnds.append(i)
                            }
                            
                            if lastRowToInterpert[i] == "|" {
                                if isItOdd {
                                    positionOfSeperators.append(i)
                                    isItOdd = false
                                } else {
                                    isItOdd = true
                                }
                            }
                        }
                        //<<choice [[Who is this?|whois]]>> | <<choice [[I read you.|message received]]>>
                        for i in 0...1 {
                            var buttonName : String = ""
                            var buttonTarget : String = ""
                            for j in (positionOfStarters[i]+1)...(positionOfSeperators[i]-1) {
                                buttonName.append(lastRowToInterpert[j])
                            }
                            for j in (positionOfSeperators[i]+1)...(positionOfEnds[i]-2) {
                                buttonTarget.append(lastRowToInterpert[j])
                            }
                            let newElement = (title: buttonName, targetTag: buttonTarget)
                            buttonsDetail.append(newElement) //= [newElement]
                        }
                        
                        
                    } else if thisSectionLineByLineInString.last!.contains("delay") {
                        //delay Type
                        thisDecisionTypeM = .delayType
                        //[[delay 30m|readytotalk]]
                        var positionOfSeperator = 1
                        for i in 0...lastRowToInterpert.count - 1 {
                            if lastRowToInterpert[i] == "|"{
                                positionOfSeperator = i
                            }
                        }
                        var delayTimeM : String = ""
                        for i in 8...positionOfSeperator-1 {
                            delayTimeM.append(lastRowToInterpert[i])
                        }
                        var delayTargetM : String = ""
                        for i in (positionOfSeperator+1)...(lastRowToInterpert.count-3) {
                            delayTargetM.append(lastRowToInterpert[i])
                        }
                        //TODO: Write a delay interperter and call it whe we are showing the cell (not here) 
                        delayDetail = (time: delayTimeM, targetTag: delayTargetM)
                    }
                    
                } else {
                    thisDecisionTypeM = DecesionType.delayType
                }
                
                
                let thisSection = [tag : StorySection(sectionPart: storyParts, buttonsDetail: buttonsDetail, delayDetail: delayDetail, decesionType: thisDecisionTypeM!)]
                print(thisSection)
                print("____________")
                returner.append(thisSection)
                
            }
        }
        return returner
    }
    
    
}
