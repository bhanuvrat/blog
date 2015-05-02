---
title: Problematic ACPI on new Dell Studio 1450 laptop
author: anuvrat
date: 2010-04-09 16:11:00
template: article.jade
---


The Wipro Laptop had seen its good days, but its keypad went wrong (worked fine at night, and in the morning it was screwed up) and started displaying two characters upon one key press, its lan port and memory card slot wouldn't ever work, its CD/DVD drive would get screwed up every 2 months and most recently its screen cracked ( dunno how it happened) and a vertical white line hid two characters behind it in text mode and equivalent area in graphics mode). The width of this white line was going on increasing and presently it covers area equivalent to 2 characters in text mode. These developments ( -ve sense) pushed me to get a new laptop for myself and this time I decided not to make the mistakes I had made the last time. I went for a Dell Studio 1450 laptop.

---

### Specifications:

    - Intel Centrino Core 2 Duo 2.26 ghz 1066 mhz, 3MB cache
    - 4GB RAM<br>500 GB SATA HDD
    - 512 MB ATI Mobility Radeon 4530

### The ACPI problem:

Its on this new laptop that I am facing a problem with Linux OSs. However Windows 7 that was shipped with the machine works fine. Initially i wasn't even able to boot into a live installer CD. *During booting (into a live CD or hard drive) the screen would go blank right after loading ACPI module and the computer would not respond to anything including Ctrl+Alt+Del, the only option left out would be hardware power off*.  I went around on [forums] (http://www.linuxquestions.org/questions/linux-laptop-and-netbook-25/linux-on-dell-studio-14-a-782312/) begging for help but ultimately it was a teenage linux magazine columnist (Shashwat Pant) who helped me out on gtalk. The solution was to append `acpi=off` as a *kernel parameter* in grub. This got linux up and running on my laptop but was not a permanent remedy. `acpi=off` ended up disabling a lot of options eg - battery was not recognized, function keys behaved in the opposite manner etc. It also caused power button to function as the ones on computers of 90s - i.e when pressed, the laptop would not ask for what is to be done rather it would get switched off (without the process of shutdown - or holding the power button for a while) right away. And the computer had to be switched off manually even after choosing shutdown from the power menu. Here is the [link](http://www.linuxquestions.org/questions/linux-newbie-8/ctrl-alt-fn1-fn2-etc-do-not-work-785110/) to the forum I used for all my problems till then. 


### Attempts to resolve it:

On OpenSUSE, just for fun and learning, I compiled and _installed linux kernel_ 2.6.32 and to my surprise the *acpi problem had vanished :). However there were other problems that I had been facing on it (specifically - installing the graphics driver caused  display - dragging windows or scrolling text all were jerky and without the driver compiz fusion won't work :( ). And in the process of trying to solve the graphics problem I screwed up OpenSUSE. Arch Linux seemed to be attractive enough and I reckoned that installing every thing one by one on my own might help me recognize the root cause of problems. However the *new kernel trick didn't work on Arch*, and I was again chasing the same problem. (My [post](http://bbs.archlinux.org/viewtopic.php?id=92801) on arch forum.) 

I found that while compiling the kernel, the ACPI module can either be compiled into it or as a separate module to be loaded later. I tried both ways and what I found was really demoralizing. Without the acpi=off option the _OS behaved quite randomly i.e sometimes it would boot fine and sometimes not_. I also tried compile the kernel after disabling those options (in the menuconfig's submenu about acpi) which had deprecated mentioned beside them, with no luck. _(i.e not specifying `acpi=off` causes the same problem that it used to cause initially, irrespective of the options I choose while compiling the kernel)._

### Recent Development:

Today I found that the computer does not hang !!. its just that the screen goes off if I do not specify the acpi=off option. That is while it is booting, the screen goes off right after loading the acpi module but the boot process continues. I knew that after booting the arch installation ( which presently has no graphical desktop environment) prompts me for id and password. Although it was not visible, I keyed in my id and password and then fired reboot command ---- and --- the computer rebooted !!!. 

I have not lost hope and am still pursuing the ghastly outline of solution. Any kind of help is welcome !!