# Pidee Exhibition Runner

Pidee Exhibition Runner is a script for booting a [Raspberry Pi](https://www.raspberrypi.org/) into either: 

- a fullscreen looping video
- chrome-less web app.

The video or html file is selected by the Pidee board. 

![](http://cms.theworkers.net/image/resize-width-micro-0/images/_c170010-2-5773e5f37fc9a.jpg)

This allows multiple videos and web apps to be on the same SD card, useful is you are doing an exhibition with lots of exhibits.

## Instructions

To run: `./script-exhibition-runner.sh`

## Pidee Setup

To play a __video__ set dip __switch 8 to `ON`__.  

To load a __fullscreen webapp__ set the dip __switch 8 to `OFF`__.

Videos load from the `./videos` folder. Webapps load from the `./html` folder.

The script will load `$-filename` where `$` is equal to the binary number set in dip switches 1 to 7.

## Examples

To load a videofile in `./videos/1-test-movie.mp4` the dip switch:

|1|2|3|4|5|6|7|__8__|
|---|---|---|---|---|---|---|---|
|ON|OFF|OFF|OFF|OFF|OFF|OFF|__ON__|

To load a webapp in `./html/1-something.mp4` the dip switch:

|1|2|3|4|5|6|7|__8__|
|---|---|---|---|---|---|---|---|
|ON|OFF|OFF|OFF|OFF|OFF|OFF|__OFF__|

# Case Study: Kavital for Bene's Exhibitions Settings

During London's Clerkenwell Design Week, [The Workers](http://theworkers.net/)' staged a [fictitious company called Kavital Ltd.](http://theworkers.net/kavital), in the showrooms of [Bene](http://bene.com/). In this experience, there were fake computer displays powered by Raspberry Pi using the Pidee Exhibition Runner. 

The configuration is below.


#### 2. Inventor Computer

![](http://cms.theworkers.net/image/resize-width-micro-0/images/_dsc9817-577507bc1a5f3.jpg)

|1|2|3|4|5|6|7|8|
|---|---|---|---|---|---|---|---|
|OFF|__ON__|OFF|OFF|OFF|OFF|OFF|OFF|

#### 3. Inventor Video

|1|2|3|4|5|6|7|8|
|---|---|---|---|---|---|---|---|
|__ON__|__ON__|OFF|OFF|OFF|OFF|OFF|__ON__|

#### 4. Glitch

![](http://cms.theworkers.net/image/resize-width-micro-0/images/_dsc9829-577507e06b65e.jpg)

|1|2|3|4|5|6|7|8|
|---|---|---|---|---|---|---|---|
|OFF|OFF|__ON__|OFF|OFF|OFF|OFF|__ON__|

#### 5. Presentation Loop

![](http://cms.theworkers.net/image/resize-width-micro-0/images/_dsc9812-57750929986cb.jpg)

|1|2|3|4|5|6|7|8|
|---|---|---|---|---|---|---|---|
|__ON__|OFF|__ON__|OFF|OFF|OFF|OFF|__ON__|

#### 6. Boardroom Grid Display

![](http://cms.theworkers.net/image/resize-width-micro-0/images/p5230159-577509ddd8d34.jpg)


|1|2|3|4|5|6|7|8|
|---|---|---|---|---|---|---|---|
|OFF|__ON__|__ON__|OFF|OFF|OFF|OFF|__ON__|

#### 7. PR Team 1

|1|2|3|4|5|6|7|8|
|---|---|---|---|---|---|---|---|
|__ON__|__ON__|__ON__|OFF|OFF|OFF|OFF|OFF|

#### 8. PR Team 2

|1|2|3|4|5|6|7|8|
|---|---|---|---|---|---|---|---|
|OFF|OFF|OFF|__ON__|OFF|OFF|OFF|OFF|


## Raspberry Pi Boot on LXDE load

`nano ~/.config/lxsession/LXDE-pi/autostart` 

then add

`@lxterminal -e ` + the path to the startup script

