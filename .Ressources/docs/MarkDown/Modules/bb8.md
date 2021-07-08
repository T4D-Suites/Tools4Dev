[<<< Back To Readme](../../../../README.md)
<p align="center">
    <img src="https://github.com/T4D-Suites/T4D-Ressources/blob/master/LogoBB8.png">
</p>


## Name
<p>bb8</p>


## Synopsis
<p>BitBucket API Command Line Tools</p>


## Definition
<p>

BitBucket API Command Line Tools

* Create a global PullRequest

Return green URL if PR was creating, Yellow if already exists

* Finish

Create Global PullRequest,
It will list all PR linked to your workspace then add their URL links to the description.
DON'T USE THIS COMMAND unless you really want QA to review your work.
__That means your work on any tickets is DONE__ .

* OSX

You can use your Keychain in order to store your password.
__vi $Tools4Dev_PATH/.${USER}.env__ add line __BITBUCKET_USERNAME={BitBucketUser}__ .
Go to your keychain then add a password with account named __BitBucketPassword__ .
Take care of removing all old BITBUCKET_USER_AND_PASSWORD reference in $WS_ROOT/.${USER}.env
Bb8 will now ask for your keychain password any time he wants to access your password.
remember that such a security lvl will broke some silent functions that will need your
password to access keychain

* Token
With recent bitbucket version you may replace bitbucket password by a token it will work as well
</p>


## Usage

* `bb8 <option>  **arguments**`

Will execute bb8 command with all arguments


* `bb8 help **option**`

Show Option documentation


## Options
- **list**
    - _List Pull Request from current logged user_
        >        -s <arg>     = Override State       OPEN     || DECLINED     || MERGED
        >        -r <arg>     = Override Role        AUTHOR   || PARTICIPANT  || REVIEWER
        >        -p <arg>     = Override Status      APPROVED || UNAPPROVED   || NEEDS_WORK
        >        -o <arg>     = Override Order       NEWEST   || OLDEST
        >        -l <arg>     = Override Limit       Default 25    min-max 1-200
        > 
        >        -f <arg>     = Filtre list output
        >        -offline     = offline mode
        >        -json        = use a specific jsonFile instead of default (used by bb8 find)
- **repo**
    - _List all pull request from a specific repository_
        >        -branch | -b    = Set "At" argument to list only pull Requests from a specific branch
        >        -repo           = Set Repository
        >        -key            = Set Project Key
        >        -order          = Override Order       NEWEST   ||   OLDEST
        >        -limit          = Override Limit       Default 25    min-max 1-200
        >        -state          = Override State       OPEN     ||   DECLINED     || MERGED
        >        -tag <arg>      = Add Filter in Name, skipped all that is not containing Filter
- **get**
    - _Will Call BitBucket API in order to get many information about any PullRequest_
- **branch**
    - _|One-line description of what it does. (less than 55 char)|_
- **merge**
    - _Merge a pull request to its destination_
- **global-merge**
    - _Show you a global MultiPR Status then ask you to allow global merge or not._
- **edit**
    - _Edit an existing PullRequest Info_
        >        -f                      = force Update, remove safety check
        >        -done                   = Replace *WIP* with *READY TO REVIEW*
        >        -wip                    = Replace *READY TO REVIEW* with *WIP*
        >        -suffix                 = Add Suffix to PullRequest
        >        -title <Title>          = Override All Title
        >        -targetBranch <Name>    = Replace TargetBranch
        >        -tgt          <Name>    =      "        "
        >        -description            = Not Implemented Yet
        >        -reviewers              = Not Implemented Yet
- **decline**
    - _Documentation Unavailable_
- **find**
    - _Documentation Unavailable_
- **propagate**
    - _Forward Master Pr reviewers to all sub PRs_
        >        * -f                      = force update, never ask
        >        * -done                   = remove WIP or other temp PR status
        >        * -wip                    = Add WIP status
        >        * -keep-branch            = Do not update subPR branch
        >        * -add <Url>              = Add PullRequest to description
- **duplicate**
    - _Allow user to cherry-pick all commits from a pull request to another base branch_
        >        * -url <link>           = Get All information from specified PullRequest URL
        >        * -tgt <branch>         = Select new base branch, for example a release branch
        >        * -f                    = Apply Cherry-picking
        >        * -v                    = See if there is any cherry-picking error without applying modifications
- **start**
    - _Create Single Pull Request or Related PullRequest in a gik project_
        >        here        = Disable Multi Pull Request Creation and Create a pull request in current repository
- **finish**
    - _Create Global Pull Request AND Related pull request_
        >        -b | -branch <BranchName>        = force PullRequest target branches, 
- **help**
    - _Show Project Documentation_

## Example
<p>

* __bb8 start here -b master -done__          

>  Create PullRequest in a single repository targeting master


* __bb8 finish__                              

>  Create All SubPullRequest and Global PulLlRequest including all subPR link in description


* __bb8 list -s OPEN -r REVIEWER__            

>  List Opened PullRequest where user are already reviewer


* __bb8 propagate  -f__  <{URL}>              

>  Propagate Description in all SubPR without asking (To be used carefully)


</p>

