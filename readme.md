This is the LUA code for the FAF coop mod.

How do I start contributing?
----------------------------
#### Setup Git
To start working with these repositories, you have to download [git](https://desktop.github.com/) and make a [github account](https://github.com/).

When you have done both, you should follow these two steps to configure your git setup:
1. On your computer, open the **GitHub** application.
2. Go to Options.. and fill in everything with your github accounts information.
3. Make sure to save your changes and then you can close it.

The **GitHub** application has a short and simple tutorial that explains how you can easily create new branches and pullrequests. You can use it for most of your basic needs. 

From now on we will be mostly explaining how to do things with the **Git Shell** application. This is a commandline for all your git operations which will give you some more freedom and control.

#### Fork a repository
Now you're ready to work with the repositories. 
Go [fork](https://help.github.com/articles/fork-a-repo/#fork-an-example-repository) each repository that you want to use. (We'll use fa-coop, but it works similar for others)
![Click on Fork in the top right of the page.](https://help.github.com/assets/images/help/repository/fork_button.jpg)
You should have a fork of this repository inside your own accounts list of repositories.

#### Clone a repository
Next you will want to get a local copy of your forked repository, this is called cloning a repository.
You can follow [these steps](https://help.github.com/articles/cloning-a-repository/) and use them with your **Git Shell** application instead of the predescribed Git Bash.

If you want to use the **GitHub** application instead then you can follow [these steps on how to clonse a repository](https://help.github.com/desktop/guides/contributing/cloning-a-repository-from-github-to-github-desktop/). 

#### Use your lua code in a game
You finally have the code on your computer and want to see the execution in game.
Inside of the repository is an `init_coop_beta.lua` file that you need to **copy** inside ```C:\ProgramData\FAForever\bin\```
If you changed where your GitHub folders are then you'll have to edit the file and change some file paths. *( Make sure you don't edit the original file, to avoid problems later )*

Inside this folder, ```C:\ProgramData\FAForever\bin\```, you'll find `ForgedAlliance.exe`.
Make a shortcut for it and put it in an easily accessable place. (For example your desktop)
Go into its properties (right click) and change the target:
```
ForgedAlliance.exe /init init_coop_beta.lua
or
ForgedAlliance.exe /init init_coop_beta.lua /showlog
```
If you add `/showlog` then the log window will automaticaly appear. There is an ingame keybind to summon the log window aswell. So it depends on your own prefence if you want it from the start or not.

You're finally ready to make changes to the lua code and test them!

## Getting your changes from local to the FAForever repositories
Start up your **Git Shell** and go to correct local repository folder to start using git.
```
 > cd FOLDERPATH
```
When you reach it you should see something like this :
```
YOUR_PERSONAL_PATH\fa-coop [master ≡]>
```
That's when you can start using git commands, of which you'll get an introduction next.
#### Make a branch
Whenever you make or are going to make an interesting/usefull change then you should share it with the community.
This is where you'll use branches. For each completely new thing, you should start a new branch.

This is a nice basic [guide for basic branching](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging) .
The main take away from the guide is that you should switch branches with `git checkout BRANCHNAME` and can use `git checkout -b BRANCHNAME` to make a new branch *(see the -b of branch)*. Always make sure you first checkout to the master branch, before making a new branch. Since your new branch will be based on the branch you're currently in. So unless you're a little more knowledgeable about these things, i wouldn't recommend branching from a different branch than the master branch.

#### Commit your changes
Okay, so now you've made a new branch. Go and do your changes. Whenever you made a significant change its usually a good idea to save it, so you can easily go back to it when future changes break something. *Version control ftw!* 

This is a simple workflow that you can use: 
```
> git status
    You get information regarding changed files etc. For example:
        lua/ScenarioFramework.lua
        lua/ScenarioTriggers.lua
> git add lua/ScenarioFramework.lua
> git add lua/ScenarioTriggers.lua
> git commit -m "I changed this and that" -m "So I added these things and those things"
```
So first you start with `git status` which will show you whatever files you changed. Secondly You choose which of these files you want to save, by adding them with `git add FILEPATH` *(you can hit tab to autocomplete the FILEPATH and cycle through all posibilities)*. Lastly you actually save the changes into a commit with `git commit -m "Subject line" [-m "Message body"]` *(see the -m of message)*. The first message is the main subject line and will be the only thing people will read. In some cases a short subject line can't explain the scope of the commit properly. That is when you should add the message body, which can be a lot longer, to fully explain the saved changes.

#### Put your changes online
When you have made all the changes you want for a certain issue/feature and you've put everything in commits, it is time to push it to the remote repostory with:
```
 > git push
```
If this is the first time you push, you'll get an error message like this
```
fatal: The current branch BRANCHNAME has no upstream branch.
To push the current branch and set the remote as upstream, use
    git push --set-upstream origin BRANCHNAME
```
You should simply copy/paste this line and the branch will be created in the remote repository and you'll be able to use `git push` for this branch without any issue.

Go and take a look at your online git repository and you should be able to find the new branch you created.

#### Working with issues and pull requests
The main way of communication on github is done with issues and pull requests. 
- Whenever you find a problem or have an interesting idea, then you can make an issue for that. If there already is an issue for it, then you should comment on the original one, instead of making a new issue.
- Whenever you have something of value (bugfixes/improvements/etc) to add, you can make a pull request. Other contributors can review your changes and help improve them and/or confirm their validity. Afterwards your pull request will get merged into the master branch and will be a part of the future releases. So it is not only for sending your own changes, but also for reviewing others' pull requests. Reviewing can be quite laborous, so we'd like as many people as possible doing these so changes will be of a better quality and merged a lot faster.

##### Making an issue
To make an issue about a bug/possible improvement/new feature/etc, you should go to the original repositories webpage and [create an issue there](https://help.github.com/articles/creating-an-issue/).
Don't make issues in your own forked repository unless you don't want anyone to know about them.
##### Making a pull request
To make an issue with your changes for a bugfix/possible improvement/new feature/etc, you should go to the original repositories webpage and [create a pull request there](https://help.github.com/articles/creating-a-pull-request-from-a-fork/).
Most of the time pull request will be related to an issue and merging it will solve the issue. You can close an issue manually but its a lot easier if it would automaticaly close when the pull request is closed. You can achieve this by adding a [keyword and a reference to the issue](https://help.github.com/articles/closing-issues-via-commit-messages/) inside the body of your pull request message.


#### Keep your fork synced
Whenever pull requests get merged, you'll want to get the commits into your fork too, aka [sync your fork](https://help.github.com/articles/syncing-a-fork/).
The main reason you want to have an up to date local repository is to avoid conflicting changes in your own pull requests. Such conflicts can be a pain in the ass to solve, so it's a good habit to make sure your fork is synced before starting something new.


Contributing for Pro GitHub users
---------------------------------
    
To contribute, please fork this repository and make pull requests to the
develop branch.

Use the normal git conventions for commit messages, with the following rules:
 - Subject line shorter than 80 characters
 - No trailing period
 - For non-trivial commits, always include a commit message body, describing the change in detail
 - If there are related issues, reference them in the commit message footer

We use [git flow](http://nvie.com/posts/a-successful-git-branching-model/) for our branch conventions.

When making _backwards incompatible API changes_, do so with a stub function and put in a logging statement including traceback. This gives time for mod authors to change their code, as well as for us to catch any incompatibilities introduced by the change.

Code convention
---------------

Please follow the [Lua Style Guide](http://lua-users.org/wiki/LuaStyleGuide) as
much as possible.

For file encoding, use UTF-8 and unix-style file endings in the repo (Set
core.autocrlf).
