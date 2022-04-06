[<<< Back To Readme](../../../../README.md)
<p align="center">
    <img src="https://github.com/T4D-Suites/T4D-Ressources/blob/master/LogoT4D.png">
</p>

# _t4dPromptLine

## Synopsis
<p>Will read your term Length create a line with =</p>


## Usage

* `{Name} <option>  **arguments**        = {One-Line Description}`


## Example
<p>

* {Example1}              

>  {One-Line Description}


</p>



# _t4dPromptLineChar

## Synopsis
<p>Will read your term Length create a line with char send in $1</p>


## Usage

* `_t4dPromptLineChar <char> **color**        = fill line with char and colorize it`


## Example
<p>

* {Example1}              

>  {One-Line Description}


</p>



# _t4dPromptEndOfLine

## Synopsis
<p>Will write $1 at the end of line of your term</p>


## Usage

* `_t4dPromptEndOfLine <string> **colorCode** **remove n char**`

Usage:


* `_t4dPromptEndOfLine toto`


* `_t4dPromptEndOfLine toto $plblue`


* `_t4dPromptEndOfLine toto $plblue 20`

- Note:

<Required>


* `**Optionnal**`

{XXXXXXX}       = Value To Be Changed, if {URL} then replace {URL} with a valid URL


## Usage

* `_t4dPromptEndOfLine <string> **colorCode** **remove n char**`

Usage:


* `_t4dPromptEndOfLine toto`


* `_t4dPromptEndOfLine toto $plblue`


* `_t4dPromptEndOfLine toto $plblue 20`

- Note:

<Required>


* `**Optionnal**`

{XXXXXXX}       = Value To Be Changed, if {URL} then replace {URL} with a valid URL



# _t4dPromptIndent

## Synopsis
<p>|One-line description of what it does. (less than 55 char)|</p>


## Definition
<p>

Documentation Unavailable
</p>


## Usage
_t4dPromptIndent <NumberOfIndent> <Content>


## Example
<p>

</p>



# _t4dPromptCentralLine

## Synopsis
<p>Will read your term Length create a line with char send in $1</p>


## Usage

* `_t4dPromptCentralLine **color**        = create central line with color`


## Example
<p>

* _t4dPromptCentralLine                      

>  Default behavior


* _t4dPromptCentralLine $plblue              

>  Central line in blue


* _t4dPromptCentralLine $plblue  toto        

>  Central line in blue with toto at end


</p>



# _t4dPromptSize

## Synopsis
<p>Get Terminal number of columns</p>


## Definition
<p>

Return Terminal number of columns, if variable COLUMNS does not exist, will return 100
you can divide this result with arg1
</p>


## Usage
_t4dPromptSize <Arg>


## Options

## Example
<p>

</p>



# _t4dPromptListInfo

## Synopsis
<p>Show a list of Variable name and contents</p>


## Definition
<p>

Linked to _t4dPromptInfo
</p>


## Usage
_t4dPromptListInfo "<List of Variable Names>" 17 ":" $plyellow


## Options

## Example
<p>

</p>



# _t4dPromptVarCenterWithChar

## Synopsis
<p>Fill variable with char to create a fixed lenght variable with value at center</p>


## Example
<p>

</p>



# _t4dPromptEchoTimer

## Synopsis
<p>Echo Timer that decrease his value until 1 + sleeping 1 seconds</p>


## Example
<p>

</p>



# _t4dPromptSquare

## Synopsis
<p>Generate pretty square with your string in it (and by string i mean variable)</p>


## Definition
<p>

Can be used anywhere in your code in order to generated a pretty console output
+-+-+-+-+-+-+
+ taratata  +
+-+-+-+-+-+-+
</p>


## Usage
_t4dPromptSquare **Options** <Args>


## Available Options
--no-color          = Remove all color code from output, used to write data in file


## Example
<p>

</p>



# _t4dPromptHyperLink

## Synopsis
<p>Show OutPut Line as HyperLink</p>


## Usage
_t4dPromptHyperLink <Link> <Name>



# _t4dPromptFixedCol

## Synopsis
<p>|One-line description of what it does. (less than 55 char)|</p>


## Example
<p>

</p>



# _t4dPromptTable

## Synopsis
<p>|One-line description of what it does. (less than 55 char)|</p>


## Example
<p>

</p>



# _t4dPromptChart

## Synopsis
<p>utils that will return a preformated table</p>


## Usage
_t4dPromptChart -head  "   A1   |      B1      "

_t4dPromptChart -data  "   A2   |      B2      "


## Example
<p>

</p>



# _t4dSrcPromptDemo

## Synopsis
<p>return an output to show user what can be done with prompt functions</p>


## Usage

* `_t4dSrcPromptDemo        = See output example for _t4dPrompt Lib`



