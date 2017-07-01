+++
title = "About Pointer Tagging"
date = 2017-07-13T03:01:24+05:30
slug = ""
tags = []
categories = ["programming"]
draft = false
+++

From the 100s or 200s of suspended chrome tabs, I opened one of the tabs to make some progress (Imma yuuge procrastinator).
This was a [LWN article](https://lwn.net/Articles/725508/) of a talk on **Memory use in CPython and MicroPython** by Kavya Joshi at PyCon '17 (USA).
You can find the video of the talk [here](https://www.youtube.com/watch?v=d7qEzpnkWaY). It's a great talk. 

The talk contrasts two reference implementation of python:

- CPython
- MicroPython

Even though both are implementation of python but they are quite opposite with respect to the memory usage. The speaker (Kavya) then shows how variables(or objects) are implemented, how much bytes of memory is needed, heap usage upon creation of large number of objects and so forth.

Well, they both have their target audience. MicroPython was created to run on microcontrollers and similar hardware, i.e, space constrained hardware. So, It makes sense for it to be very conscious about space unlike CPython.

Alright but there's one thing that caught my attention. *Pointer Tagging*

#### Pointer Tagging?
It's a low-level programming implementation to use the unused bits of pointer[[1]] to let's say specify the type of the object or reference count or anything ([read more](https://en.wikipedia.org/wiki/Tagged_pointer)). Using pointer tagging, large performance gains can be achieved. MicroPython uses this technique to save up 8 bytes of memory where CPython need a `*type` pointer to specify the type of object.

This is great. I also came across another article that shows benchmark on performance gain while casting types. [Here you go](https://blog.chewxy.com/2013/12/10/pointer-tagging-in-go/).

TL;DR: He showcases instead of using `interface{}` or `switch .type()` in Go to change type, one can do it using pointer tagging. Even though it involves use of a package **unsafe**. But why go about writing messy code instead of using oneline solution? 

Turns out during benchmarking, there was a performance gain in I/O. So, one can cast types faster and in computing any performance gain is good (Remember [Strassen's matrix multiplication algorithm](https://en.wikipedia.org/wiki/Strassen_algorithm)). 


[1]: https://en.wikipedia.org/wiki/Data_structure_alignment