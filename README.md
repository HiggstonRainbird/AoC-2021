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

### Dumbos

These octopuses aren't so bright, but yet they get to shine,  
And light the caves for miles around when energies align,  
Eventually syncing up, converging by design:  
Their pastimes seem to go an awful lot smoother than mine.  
And so, when yet another piece of submarine should break,  
I envy the dim octopi; machines were a mistake.  
