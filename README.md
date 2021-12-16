# Mathematica Advent of Code
# 2021

This repository stores my [Advent Of Code](http://adventofcode.com/2021/) solutions for 2021, written in Mathematica.  Some of these solutions are simple one-liners, and others are procedural and not fundamentally different from most other common programming languages, and so don't have any READMEs associated with them.  Some (marked in **bold**) are more involved and have (or need) explanations.  I'm using .wls instead of .m, and trying to make the code somewhat readable as plaintext, but casual Mathematica in general is notebook-heavy, and isn't great to view on GitHub.

There's also a utilities file, Ulitities.nb, with some functions that proved useful in previous years.  This is not a true utils file, in that it isn't a paclet and that I don't import the function definitions directly, but it's mostly there as boilerplate code I can copy in when need be.

## Days Completed

* Day 1: Sonar Sweep
* Day 2: Dive!
* Day 3: Binary Diagnostic
* Day 4: Giant Squid
* **Day 5: Hydrothermal Venture** (The git history shows the process of this code being made more elegant)
* Day 6: Lanternfish
* Day 7: The Treachery of Whales
* **Day 8: Seven Segment Search** (Contains both brute force and the much faster frequency analysis)
* Day 9: Smoke Basin
* Day 10: Syntax Scoring
* Day 11: Dumbo Octopus
* **Day 12: Passage Pathing** (Contains both brute force and Dijkstra's, for enumerating paths under conditions where brute force is infeasible)
* Day 13: Transparent Origami
* **Day 14: Extended Polymerization** (Contains both brute force and optimized versions, under part 1 and 2 respectively)
* Day 15: Chiton

## Poems

### Day 1: Stalling the Seven Seas

Today, we lost the sleigh keys on the ocean:  
A tragedy we'll need a month to right.  
They're truly lost; we haven't got a notion  
Of where they got to after leaving sight.  
And so from duty verging on devotion  
We'll start our month-long enterprise tonight.  
We certainly won't rummage in slow-motion...  
(...okay, we just like submarines, alright?)  

We'll need a month, at least, to find the keys  
Which, sadly, we misplaced beneath the seas.  

### Day 2: Run Silent, Run Deep

The water here is mighty cold,  
And more pitch black than tar.  
The vales are deep, or so we're told,  
But we have got a star.  
We don't know what day 3 will be,  
Or what errand it tells,  
But our floodlights are green and red.  
Our sonar's jingle bells.  

The challenges we've done before  
Have rarely been a burden.  
(Like inverse `mod`s; I'd like some more  
If I could get a word in).  
It's difficult to cry or pout,  
When we can hear a sleigh,  
And "Silent Night" is sung about  
The Christmas on the way.  

### Day 3: The Power of Two

One and zero: the only components  
Of your hardware, on closer review.  
It can calculate monstrous exponents,  
With transistors that can't count to two.  

With just one piece - the primitive `NOR` gate -  
You can process the bits that pass through:  
Turning `on` for the `off`s at the door gate;  
And for `on`s there, returning `untrue`.  

You can turn `NOR`s to `XOR` gates and `AND`ers,  
And inverters, to name just a few.  
And the multi-bit adder-expanders,  
Are sufficient to build ALUs.  

From these pieces are made all our widgets;  
It's astounding just what they can do.  
You can build a whole world with two digits:  
"On" and "off"; that's the power of two.  

### Day 4: There Was a Sub That Had a Squid

Across and down,  
You count to five;  
You fear to drown,  
But you're alive.  

The squid is big  
Enough to hew,  
Like one small twig  
Your sub in two.  

It wants a show  
And you've the thing  
Which ends in 'o'  
And starts with 'bing'.  

It makes a bet  
And you agree  
(You've racked some debt  
Out here at sea).  

It weighs a ton,  
Your questioned sin:  
Should *it* have fun,  
Or should you *win*?  

You've rigged the boards,  
So now, you think:  
What use rewards  
If then, you sink?  

### Day 5: Crossing a Line

With lines of toxic vents below,  
We make our map, and off we go.  
They're deadly when they intersect  
But we won't cross those lines - we've checked.  

We tidy up our code with `Sign[]`s,  
To handle all the types of lines.  
And then we read the code and scout  
For useless lines, to cross them out.  

And cleaning up the code, we find  
That most of it can be un-lined:  
The hash maps?  Gone.  And same with `Do[]`.  
Non-function lines?  Cross them out too.  

The cleaning's fun, the code is neat,  
But timewise, I've been soundly beat.  
Code fast *and* well?  I'm at a loss;  
That line is always hard to cross.  

### Day 6: Multiply

It glows  
And grows  
Then slows  
In throes.  

Then two fish swim.  
They start out slim  
But things look grim:  
There's four of 'em!  

The school of four fish, swimming past  
Began with one; three more amassed  
And still they're replicating fast  
There's eight; I hope we've seen the last.  

Now, if the lanternfish could die, or if they needed food or clothes,  
Then things might never go awry, if they were limited by those.  
A normal fish will say good-bye, but not (it seems) the fish that glows.  
I'm scared about this school, for I just counted sixteen; still, it grows.  

### Day 7: The Crustacean Supplication

Crabs above whose sea we scuttle  
Give us aid, and not rebuttal,  
Danger comes, surpassing cuttle:  
Blast a hole, and don't be subtle!  

We've made friends with a crustacean  
[Stacking cups while on vacation](https://adventofcode.com/2020/day/23),  
[After games of long duration](https://adventofcode.com/2020/day/22):  
Save us from this huge cetacean!  

Whales are fast; too late we tracked them.  
Bingo, too, does not distract them.  
Submarines, like ours, attract them:  
Save us, or they'll soon have snacked them!  

Hurry, blast through sheet and shale!  
Wale away, away from whale!  
It's almost here!  We must not fail!  
Grant us weal lest we should wail!  

### Day 8: Constraint Problem

The caves and segments both constrain  
Where we are apt to go,  
And like the tracks that turn a train  
Our course is set, we know.  

Constraints leave but a single route:  
The segments made it clear.  
So since we're stuck until we're out,  
I hope the keys are here.  

### Day 9: Lines Inscribed on a Utilities File

Though we prepare for puzzles there  
Are errors we cannot prevent  
Within the code that we have stowed  
Throughout the year for this event.  

And when we try to re-apply  
These functions that we wrote before,  
The syntax breaks like mica flakes  
And errors fill the screen, and more.  

The cost is sunk (or so we've thunk)  
And wasting `Utils` causes pain,  
So we debug, no longer smug,  
And lose the time we thought to gain.  

But in the end, we do amend  
And make it through this game we play.  
We coders are, to get each star,  
[Like broken clocks](https://adventofcode.com/2021/day/8), right twice a day.  

### Day 10: Luck is the Draw

"So you see, we keep score,"  
Said the checker, explaining,  
"It can be a chore,  
But it's quite entertaining."  

I looked back, quite confused,  
At this odd explanation.  
Were they that amused  
By some syntax mutation?  

So said I, in responding,  
"Your scores are all random!  
They're just corresponding  
To letters in tandem!  

In what way is it fun?  
You've no choice in the outcome!  
So I won't say it's 'dumb' -  
But you're smarter without some!"  

It looked taken aback  
When I finished my question,  
Despite my clear lack  
Of a better suggestion.  

And it thought long and hard  
About how to explain it;  
If it gave some canard,  
I'd be sure to disdain it.  

And at last, it was done,  
To explain their desire:  
"You see, if you've won,  
There's some stars you acquire."  

### Day 11: Dumbos

These octopuses aren't so bright, but yet they get to shine,  
And light the caves for miles around when energies align,  
Eventually syncing up, converging by design:  
Their pastimes seem to go an awful lot smoother than mine.  
And so, when yet another piece of submarine should break,  
I envy the dim octopi; machines were a mistake.  

## Day 12: All Roads Lead to Home

[**PRO PATHFINDER: Choose your path wisely**.](https://i.imgur.com/dwVPsqU.png)

    Welcome to PRO PATHFINDER v. 1.0!
    Please enter your name:
    > **DIJKSTRA**

    Begin y/n?
    > y
    Loading `start`...

***Start***

Welcome, `DIJKSTRA`, to your quest.  
Journey onwards, if you dare.  
Choose now: south, or east, or west?  
Dangers dwell within: beware!  

Caverns you may visit twice,  
Or more, as heart and path inclines.  
Small caves, one visit must suffice!  
Never twice to those confines.  

Do you seek to leave these caves?  
Reunite with folk and friend?  
Sally forth, and use your saves!  
The passage that you seek is `end`.  

Dare you, `DIJKSTRA`, now to start?  
Pick between your choices three.  
[You have the map](https://i.imgur.com/dwVPsqU.png).  Have you the heart?  
`GW`, `nx`, `pt`?  

    > GW
    Loading `GW`...

***Gnome Wizard***

"Welcome, `DIJKSTRA`,  
To my home!  
I am wizard.  
I am gnome!  

"You may leave  
Or you may wait.  
I am wizard.  
I am great!  

If you're hurt,  
I'll fix you up.  
I am wizard,  
Here is cup!  

`sx`? `nx`?  
`lg`? `ve`?  
I am wizard,  
Tall as knee!"  

    > take cup
    You take the cup.  Inventory contains: cup.

    > sx
    Loading `sx`...

***Sinking Xanadu***

[In Xanadu did Kubla Khan](https://en.wikipedia.org/wiki/Kubla_Khan),  
A stately pleasure-dome decree.  
Where Alph, the sacred river, ran  
Through caverns measureless to man  
Down to a sunless sea.  

But we have measured now, and well  
We know the routes and paths and ways.  
And long ago, the tunnels fell,  
With mournful noise, as though a knell  
To sound our end of days.  

Hark now!  The final Vespers chime!  
The way from whence you came shall heave.  
Flee to `GW` in time  
Or perish here, like Coleridge's rhyme.  
Leave now, or never leave!  

    > GW  
    Loading `GW`..  

***Gnome Wizard***

"Ahh, welcome back!  
You made it out!  
That Xanadu's  
A tricky route.  

I'm glad you're safe!  
I'm glad you're here!  
That way is gone.  
Won't reappear!  

`nx` is nice,  
Or so I've heard.  
`lg`? `ve`?  
They're not preferred.  

I've seen your fate:  
We'll meet again.  
I am wizard!  
See you then!"  

    > nx  
    Loading `nx`...  

***NeXus***

You have come to the spot in the center,  
Where the passages all intersect.  
There are five different ways you can enter.  
There are four different paths to eject.  

You may go to `GW`'s wizard.  
You may go to `SM`'s clever horse.  
Or `pt`, where the siren's call is heard.  
Or `lg`, where the lamprey has force.  

But although your quaint drawing connects us  
There is still one unbreakable rule:  
You can never come back to the NeXus,  
So choose wisely, and don't be a fool.  

    > pt  
    Loading `pt`...  

***Perfect Tune***

"Oh, `DIJKSTRA`, praises be that you have come!  
I knew you'd make it, but I've waited long.  
Beyond that door, the Alph is sailed and swum,  
And there, my sisters sing - listen!  Their song!"  

    > press cup to door  
    You press the cup to the door.  
    > press ear to cup  
    You press your ear to the cup.  You can faintly make out the words...  
    Suddenly, you are struck with an irresistible urge to get closer!  
    Battering down the door, you dive into the water. 
    Soon, you find yourself swept away by the current and dashed upon the rocks!  

    You have fallen prey to the sirens!  
    Undo y/n?  
    > y  

    > wait  

"You dare to mock my wait?  My sisters' hymn?  
You won't give heed to music in the air?  
You won't go in the Alph with me to swim?  
`SM`, or else `uq`, then!  I don't care!"  

    > uq  
    Loading `uq`...  

***Ultimate Question***

"I see you've come to me at last;  
So please, do sit and stay.  
The question that has puzzled me  
Is clarified today.  

I am the Great Computer  
And I've waited here for thee  
To arrive and act as tutor.  
For this question and for me.  

It has gnawed at me like cancer  
But solutions here you bring.  
So, pray tell, what is the answer  
When one questions everything?"  

    > 42
    
"...so simple.  So sublime.  Indeed,  
And beautiful, it's true!  
I have the final piece I need  
My answer:  Forty-two.  

So in return, I warn you now:  
Do not go to `TG`!  
`SM` is now your only choice.  
I help, as you helped me."  

    > TG
    Loading `TG`..
    
***The Game***

    You have lost the game!
    Undo y/n?
    > y
    
***Ultimate Question***

    > SM
    Loading `SM`...
    
***Sub-Mare***

"I am the horse who lives beneath the sea.  
Of FACTS and LOGIC do I make my home.  
You Yahoos all look just alike to me;  
I am a [Houyhnhnm](https://en.wikipedia.org/wiki/Houyhnhnm) beneath the foam.  

Your trial states that you may here return  
But logically, I doubt you ever shall.  
If you can't see this, you have much to learn,  
`ve`, or else `lg` via canal.  

You could, of course, directly go to `end`,  
But I know `DIJKSTRA` takes excessive risk.  
Unlike the wizard, I am not your friend,  
But when you see the Guardian: be brisk!  

    > lg
    > Loading `lg`...

***Lamprey Guardian***

Through mud  
I scud  
For blood.  

For eel  
This meal  
Is real.  

I'll drink  
Your ink,  
I think,  

And feed  
With speed.  
Agreed?  

    > GW
    Loading GW...
    
You flee  
From me,  
I see...  

***Gnome Wizard***

"Here at last!  
You're still alive!  
There were odds out:  
Six to five!  

I see you're hurt.  
A lamprey bite?  
I am wizard!  
I'll make right!  

All better now?  
You see, I fix!  
I am wizard!  
I have tricks!  

There's just one path  
As you can see:  
No more options!  
Pick `ve`!  

And when you leave,  
I'll sit and cry.  
I am wizard!  
Now, goodbye!  

    > ve
    Loading `ve`...
    
***Very Easy***

Threre are three different jugs on the table,  
Which, to pass, you must fill by a reckon.  
Now, the first jug is filled with eight cups' worth,  
But just five cups will fit in the second.  

Now, the third has three cups as its measure,  
But is empty now, just like jug 2.  
So with eight cups' of water between them,  
Here's the puzzle presented to you:  

Via pouring these jugs, move the water,  
So the first jug is half full with four,  
And another four cups in the second,  
And the third must be empty once more.  

Hearing this, do you think you can do it?  
Can you finish before you've turned grey?  
You have journeyed twelve days underwater,  
But I think that much longer you'll stay.  

    > inv
    Inventory contains: cup.
    > scoop water with cup
    You measure out a cup of water - sure enough, you can scoop exactly one cup's worth!
    You begin scooping water from the large jug one cup at a time.
    Soon, you reach the configuration [4, 4, 0].
    
You have cheated!  No fair!  That's illegal!  
I should never have trusted the gnome!  
I can't stop you - the `end` is now open,  
So although you've not earned it - go home!  

    > end
    > Loading `end`...
    
***End***

Well done, `DIJKSTRA`!  Here's the end.  
Roads are tough, and travels, long.  
Trips like yours will soon be penned:  
Your journey will sound good as song.  

Traveling to every room  
You've kept the rules down to the letter.  
Narrowly avoiding doom  
And every time, returning better.  

Though you've won, if you should want  
To try a slightly harder mode  
In which you can - just once - re-jaunt  
*That* trip would *surely* earn an ode.  

If you should care to try again  
And come back to a fresh debut,  
Eject the floppy disk and then  
Insert **PRO PATHFINDER**...v. 2!  

### Day 13: Origami

Gossamer paper  
Folds to make complex patterns  
Like Christmas snowflakes.  

### Day 14: Confessions of a Polymer Scientist

Long ago, I was free;  
When no chain-links bound me,  
I was filled to the brim with elation.  
But I branched out - alas! -  
To the plastics and glass  
In the realm of polymerization.  

I had dallied, of course,  
With the Circle of Mohr's,  
And with chemistry had a flirtation.  
But I dodged every hook  
'Till I picked up a book:  
"Painter-Coleman: Polymerization".  

When I started this school,  
I thought resins were cool  
Since the heat was not set to "cremation".  
But when temps went ablaze  
I was set in my ways  
By the thermo-polymerization.  

Yes, I've long since been cured  
Of atactic which lured  
Me to radicalize my vocation.  
But, I cannot change gear  
Since I've made my career  
In this field of polymerization.  

I have given some talks  
To Electro-Chem docs:  
They enjoy every graph and citation,  
But the adjuncts are mean:  
"That's spaghetti on screen!"  
When I show them polymerization.  

But there's upsides as well  
To the field where I dwell:  
I don't need Maxwell's stinking equation!  
For my stuff can't conduct  
And electrons get chucked  
Out the door in polymerization.  

There are others out there  
Who I've linked with to share,  
And our network's helped ease the frustration.  
Meeting people like me  
Has increased my degree,  
My degree of polymerization.  

And I've even had fun  
Letting DSC run  
While I'm counting chain ends with titration.  
And in fact, if compared  
To compilers, I'm scared  
Since my program's not spared  
From the errors declared  
Which all must be repaired  
By a man unprepared --  
So I'll stick to polymerization!  

### Day 15: Lazy Limerick #1

You can pathfind to dodge all the critters  
But the coding is not fit for quitters.  
By the time you have won  
When you've got it to run  
I won't blame you for getting the jitters.  

### Day 16: An Ordinary Conversation

"Ahoy!  Is this the submarine?  
Our packets should be nigh.  
Can anybody hear us?  Do you copy?  Please reply!"  

"A scrambled mess was all we got  
Of data clearly hexed.  
Could you be just a bit more clear?  We're all a bit perplexed."  

"A packet's `version` number, then it's  
`Operator`, `ID`,  
Concluded by the subpackets.  It all is rather tidy."  

"And when we've done recursion, while more  
Obstacles befall us?  
Come on and say the matter where you couldn't simply call us?  

"Any math, we send to you,  
Or else, it'd surely bore us.  
[Class had homework](https://adventofcode.com/2020/day/18) overdue we'd hope you'd figure for us..."  
