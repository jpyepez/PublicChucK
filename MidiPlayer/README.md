# ChucK MidiPlayer

This script uses the method MidiFileIn::read() to get data and play from MIDI files in ChucK.

## Running the Default Example

You can run the script from miniAudicle or from the command line, and ChucK will play the default file:

``` 
$ chuck midiPlayer.ck
```

##  Reading MIDI Files

To read another file, simply add it to the arguments at the top of miniAudicle or using the command line:

```
$ chuck midiPlayer.ck:argumentFile.mid
```

If no argument is passed, or if the arguments are invalid, ChucK should play the default file. If you have any issues, you can simply replace the value of the "default" variable with the name of the file you want to read.

---

*Note: This was a quick project I put together a while ago, so it has not been tested a lot. I don't think the documentation really covers this (as far as I know), so I'm not familiar with all the details about MidiFileIn being used this way. This should be a good starting point if you are interested in working with ChucK and MIDI files.*
