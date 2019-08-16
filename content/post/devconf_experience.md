+++
title = "Devconf India 2019"
date = 2019-08-16T13:24:50+05:30
slug = ""
tags = []
categories = []
draft = false
+++

Devconf is an annual developers conference organized by Red Hat attended by students, professionals and enthusiasts alike focusing on FOSS. It was a 2-day event organized in Christ university like last year.
Being a part of Red Hat, it was definitely a plus for me to attend Devconf. Simply because it felt like a day out with other Red Hatters.
I have also attended last year's Devconf but this year I was speaking as well.  
This is my experience of attending and speaking at Devconf 2019. 

## First talk of the day in Networking track

I have proposed a talk just couple of days after the CFP opened up. It was something that I have been working for a while now and been passionate about it ever since I was introduced to it by my manager, [Pradeep](https://www.linkedin.com/in/pradeep-kumar-surisetty/). 

#### BPF

And it is eating the world, or just software world. I proposed to give a deep-dive introduction to BPF. It's history, how it came to be, how to use it, how are companies using it etc. Here's the talk outline for reference:

- Introduction to eBPF  
    - tcpdump: Beginning of BPF
- What is eBPF? 
    - Features
    - Use-cases
- How does eBPF works?
    - BPF syscall, maps, prog types
    - How is BPF safe?
       - Overview of eBPF verifier
- How to use eBPF?
    - System requirements
    - Writing eBPF program in python using BCC(BPF compiler collection)
    - front-ends, DSL etc
- XDP
    - Overview
    - XDP real life-scenario
       - Test setup
       - Benchmark comparison between iptables and XDP
- Takeaways
- Q&A

The talk was selected for the networking track and was put up as the first talk of the day after keynote for that track, which will include an extremely difficult task of waking up early in the morning. 

#### House full
I somehow managed to wake up early and joined my friend, who works at AWS and was interested to attend Devconf as well. As we make our way to the venue battling our way through the Friday morning Bengaluru traffic, we made it 15 minutes before the start of my talk. Not bad. 

![Start of the talk](/IMG-20190806-WA0033.jpg "Start of the talk")
I reached the conference hall and with the help of track leads, setup my laptop up in seconds, ready to start the talk at any moments. 

People started coming in after the keynote. All session timings were well-organized and given ample time between talks for attendees to move around from one conference hall to another. Such details go a long way in organizing a successful conference.

5 minutes into the talk start time, people are still coming in and try to settle themselves into available seats. Track captains mentioned that I have 15 minutes buffer for the talk. 

I decided to start my talk by giving out few basic disclaimers about the talk structure and the target audience for the talk to ease people in to their seats, while at the same time more attendees are joining in. 

After a bit of movement of footsteps and introductions, the room was filled with combination of familiar and new faces of various age groups. Couple of people had to stand as there was no space left. 

![BPF sorcery going on](/IMG-20190806-WA0025.jpg "Mid talk photo")

By now, I am done with my introduction and ready to start the adventure into the BPF world. 

#### Aaaand, Off we go !!!

The talk was a breeze finishing just short of time and lot of interesting questions from the audience. It soon became an informal discussion between the attendees before we were kicked out by the track captains. 

Post the talk, I got to meet a couple of LTC members from IBM who were working on BPF and whose work I have been following. We got into the conversation of what's happening in the BPF community and what to look forward and whom to follow in the community for interesting work in BPF landscape.

I was reached out by a couple of Flipkart/Walmart engineers who were considering eBPF/XDP for their networking use cases. We talked a bit and it was quite interesting for me to get to know how they are continuously solving problems that comes up while building a solution. We finally came to conclusion that there should be a collaboration pipeline between different companies to actually solve real problems.

### NIC partitioning

I was able to attend a talk on NIC partitioning in OSP by folks from Bengaluru office. It showcased how they are able to solve the network cabling in OSP deployments while QOS bandwidth. 

The QnA session became a part battle-zone discussion with arguments flying here and there among attendees and speakers. The track captain again comes to the rescue and peacefully moves everyone out.  

### Networking and Networking

The conference provided a rich opportunity to get to meet a lot of people. I spent majority of my time catching up with old friends from other companies as well as new people doing interesting things at their workplace. 


### End of the day
Closing keynote from Gorkem on his experience as an open source developer was perfect for wrapping up the day. Key take away from the talk for me was **_read more open source code_**. 

The first day of the conference was jam-packed with things happening. Kudos to the organizing team for the great work. 

I spent the evening with my team(perf dept) and new friends we made along the way with burgers and drinks as well as with Ansible networking team for the night. 


## Day 2

I fell ill from too much partying it seems and couldn't attend Day 2. 


## Slides for the talk
Here are the slides for my talk: https://docs.google.com/presentation/d/1tWXuNlu6E1uT9aSJZm6m7JnmcG4uNssBZ2-q9WeGxCU/

