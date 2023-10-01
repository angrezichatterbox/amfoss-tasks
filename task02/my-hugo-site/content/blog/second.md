---
title: "🔨 How did I construct this amazing web page? 🛠️🌐"
date: 2023-08-28T12:00:37+05:30
draft: false
tags: ['hugo','html','css','brew','Safari','github']
showBreadCrumbs: true
showReadingTime: true
showSharebuttons : true
showPostNavLinks : true
ShowShareButtons: true
--- 




I built this incredible website using an amazing tool – 
### Hugo! ✨

Hugo, in case you're wondering, is an absolute gem when it comes to crafting websites effortlessly. It's an open-source static site generator that works like pure magic, transforming your ideas into captivating web pages with minimal fuss. 🪄 You can think of Hugo as the ultimate wand for web creation.

Hugo itself is a static site generator built with Go (also known as Golang). It gracefully takes content files and templates to orchestrate the birth of a complete website.

### The website is created for Task 2 of amFOSS Praveshan 2023.

Now, allow me to narrate the enthralling journey of piecing together this webpage:

I started by reading about the task list that was given to me. I read about Hugo and how it's an easy way to create static web pages without much coding of any sort (even though later on, I had to use Visual Studio to make my tasks easier). I first went to the terminal on my Mac. Since Brew was already installed for a previous task, I didn't need to install it again.

Then I created a folder on my Desktop to store the files of the website.

Next, I went to the terminal to install Hugo, for which I used the statement:

#### brew install hugo

After that, I created the site UIs. I found a theme that suited my style and installed it into the same directory using the command:

#### git clone https://github.com/adityatelange/hugo-PaperMod themes/PaperMod --depth=1

Upon checking, I found that a folder I created on the desktop had Hugo files in it. I explored different files within it.

After installing all the dependencies required by Hugo, I started building the site with the following commands:

I created the webpage using the command:

#### hugo new site hugo-demo

To run the website, I used the command:

#### hugo server

This created a local host within my computer. I then opened up the Safari browser and typed localhost:1313, which opened the website.

Following that, I added my first content to the website

For adding content to the website i opened the folder containing the website in visual studio code . Then within the contents folder added a folder names blogs within which i created my first blog that is 
second.md
here md file markdown text is used 
//---
title: "🔨 How did I construct this amazing web page? 🛠️🌐"
date: 2023-08-28T12:00:37+05:30
draft: false
tags: ['hugo','html','css','brew','Safari','github']
showBreadCrumbs: true
showReadingTime: true
showSharebuttons : true
showPostNavLinks : true
ShowShareButtons: true
// --- 
the above things were typed first breadcrumbs indicates the location showing lilke home>>blog ... Reading time indicated the time required to read the blog 
sharebuttons indicated the various social media icons and it helps in sharing a specific blog. postnavlinks indicated the icon to move to the next blog.

After creating the blog post i then moved on to create the home page 

For creating the home page i had two ideas one was to do a simple hello everyone and below there would be the blogs i had instead of opting for this idea i opted to show a profile picture and then a quote to welcome everyone to the website for this the code used is 
/profileMode:

enabled: true

imageUrl: "img/gamma.png" # optional

imageTitle: "" 

imageWidth: 240 # custom size

imageHeight: 240 # custom size

Title: "Hey there, wonderful people! 🌈👋😄 "

Subtitle: "Step into my tech world where I share my projects and passion for all things geeky. Let's dive in together! 🚀👋"


for adding a menu into the webisite i used the command
main: 
    menu:
    name:
    url:

This is how i created my first website 

I was able to fix many of my problems later on when i uplaoded my webiste without the entire git workflow and instead opted for creating a public folder and then doing it

