# solfa - Sol-Fa Language

_An experiment with a music programming language that will interface with VST instruments_

## System overview
* A simple text editor / lite-IDE to edit
* The solfa language (Parser and Interpreter)
* An interface that maps musical operations to a set of MIDI commands send to the Element VST Host
* This expects the use of the Element VST Host for hosting the VST instruments that solfa will control.


## Influences
* Alda programming language (https://github.com/alda-lang/alda)
* Clojure language
* (Flutter text editor in < 1000 lines of code)
* overtone - original music programming and system for live-coding music based on Clojure and the Supercollider 
synthesis engine.


             
## TO-DOs
* on a newline, start next line at the appropriately indented position
* when using tab to adjust the position to proper formatting, move cursor to the new location for same spot after
  adjusting format.  Cursor should shift with the line
* when using tab to adjust position of empty line, it should move cursor to the appropriate position for start of
  of the new line
* When adding lines to the document that go beyond the bottom of the screen it should auto-scroll
