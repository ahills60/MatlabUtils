# MatlabUtils
MatlabUtils provides useful scripts for MATLAB including high quality video output using [FFmpeg](http://www.ffmpeg.org/).

## Libraries
MatlabUtils comes with various independent MATLAB scripts and functions. These are currently partitioned into separate directories.

### Conversions
Currently, there is only one conversion script within the Conversions folder.

#### latexit
The function `latexit` converts the given variable and returns the LaTeX representation of that object. The LaTeX script is also copied into the clipboard for pasting elsewhere.

#### writecsv
The function `writecsv` writes a cell object to a given filename. The expected usage is `writecsv(FILENAME, INPUT_VARIABLE)`. If the given input variable is not a cell object, the function calls MATLAB's `csvwrite` function.

### Utilities
Currently, there is a group of scripts that create high resolution video.

#### MP4Video
The MP4Video group consists of the following files:

* `MP4Video.m` is the main class file that constructs an object for video construction.
* `takeframe.m` is a script that captures a frame and exports the file as a high resolution image file. Images are saved in a temporary location.
* `makeMP4.m` constructs a video file using FFmpeg and can be called once all frames are captured.
* `cleanMP4.m` deletes the images stored in the temporary location. If the files are not deleted, MATLAB should remove them on exit.
* `MP4Demo.m` consists of a simple demonstration on how the above files can be used to create a video.

MP4Video requires FFmpeg to be present and available from the system's path. If the command ``!ffmpeg -version`` is not recognised by MATLAB, then either FFmpeg is not installed or it hasn't been added to the system path. Installation instructions are provided below.

To use MP4Video, the following commands creates a new video called `filename.avi` that uses 15 fps and an image resolution of 600 dpi:

```matlab
myMov = MP4Video('filename.avi', 15, 600);
fig = figure;
for i = 1:10
    % Plot something
    myMov = takeframe(myMov, fig); % Capture the current frame
end
close(fig);
makeMP4(myMov);
cleanMP4(myMov);
```

If the figure handle is not specified then `takeframe` will get the current figure handle (`gcf`).

##### Installing FFmpeg
FFmpeg is freely available from the [FFmpeg website](http://www.ffmpeg.org/download.html). Using default install paths on Linux and Mac platforms should make FFmpeg available on the system path.

Windows users can install FFmpeg using the [Zeranoe FFmpeg builds](http://ffmpeg.zeranoe.com/builds/). I recommend using the static release. For instructions on how to add FFmpeg to the system path, instructions are available on [wikiHow](http://www.wikihow.com/Install-FFmpeg-on-Windows).

*Note: MATLAB should be restarted if it was open when the system path was updated.*