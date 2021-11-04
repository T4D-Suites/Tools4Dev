[<<< Back To Readme](../../../../README.md)
<p align="center">
    <img src="https://github.com/T4D-Suites/T4D-Ressources/blob/master/LogoJKS.png">
</p>


## Name
<p>jks</p>


## Synopsis
<p>Jenkins API Command Line Tools</p>


## Definition
<p>

Modules that allow user to interract with Jenkins as a Command Line Tools.
It will parse html Jenkins output into readable content from your terminal.

* Explore Jenkins Projects as if you were on his web interface with get option.
_Please see jks help get for more informations._

* Launch Build on jenkins with a simple command __jks start__ .
Depending on your project will start a new build of your current workspace/branch

* Get Last Build on jenkins using current workspace/branch with jks last

* IMPORTANT : This command use JENKINS_USER_AND_PASSWORD variable.
To define it you have to go to $JENKINS_WEB_URL
1. log in with your google account
2. Click on the top right corner __YourName__ then Configure
3. Add Token or show legacy token
4. copy and paste its content into $Tools4Dev_PATH/.$USER.env using following syntax
JENKINS_USER_AND_PASSWORD="{GoogleEmailAddress}:{YourToken}"

* Some project can also send build notification to personnal slack channel.
To define it you will have to create your personnal token:
1. Go on __https://$WS_SLACK_ADDRESS/apps/A0F7VRFKN-jenkins-ci?next_id=0__
2. Click on Add Configuration (if you do not have all rights you will have to request access)
3. Choose a channel (privately to you)
4. copy and paste Integration Token value into $Tools4Dev_PATH/.$USER.env using following syntax
__WS_CUSTOM_CHANNEL_NOTIFICATION="{YourToken}"__ .
</p>


## Usage

* `jks <option>  **arguments**`

Will execute jks command with all arguments


* `jks help <option>      `

Show specific option's documentation


## Options
- **get**
    - _Get and Parse Jenkins WebUI threw shell_
- **start**
    - _Start Jenkins Build_
- **startWithParams**
    - _Jenkins params utilities to get params default values and generate jks command_
        >        * -Param|-P  <NAME>  *Value*       = Replace <NAME> value with *Value*
        >        * -clean                           = Disable All Boolean
        >        * -Filter|-F <FILTER> <Value>      = Search for item beguinning with <FILTER> then appl new value on all of them
        >        * -force|-f                        = Launch Build with current config
        >        * -slack                           = Replace SlackChannel with content of $WS_CUSTOM_CHANNEL_NOTIFICATION
        >        * -pipeline                        = Override default project pipeline
        >           
        >  
- **last**
    - _Get last Build Page depending on your current workspace and branchName_
- **stop**
    - _Try to stop last build depending on your current workspace and branchName_
- **restart**
    - _Try to Stop last build then start a new one_
- **monitor**
    - _Get Html page from specifique Project, BranchName and BuilderNumber in Jenkins_
- **init**
    - _allow user to create jenkinsfile dynamically_
        >        * -suffix               = add suffix to output file
- **help**
    - _Show Project Documentation_
- **edit**
    - _Read '_Jenkins_/_Main_' and open vi to allow user to customize buildCommand_
- **sync**
    - _Force jenkins new branch discovery process_

## Example
<p>

* jks last                       

>  Get last build of current Project & Branch


* jks get                        

>  Get Jenkins Main Page and list available projects


* jks get Feature                

>  Get Jenkins Feature main page and list available branches


* jks get Prod master            

>  Get Jenkins branch master of SmartUI-Prod project and list available builds


* jks get Prod master 1          

>  Get Jenkins Build Status


* jks get Prod master last       

>  Get Jenkins Last Build Status


* jks get Prod master last All   

>  Download all avaiable artefacts


</p>

