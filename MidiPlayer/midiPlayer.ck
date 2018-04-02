// midiplayer.ck 
// JP Yepez
// Aug 2017

MidiFileIn min;
MidiMsg msg;
MidiMsg prev;

// Filename
// Open file from given arguments; use default if no args are provided.
// ChucK command line args:
//  $ chuck foo.ck:foo
//  $ chuck foo.ck:foo:bar

string filename;
"getback.mid" => string default;

if(me.args() == 0)
    me.sourceDir() + default => filename;
else
    me.dir() + me.arg(0) => filename;

// Open MIDI file
if(!min.open(filename)) {
    cherr <= "unable to open MIDI file: '" <= filename <= "'\n";
    me.exit();
}

chout <= filename <= ": " <= min.numTracks() <= " tracks\n";

// Global variables
0 => int bass_track;
int done;

// play
spork ~ playMan();

// main loop
while(!done){
    second => now;
}

// Print and signal end of MIDI file
chout <= "\n\tDone!!!\n" <= IO.nl();
min.close();


// Play bass track
fun void playMan() {
    Mandolin s => dac;
    
    // read from file
    while(min.read(msg, bass_track)) {
        if(msg.when > 0::second)
            msg.when => now;

        if(msg.data1 == 0x90 && msg.data2 > 0 && msg.data3 > 0) {

            msg.data2 => Std.mtof => s.freq;
            msg.data3/127.0 => s.noteOn;
        }
    }
    
    done++;
}
