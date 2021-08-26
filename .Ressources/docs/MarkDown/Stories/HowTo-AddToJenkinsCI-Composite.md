[<<< Back To Readme](../../../../README.md)
<p align="center">
    <img src="https://github.com/T4D-Suites/T4D-Ressources/blob/master/LogoT4D.png">
</p>

# Intro

Every Jenkins server compatible with T4D is managed by a repository prefixed with `ConfigT4J` and piloted by [Tools4Jenkins](https://github.com/iFeelSmart/Tools4Jenkins) repository. 

Composite model will present you how to manage params in your jenkinsfile.s and how powerful it can be

# Dependencies

We assume that you already have T4D paradigm on your repository AND you already have jenkinsfiles configured as singleton project


## Jenkinsfiles - Composite

If you start to have multi device, multiple backend, multiple client and/or add params to your build, you might want to use "composite" model that will increase complexity but also manage to do more and more things to grow with your project. Note that you can completely start with singleton model and move step by step to a fully composite model.

Here is an example :

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
M_BuildTarget=["Init"]
M_BuildTargetPreDelivery=["Init"]
//////////////////
env.M_Project = "Main"
env.M_RepositoryUrl="github.com/iFeelSmart/T4D-Sample-CMake.git"
env.M_NotificationLvl=1
env.M_ExtraArguments=""
//M_NotificationLvl0->Only Notif when build is failing
//M_NotificationLvl1->Notif only when build is finished
//M_NotificationLvl2->Notif Start + Build finished
//M_NotificationLvl3->LVL2 + Warning
//M_NotificationLvl4->Jenkins Log Lvl

properties([
    parameters([
        string(defaultValue: " ",         description: "" ,                name: "ExtraArguments"),
        booleanParam(defaultValue: false, description: "Build Parameters", name: "-"),
        booleanParam(defaultValue: true , description: "",                 name: "MBP_Configure"),
        booleanParam(defaultValue: true , description: "",                 name: "MBP_PreBuild1"),
        booleanParam(defaultValue: true , description: "",                 name: "MBP_PreBuild2"),
        booleanParam(defaultValue: true , description: "",                 name: "MBP_Build"),
        booleanParam(defaultValue: true , description: "",                 name: "MBP_PostBuild1"),
        booleanParam(defaultValue: true , description: "",                 name: "MBP_Test"),
        booleanParam(defaultValue: true , description: "",                 name: "MBP_Deploy"),
        booleanParam(defaultValue: true , description: "",                 name: "MBP_Archive"),
        booleanParam(defaultValue: false, description: "Build Options",    name: "-"),
        booleanParam(defaultValue: false, description: "",                 name: "MBO_Options1"),
        booleanParam(defaultValue: false, description: "ClientA",          name: "-"),
        booleanParam(defaultValue: true , description: "",                 name: "ClientA-Scheme1"),
        booleanParam(defaultValue: true , description: "",                 name: "ClientA-Scheme2"),
        booleanParam(defaultValue: true , description: "",                 name: "ClientA-Scheme3"),
        string(defaultValue: "ci-dev"   , description: "",                 name: "IrcChannel", trim: true)
    ])
])

env.M_IrcChannel="${params.IrcChannel}"
env.M_ExtraArguments="${params.ExtraArguments.replaceAll("null","")} ${job.convertBooleanAsBuildOption()}"

M_BuildTargetConfigure=job.convertBooleanAsTargets(params)
M_BuildTargetPreBuild1=job.convertBooleanAsTargets(params,include="ProjectA+ProjectB+ProjectC+ProjectD")
M_BuildTargetPreBuild2=job.convertBooleanAsTargets(params,include="ProjectB+ProjectD+ProjectE+ProjectF")
M_BuildTargetBuild=job.convertBooleanAsTargets(params,include="Targets")
M_BuildTargetPostBuild1=job.convertBooleanAsTargets(params,include="ProjectC+ProjectE+ProjectF+TargetZ")
M_BuildTargetTest=job.convertBooleanAsTargets(params,include="Targets")
M_BuildTargetDeploy=job.convertBooleanAsTargets(params,include="ProjectA+ProjectB+ProjectC+ProjectD")
M_BuildTargetArchive=job.convertBooleanAsTargets(params,include="Targets")


job.start()
pipeline.workspace(M_BuildTargetConfigure, "Clone", "start")

if ( "${params.MBP_PreBuild1}" == "true" ){             pipeline.exec(M_BuildTargetPreBuild1,   "prebuild-1",   "false"); }
if ( "${params.MBP_PreBuild2}" == "true" ){             pipeline.exec(M_BuildTargetPreBuild2,   "prebuild-2",   "false"); }
if ( "${params.MBP_Build}" == "true" ){                 pipeline.exec(M_BuildTargetBuild,       "build",        "false"); }
if ( "${params.MBP_PostBuild1}" == "true" ){            pipeline.exec(M_BuildTargetPostBuild1,  "postbuild-1",  "false"); }
if ( "${params.MBP_Test}" == "true" ){                  pipeline.exec(M_BuildTargetTest,        "test",         "false"); }
if ( "${params.MBP_Deploy}" == "true" ){                pipeline.exec(M_BuildTargetDeploy,      "deploy",       "false"); }
if ( "${params.MBP_Archive}" == "true" ){               pipeline.exec(M_BuildTargetArchive,     "archive",      "false"); }

pipeline.workspace(M_BuildTargetConfigure, "End", "end")
```

<p>
    <img src="https://github.com/T4D-Suites/T4D-Ressources/blob/master/screenshot-hardcore-sequential.png">
</p>
