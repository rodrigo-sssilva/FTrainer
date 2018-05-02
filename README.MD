## FTrainer
Cheat Engine Trainer with tools for Freedom Planet speedrunning practice and TAS tools. I hope it's useful.
Supports version 1.21.5, and all characters.

Download link: https://puu.sh/AeTtN/261098886b.zip

#### Version 3.4, released at 02/05/2018

- Added tools for gameplay recording. The game will load the selected warp and record your inputs into a file that can be played back later.
It supports both game inputs and tool inputs, and pause/frame advance are supported.
- Added a fastforward feature to playbacks. The game will skip drawing and play as fast as possible until it's paused or the playback ends.
You can toggle it by adding "fastforward" to the playback settings.
- Pause at frame x is now "Fast Forward to x", which means fastforward will be automatically enabled when the checkbox is marked.
- The trainer only supports version 1.21.5 from now on.
- RNG seed from playbacks is now applied one frame after the playback transition, instead of at the same time.
This means rng updates before transition won't affect the playback anymore.
- Added to the Improved Movement mod a Multiplier to Lilac cyclone's gravity reduction.
- Fixed a bug on the Improved Movement mod where new warps would lock the horizontal speed cap to 0.
- Fixed a bug where the igt change would not be applied when the game was attached from the title screen.
