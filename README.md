# Bene Installation Runner

Bene Runner is a raspberry pi application. When the raspberry pi boots into desktop mode, Bene Runner can either play a video file fullscreen in a loop or load a local html file (webapp) in fullscreen mode. The file loaded is determined by a Pidee board. This allows for multiple video and html files to be stored on on raspberry pi sd card image. This same image can then be deployed to multiple unique installations.

## Instructions

To run: `./script-run-bene-installation`

## Pidee Setup

To play a __video__ set dip __switch 8 to `ON`__.  
To load a __fullscreen webapp__ set the dip __switch 8 to `OFF`__.

Videos load from the `./videos` folder. Webapps load from the `./html` folder.

The script will load `$-filename` where `$` is equal to the binary number set in dip switches 1 to 7.

## Examples

To load a videofile in `./videos/1-test-movie.mp4` the dip switch:

|1|2|3|4|5|6|7|8|
|---|---|---|---|---|---|---|---|
|ON|OFF|OFF|OFF|OFF|OFF|OFF|ON|

To load a webapp in `./html/1-something.mp4` the dip switch:

|1|2|3|4|5|6|7|8|
|---|---|---|---|---|---|---|---|
|ON|OFF|OFF|OFF|OFF|OFF|OFF|OFF|

## Bene Exhbitions Settings

#### 2. Inventor Computer

|1|2|3|4|5|6|7|8|
|---|---|---|---|---|---|---|---|
|OFF|ON|OFF|OFF|OFF|OFF|OFF|OFF|

#### 3. Inventor Video

|1|2|3|4|5|6|7|8|
|---|---|---|---|---|---|---|---|
|ON|ON|OFF|OFF|OFF|OFF|OFF|ON|

#### 4. Glitch

|1|2|3|4|5|6|7|8|
|---|---|---|---|---|---|---|---|
|OFF|OFF|ON|OFF|OFF|OFF|OFF|ON|

#### 5. Presentation Loop

|1|2|3|4|5|6|7|8|
|---|---|---|---|---|---|---|---|
|ON|OFF|ON|OFF|OFF|OFF|OFF|ON|

#### 6. Boardroom Grid Display

|1|2|3|4|5|6|7|8|
|---|---|---|---|---|---|---|---|
|OFF|ON|ON|OFF|OFF|OFF|OFF|ON|

#### 7. PR Team 1

|1|2|3|4|5|6|7|8|
|---|---|---|---|---|---|---|---|
|ON|ON|ON|OFF|OFF|OFF|OFF|OFF|

#### 8. PR Team 2

|1|2|3|4|5|6|7|8|
|---|---|---|---|---|---|---|---|
|OFF|OFF|OFF|ON|OFF|OFF|OFF|OFF|


## Raspberry Pi Boot on LXDE load

`nano ~/.config/lxsession/LXDE-pi/autostart` 

then add

`@lxterminal -e ` + the path to the startup script

