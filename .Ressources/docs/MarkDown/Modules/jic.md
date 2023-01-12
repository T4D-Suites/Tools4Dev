[<<< Back To Readme](../../../../README.md)
<p align="center">
    <img src="https://github.com/T4D-Suites/T4D-Ressources/blob/master/LogoJIC.png">
</p>


## Name
<p>jic</p>


## Synopsis
<p>Jira In Console</p>


## Definition
<p>

Interact with Jira from command line and avoid webpages
</p>


## Usage

* `jic <option> **arguments**`

Will execute jic command with all arguments


* `jic help <option>`

Show specific option's documentation


## Options
- **pp**
    - _Display tickets to do for current user_
        >        * -sprint   = only tickets from current sprint for user
        >        * -all      = tickets from all projects for user
- **sprint**
    - _Query Jira for active sprint tickets and display them_
        >        * -project  = define project to search into
        >        * -user     = limit search to tickets assigned to user
- **search**
    - _Display tickets resulting from given query_
- **info**
    - _Display full ticket info_
- **release**
    - _Return tickets related to given Jira release_
        >        * -project          = define project to search into
        >        * -fixVersion       = define the fixVersion to search
        >        * -done             = display resolved tickets only
        >        * -o  *md|data|sh*  = force output to given style (default shell)
- **comment**
    - _Display comments of given ticket_
- **create**
    - _description_
- **help**
    - _Show Project Documentation_

## Example
<p>

* jic pp 

>  Display personal tickets


</p>

