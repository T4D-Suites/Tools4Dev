[<<< Back To Readme](../../../../README.md)
<p align="center">
    <img src="https://github.com/T4D-Suites/T4D-Ressources/blob/master/LogoT4D.png">
</p>

# Introduction
All of your compilable projects are compatible with t4d. 
In this page we will show you how to quickly create a new github repository and use tools4dev as a pilot for all your tasks. 

# Dependencies
First, you will need to install tools4dev on your environnment. 
Each operating system using UNIX should be compatible. You might have to install some packages before, for that please refer to install section (by selecting your OS) in https://github.com/T4D-Suites/Tools4Dev/blob/master/README.md 

# Tools4Dev Paradigm

At this point -> You already have a tools4dev environnement. We will show you all steps that you will need to do to add Tools4Dev paradigm to any project you want.

For this example we assume that you already have a repository with functionnal code in it (but not an obligation, most PoC's can be created from an empty git). We use https://github.com/T4D-Suites/T4D-Sample-CMake/tree/main which is a mirror of a previous Cmake release 

## Clone your repository

```shell
git clone -b main git@github.com:T4D-Suites/T4D-Sample-CMake.git 
cd T4D-Sample-CMake
```

Creating a new branch for this workshop

```shell
git checkout -b workshop/t4d-integration
```

NOTE : For the purpose of the documentation we prefix the new branch by `workshop` but the default might be `feat` or `feature` 
By the way, if you are using T4D-Sample-CMake repository to test it, there is already a branch called `feat/t4d-integration` that contains the result of t4d integration for this project.

## Initial Setup

At this point we assume that you have :
 - Tools4Dev setup in your zsh env 
 - A repository (empty or not) and a dedicated branch for your setup

Now we will use a powerful function that is given to you as an integrator to define your Tools4Dev Environnement -> `chp` 

from your root folder : 

```shell
chp
```

You should see something like that
<p>
    <img src="https://github.com/T4D-Suites/T4D-Ressources/blob/master/screenshot-chp.png">
</p>

This output tell you that tools4dev paradigm has been added to your project !

```shell
git add .
git commit -m "chore: tools4dev integration initial commit"
```

You can now "load" your project workspace by loading t4d env 
`source project.env` and call your project documentation using `wks help`

## Pipe & Wks Options

In every project you will have what I call a `product pipe` : you will always in a way use a command in your term to generate your code's output (binary, app, folder, configFiles, whatever). And during the all life of your code, you might have to change the global behavior or adapt it with new tech etc. 

We have created Tools4Dev to allow you to defined thoses "pipes" and deploy them to your team in seconds. With that logic even if you add something to your process in 6 months, you will not have to tell all your teammates "Oh wait you have to do this `long and painful command` before that unless it will not work any more." 

For example a simple project compilation can be decomposed like bellow :
`configure -> build -> install`

More over, you will be able to use them as option of `wks` function. Your `pipe` will be :
```shell
wks configure
wks build
wks install
```

To be able to call those function, you have to define them and this is where `chp` will be very important : 
```shell
chp -option build
```

Please see the result by using `git diff`.
<p>
    <img src="https://github.com/T4D-Suites/T4D-Ressources/blob/master/screenshot-chp-build.png">
</p>

This command will automatically create options and add them to the right place. I really recommand you to read chp documentation to see what you can do with it ( `t4dHelp chp` ).

We will also add build and install options before commiting anything
```shell
chp -optionExt configure -option install
```

You will see that `-optionExt` will also create a file called configure-utils.env. This will allow you to cut in small and independant parts that will be called during `wks configure` 

```shell
git add .
git commit -m "chore: add options configure build and install"
```

Once you are here you can use thoses created functions (`_wksConfigure`, `_wksBuild` and `_wksInstall` ) to define your own working process.

### Sample CMake
	
  This section has not been completed yet, you can follow external links to have more information about CMake workshop

## Links

- [Sample - CMake's T4D Integration](https://github.com/T4D-Suites/T4D-Sample-CMake/pull/2/files)