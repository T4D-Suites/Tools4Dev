[<-- Back To Readme](README.md)
<p align="center">
    <img src="https://image.ibb.co/mfkNxG/Screen_Shot_2018_01_02_at_10_55_58.png">
</p>

**Changelog File**


## 5.0.0
- **feature**    First Open source release


## 5.0.1
- **bugfix**     wks clone error during first install
- **bugfix**     jks startWithParams was parsing commented bloc


## 5.1.0
- **feature**    Bb8 duplicate pull request to target another branch with cherry-picking strategy
- **core**       add _t4dPromptChart to manage table output WikiJS compatible

## 5.2.0
- _improvements_ gik - diff file is no longer mandatory in commit statement, it file does not exist it will not be generated unless -diff-file was sent
- _improvements_ gik commit - add normalized option to follow git commit convention
- documentation  MacOS - update manual installation process documentation
- **chore**     Add _t4dPromptChart that generated markdown compatible chart
- _improvements_ bb8 - api is now able to fetch default reviewers from bitbucket to add them on new pull requests
- **chore**     wikijs - integration that allow user to push & edit documentation using graphQl integration
- **chore**     testflight - UploadOnTestflight is now able to force upload even if ipa path file was not properly sent. Works only if there is only one ipa file in given folder- **bugfix**     wks clone - was returning error even if repo was manually cloned
- **chore**     kubernetes - add kubernetes get functions
- **feature**    t4d - Tools4Dev_PATH/bin can now be added to path. It will allow user not loading natively t4d to use it as external binary script
- **feature**    t4d uninstall available


## 5.3.0
- **feature**    bb8 - propagate hs now --keep-branch option to avoid overriding branch form master PR
- **feature**    bb8 - finish can now automatically add default reviewers to any PR
- **chore**     gik - push allow now --no-verify option to avoid hooks if needed
- **chore**     gik - create _t4dModGikUtilsSwitchToBranch
- **chore**     android - improve check permission folder
- **chore**     ios - POC apple-store api - backend still in dev at the moment
- **chore**     cmake t4d - create cmake t4d integration that will use cmake opensource lib
- **bugfix**     xml - manifest files with value using type name was not parsed correclty
- **chore**     t4d - new install zshrc content to allow t4d to be used as external command


## 5.3.1
- **bugfix**     fix wks clone http


## 5.3.2
- documentation  add userStories on how to create a new project and use jenkins as CI structure support
- _improvements_ install can now receive extra args for git clone
- _improvements_ add Deprecated folder to store all deprecated stuff in order to have a better tracability between version
- _improvements_ python3 is now the default bin used to convert json output
- _improvements_ chl allow user to generate shell code structure without mandatory args
- **bugfix**     jks - startWithParams was failing if your jenkinsFile has only 1 param available
- _improvements_ wks - clone allow https with no credentials
- **bugfix**     chore - _t4dSystemGetDiffSha7 was returning duplicate content if folder name was too similar to another one
- _improvements_ git - improving git functions to be compatible with gitlab folder's structure


## 5.4.0
- **feature**    bb8 - add gitlab support
- _improvements_ jic - improve how jira password is set

## 6.0.0