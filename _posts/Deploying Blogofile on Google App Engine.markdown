---
categories: blogofile, appengine
date: 2011/02/13 15:00:00
title: Running Blogofile on Google App Engine
---

This post describes how I installed <a href="http://blogofile.com/">Blogofile</a> on Ubuntu 10.10, installed an <a href="https://github.com/pragmaticobjects/gae-enabling-blogofile">App Engine application</a> that I wrote and then deployed my Blogofile-powered blog on Google App Engine infrastructure.  It would be redundant to re-iterate all the reasons of why I chose Blogofile when you can read on the Blogofile web site.  But the most appealing features to me are the built-in Disqus and Git integration and the fact that the Git integration allows me to move my blog to another host easily if I ever need to do it.  But since I wanted to host on Google App Engine, I had thought that if I managed to accomplish this goal, moving my blog to another host would become a moot point.  Regardless, it's still good to have that option.  Blogofile is a great blog engine, but about the only thing that's better than Blogofile is the ability to run it on a solid infrastructure like Google App Engine.  This is where we can get the best of both worlds.       

This post is written for Ubuntu users, but if you use Windows or another distro, I don't think it would be that different.  First, in order to run App Engine on the lastest Ubuntu, you would have to install Python 2.5, which is no longer the default since Ubuntu 9.04.  You can follow the instructions here:

<a href="http://kovshenin.com/archives/installing-python-2-5-on-ubuntu-linux-10-10/">http://kovshenin.com/archives/installing-python-2-5-on-ubuntu-linux-10-10/</a>
or
<a href="http://www.codigomanso.com/en/2010/05/google-app-engine-en-ubuntu-10-4-lucid-lynx/">http://www.codigomanso.com/en/2010/05/google-app-engine-en-ubuntu-10-4-lucid-lynx/</a>

I prefered to have an isolated or virtual environment to work with Blogofile, so I use <a href="http://www.arthurkoziel.com/2008/10/22/working-virtualenv/">virtualenv</a>.  The first few steps are as follow:  

$$code(lang=bash)
k@le:~$ mkdir Blog
k@le:~/Blog$ cd Blog
k@le:~/Blog$ sudo apt-get install python-virtualenv
k@le:~/Blog$ virtualenv env
k@le:~/Blog$ . env/bin/activate
(env)k@le:~/Blog$    
$$/code

Once you activate the virtualenv as in the last line above, the prompt of the shell you are using will change, indicating that you are now in the virtualenv.  Assuming you have already git installed, otherwise it's time now to **sudo apt-get install git**.  Next you would want to grab <a href="https://github.com/EnigmaCurry/enigmacurry.github.com">blogofile</a> from the github source repository and run setup:

$$code(lang=bash)
(env)k@le:~/Blog$ git clone git://github.com/EnigmaCurry/blogofile.git src
(env)k@le:~/Blog$ cd src
(env)k@le:~/Blog/src$ python setup.py develop
$$/code

Now you are ready to initialize, build and run the built-in web server that serves blogofile, by executing the following commands:

$$code(lang=bash)
(env)k@le:~/Blog/src$ cd ..
(env)k@le:~/Blog$ mkdir dev
(env)k@le:~/Blog$ cd dev
$$/code

and then

$$code(lang=bash)
(env)k@le:~/Blog/dev$ blogofile init simple_blog
(env)k@le:~/Blog/dev$ blogofile build
(env)k@le:~/Blog/dev$ blogofile serve 9090
$$/code

It is that simple.  Fire up your browser, and point it to http://localhost:9090, and you will see a simple blogofile blog.  To stop the web server, hit Ctrl-C.  To add your post, create a file in the _posts directory and edit it.  Likewise, you can remove files from this _posts directory to remove the sample posts you see above.  Each time you make any change in either the _posts directory or css style changes or layout changes in the mako files, you need to build(compile) for the new static HTML pages to be regenerated.   

Add your code to Git source control: 

$$code(lang=bash)
(env)k@le:~/Blog/dev$ git init
(env)k@le:~/Blog/dev$ git add _config.py
(env)k@le:~/Blog/dev$ git add _controllers
(env)k@le:~/Blog/dev$ git add _filters
(env)k@le:~/Blog/dev$ git add index.html.mako
(env)k@le:~/Blog/dev$ git add _posts
(env)k@le:~/Blog/dev$ git add _site
(env)k@le:~/Blog/dev$ git add _templates
(env)k@le:~/Blog/dev$ git commit -m "Initial check-in"
$$/code

Create an account on github, and then create a repository while you are in the admin console.  Back to **~/Blog/dev** directory, you are ready to push to github:

$$code(lang=bash)
(env)k@le:~/Blog/dev$ git remote add origin https://...@github.com/.../<your_repo>.git
(env)k@le:~/Blog/dev$ git push origin master
$$/code

Create an account on Google App Engine, and it's time to create your app engine program:

$$code(lang=bash)
(env)k@le:~/Blog/dev$ cd ..
(env)k@le:~/Blog$ mkdir ae
(env)k@le:~/Blog$ git clone git://github.com/pragmaticobjects/gae-enabling-blogofile.git ae
(env)k@le:~/Blog$ cd ae
(env)k@le:~/Blog/ae$ vi app.yaml
$$/code

Replace the name of the app in app.yaml with the name that you select for you application.  Go back to **~/Blog/dev** directory, and rsync the compiled, static files to your app engine directory.  

$$code(lang=bash)
(env)k@le:~/Blog/ae$ cd ../dev
(env)k@le:~/Blog/ae$ rsync -a _site/* ../ae
(env)k@le:~/Blog/ae$ cd ..
(env)k@le:~/Blog$ 
$$/code

Finally, let's deploy to app engine.

$$code(lang=bash)
(env)k@le:~/Blog$ ~/<path to gae>/appcfg.py update ae
$$/code

That's it.  It takes longer to write than actually carrying the steps above.  Instead of manually executing the rsync command each time, you could also take advantage of the post-commit hook provided by github for a little automation.  I however prefer this manual step, since I want to serve locally on the built-in web server and verify everything is OK first.  There are 2 demos you can check out.  The first one is this very same site that you are visiting.  You can verify by switching to its appspot domain:

<a href="http://lehoangkevin.appspot.com/">http://lehoangkevin.appspot.com</a>

or another demo blogofile site running on Google App Engine:

<a href="http://blogofile-gae-demo.appspot.com/">http://blogofile-gae-demo.appspot.com</a>   

<small>I want to thank <a href="http://mike.pirnat.com/2010/12/21/how-i-deploy-my-blogofile-blog-on-webfaction/">Mike Pirnat</a> for answering many of my initial, silly questions about Blogofile.  Thanks Mike.</small>
