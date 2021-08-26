[<<< Back To Readme](../../../../README.md)
<p align="center">
    <img src="https://github.com/T4D-Suites/T4D-Ressources/blob/master/LogoT4D.png">
</p>

# Intro

Every Jenkins server compatible with T4D is managed by a repository prefixed with `ConfigT4J` and piloted by [Tools4Jenkins](https://github.com/iFeelSmart/Tools4Jenkins) repository. 

You don't have to use Tools4Jenkins neither understand how it works, the only thing you will have to to take place in the repository with his prefix `ConfigT4J`

# Dependencies

We assume that you already have T4D paradigm on your repository with a fully functionnal wks options that will allow user to generate any wanted artefact

# Presentation

You might have to adapt your wks options to be able to send it to Jenkins. In your jenkinsfile you will be able to define one wks option for each specific sequential step of your pipeline. 

For example on a classic project where you don't have any matrix that will define all your targets you will simply have something like that : 
<p>
    <img src="https://raw.githubusercontent.com/T4D-Suites/T4D-Ressources/master/screenshot-sequential.png">
</p>

`lorem ipsum` is your wks option, that you can call locally with `wks lorem-ipsum` and it's this information that you will have to setup in your jenkinsfile(s). In other words telling jenkins which wks option to call.

Remember that this Jenkins library is fully scalable. Sometimes you will find the first integration painful but it will enable you to scale at any level and in any direction and at any time once it will be done.

You can see bellow how jenkins-lib can managed in less than 100 lines thoses types of complexity and more over, conditionnal matrix building by parsing parameters sent by users.
<p>
    <img src="https://github.com/T4D-Suites/T4D-Ressources/blob/master/screenshot-hardcore-sequential.png">
</p>


Please note that the great value of this library is to allow the user to test locally (by using wks) a majority of his setup and you will almost never have to call any admin to fix a build problem that concern your project configuration. 

# Current Repository

Previously we might encourage you to cut out you build process. For example your project might need to sequentially run wks options bellow in order to generated your artefact
```shell
wks configure
wks build
```

In that case, you might want to "merge" thoses to be able to call them in one single line in your jenkins file 

```groovy
pipeline.exec(M_BuildTargetMain,"allInOne")
```

instead of 

```groovy
pipeline.exec(M_BuildTargetMain,"configure")
pipeline.exec(M_BuildTargetMain,"build")
```

that will show you 2 sequentials bullets in Jenkins BlueOcean instead of one. 

## Wks

To avoid that, we can simply define a "global" options that will encapsulate both `configure` and `build` in a single command. 

for example : 

```shell
chp -option allInOne
```

Then complete the function created in file `_main_.env` ->

```shell
_wksAllInOne(){
###### DOCUMENTATION BLOC #####
...
########## CODE BLOC ##########

    _wksConfigure ${@}
    _wksBuild

###############################
}
```

Note that you can also define several scenarios depending on first argument

```shell
_wksAllInOne(){
###### DOCUMENTATION BLOC #####
...
########## CODE BLOC ##########
    case $1 in 
        debug)
            _wksConfigure ${@}
        ;;
        release)
            _wksConfigure ${@}
            _wksBuild 
        ;;
        production)
            _wksConfigure ${@}
            _wksBuild -env production
            _wksExport 
        ;;
    esac

###############################
}
```
And call them in your jenkinsfiles :

`Jenkinsfile.delivery`
```groovy
pipeline.exec(M_BuildTargetMain,"allInOne production")
```

`Jenkinsfile.beta`
```groovy
pipeline.exec(M_BuildTargetMain,"allInOne release")
```

`Jenkinsfile.test`
```groovy
pipeline.exec(M_BuildTargetMain,"allInOne ${env.M_UserParam}")
```


## Jenkinsfiles - Singleton

Jenkinsfile's should not be edited every single day, that is why we use tools4dev to encapsulate all wks function. In that case we can build our CI with safety and be sure that if something goes wrong during any build it's not a false positive and really need to be fixed on the dev side.

### Header

Here is an example of Jenkinsfile header. 

```groovy
#!/usr/bin/env groovy
@Library('main@release/1.0.0')
// ///////////////////////////////////////////
import library.Main.*
// import hudson.model.*
import hudson.EnvVars
import groovy.transform.Field
// ///////////////////////////////////////////
def job = new api.job()
def pipeline = new api.pipeline.sequential()
// ///////////////////////////////////////////
M_BuildTarget=["Slave"]
M_BuildTargetMain=["-"]
//////////////////
```

The most important things to see is `@Library` line because it will give you Jenkins-Lib's branch/tag that will be used by jenkins. 

Note : Every Jenkins pipeline is configured to match a library called `main` and a git repository (prefixed with LibT4J and automatically generated by Jenkins-CLI)

By default every variable in JenkinsLib is prefixed by M_ in order to differentiate them from Jenkins Native values.

### Config

```groovy
env.M_Project = "Main"
env.M_RepositoryUrl="github.com/iFeelSmart/T4D-Sample-CMake.git"
env.M_NotificationLvl=1
env.M_IrcChannel="ci-dev"
//M_NotificationLvl0->Only Notif when build is failing
//M_NotificationLvl1->Notif only when build is finished
//M_NotificationLvl2->Notif Start + Build finished
//M_NotificationLvl3->LVL2 + Warning
//M_NotificationLvl4->Jenkins Log Lvl
```

In this section, you will be able to define several things like Repository URL (this is really useful when you want to create a service related to another repository to automate actions that has not to be part of your git repository (because they are generic)

The most important values should be `M_Project` and `M_IrcChannel`. The first one will be used by your Jenkinslib to identify which project you want to use, their build scheme, or their affected builders (we will see that in `ConfigT4J Repository` section)

### Pipeline Calls

```groovy
job.start()
pipeline.workspace(M_BuildTarget,"SCM","start")

pipeline.exec(M_BuildTargetMain,"allInOne")

pipeline.workspace(M_BuildTarget,"End","end")
```

Finally, your pipeline calls. 
`pipeline.workspace` & `job.start` should not be edited, moved or duplicated, They are very important because they build manage and configure your ci workspace properly. The only things for you that you need to understand, use and abuse is `pipeline.exec`. 

This api call is more or less than telling jenkins `execute >wks allInOne< in my workspace please` 

Other alternatives if you want to show seperate logs in Jenkins WebUI could be : 

```groovy
pipeline.exec(M_BuildTargetMain,"configure")
pipeline.exec(M_BuildTargetMain,"build")
```

or 

```groovy
pipeline.exec(M_BuildTargetMain,"allInOne ClientA")
pipeline.exec(M_BuildTargetMain,"allInOne ClientB")
pipeline.exec(M_BuildTargetMain,"deploy ClientA ClientB")
```

They are very few limitations on what you can do and our credo is `If you can manage to make it work on your machine, you should be able to make it work on Jenkins` 

# Links

- [Sample - CMake's CI Integration](https://github.com/T4D-Suites/T4D-Sample-CMake/pull/1)
- [Sample - CMake's ConfigT4J Integration](https://github.com/T4D-Suites/configT4J-Sample/pull/1/files)
