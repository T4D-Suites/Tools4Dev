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
- **feature**    bb8 - add gitlab support
- _improvements_ jks - new options init and update-lib
- **chore**     remove git-lfs from deps
- **chore**     _t4dCheckOSXApp - check for OSX app installed
- **chore**     _t4dCheckPackage - Check for package installed on fedora only
- documentation  _t4dPrompt - Update old documentation
- **chore**     _t4dSrcPromptDemo - return an output to show user what can be done with prompt functions
- **bugfix**     index is now sorted properly in fedora & osx
- **chore**     modules folder will now be ignored by default
- **chore**     add Dockerfile
- _improvements_ t4d make will now generated doc and autocomp of all external modules
- **feature**    chm - new function to generate new module
- **chore**     _t4dCheckVariable - check if variable is not empty
- **chore**     _t4dMakeGeneratorExample - generate yaml example from templates
- _improvements_ autocompletion for modules is now loaded automatically
- _improvements_ t4d script autocompletion now available
- _improvements_ chp - add a way to define vars in _variable_ file
- _improvements_ bb8 - add log to know if bb8 is not found
- _clean_        _t4dFindDataInXmlV2 - replaced by _t4dManifestXmlGetData
- _clean_        _t4dFindMarkerInXML - replaced by _t4dManifestXmlGetMarker
- _clean_        _t4dFindXml.. - replaced by _t4dManifestXml..
- _improvements_ gik - add T4D_MANIFEST_PROJECTS to be able to gik only a sub-set of repository
- **bugfix**     _t4dPromptVarWithSpace - fixed depending on platform
- **bugfix**     jks - buildWithParams fixed on jenkins 2.321
- **bugfix**     jks - buildWithParams fixed on jenkins 2.3+
- _improvements_ osx - add /opt/homebrew/bin to path automatically
- **bugfix**     INSTALL - fix zshrc setup + manifest on install
- **chore**     _t4dSrcAnsibleInventory - manage Ansible Inventory
- **chore**     Yaml - add support of yaml file management
- _improvements_ wkd - add team argument that will cd to T4D_TEAM_ROOT folder
- **chore**     _t4dJsonSetData - edit data from json
- **chore**     _t4dPlistSetStringValue - edit key in plist file
- **chore**     t4d.properties - handle properties file management
- **chore**     _t4dSystemGetOsArch - return OS arch
- **chore**     _t4dSrcVersionPatchGradleFile - patch gradle file to replace versionName value
- **chore**     WIP - _t4dSrcGitGenerateManifestConfig
- **chore**     _t4dSrcGitInfoLastTag - use git describe to retreive last tag information from log
- **bugfix**     oh-my-zsh - Avoid loading git-completions as it might broke zsh plugins
- _improvements_ jks startWithParams - handle choice properties
- **chore**     WIP - _t4dSrcYamlEdit
- _improvements_ T4D_NOTIFICATION - disable t4dCheckForUpdate if set to false
- **feature**    t4d - new options docker + clone


## 6.1.0
