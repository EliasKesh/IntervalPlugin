//=============================================================================
//  MuseScore
//  Music Composition & Notation
//
//  Interval Plugin
//
//  Copyright (C) 2012 Werner Schweer
//  Copyright (C) 2013 - 2019 Joachim Schmitz
//  Copyright (C) 2014 Jörn Eichler
//  Copyright (C) 2021 Elias Kesh
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License version 2
//  as published by the Free Software Foundation and appearing in
//  the file LICENCE.GPL
//=============================================================================

import QtQuick 2.0
import MuseScore 3.0

MuseScore {
   version: "3.0"
   description: qsTr("This plugin names Intervals based on the Key")
   menuPath: "Plugins.Notes." + qsTr("Intervals") // this does not work, why?

   function nameChord (notes, text, KeySig) {
      for (var i = 0; i < notes.length; i++) {
         var myNoteVal;
         var myMajorRoot;
         var myInterval;
         var myIntervalVal;

         var sep = ","; // change to "\n" if you want them vertically
         if ( i > 0 )
            text.text = sep + text.text; // any but top note

         if (typeof notes[i].tpc === "undefined") // like for grace notes ?!?
            return

         // myNoteVal = 0;

         switch (notes[i].tpc) {
            case -1: 
               myNoteVal = 4;    
            break;
            case  0:
               myNoteVal = 11;    
            break;
            case  1: 
               myNoteVal = 6;    
            break;
            case  2:                
               myNoteVal = 1;    
            break;
            case  3:                
               myNoteVal = 8;    
            break;
            case  4:                
               myNoteVal = 3;    
            break;
            case  5:                
               myNoteVal = 10;    
            break;
            case  6:                
               myNoteVal = 5;    
            break;
            case  7:                
               myNoteVal = 12;    
            break;
            
            case  8:                
               myNoteVal = 7;    
            break;
            case  9:                
               myNoteVal = 2;    
            break;
            case  10:                
               myNoteVal = 9;    
            break;
            case  11:                
               myNoteVal = 4;    
            break;
            case  12:
               myNoteVal = 11;    
            break;
            case  13:
               myNoteVal = 6;    
            break;
            case  14:
               myNoteVal = 1;    
            break;
            case  15:
               myNoteVal = 8;    
            break;
            case  16:
               myNoteVal = 3;    
            break;
            case  17:
               myNoteVal = 10;    
            break;
            case  18:
               myNoteVal = 5;    
            break;
            case  19:
               myNoteVal = 12;    
            break;

            case  20:
               myNoteVal = 7;    
            break;
            case  21:
               myNoteVal = 2;    
            break;
            case  22:
               myNoteVal = 9;    
            break;
            case  23:
               myNoteVal = 4;    
            break;
            case  24:
               myNoteVal = 11;    
            break;
            case  25:
               myNoteVal = 6;    
            break;
            case  26:
               myNoteVal = 1;    
            break;
            case  27:
               myNoteVal = 8;    
            break;
            case  28:
               myNoteVal = 3;    
            break;
            case  29:
               myNoteVal = 10;    
            break;
            case  30:
               myNoteVal = 5;    
            break;
            case  31:
               myNoteVal = 12;    
            break;
            case  32:
               myNoteVal = 7;    
            break;
            case  33:
               myNoteVal = 2;    
            break;

            default: 
            myNoteVal = 0;    
            break;
         } // end switch tpc


         switch (KeySig) {
            case -7: 
               myMajorRoot = 12;    
            break;

            case -6: 
               myMajorRoot = 7;    
            break;

            case -5: 
               myMajorRoot = 2;    
            break;

            case -4: 
               myMajorRoot = 9;    
            break;

            case -3: 
               myMajorRoot = 4;    
            break;

            case -2: 
               myMajorRoot = 11;    
            break;

            case -1: 
               myMajorRoot = 6;    
            break;

            case 0: 
               myMajorRoot = 1;    
            break;

            case 1: 
               myMajorRoot = 8;    
            break;

            case 2: 
               myMajorRoot = 3;    
            break;

            case 3: 
               myMajorRoot = 10;    
            break;

            case 4: 
               myMajorRoot = 5;    
            break;

            case 5: 
               myMajorRoot = 12;    
            break;

            case 6: 
               myMajorRoot = 7;    
            break;

            case 7: 
               myMajorRoot = 2;    
            break;
            } // End of switch Key Signature

         if ( myMajorRoot > myNoteVal)
            myInterval = (myNoteVal + 12) - myMajorRoot;
         else
            myInterval = (myNoteVal) - myMajorRoot;

//         console.log('myNoteVal = ' + myNoteVal);
//         console.log('myInterval = ' + myInterval);

         // text.text = myInterval;

         switch (myInterval) {
            case 0: 
            myIntervalVal = "1"
            break;

            case 1: 
            myIntervalVal = "-2"
            break;

            case 2: 
            myIntervalVal =  "2"
            break;

            case 3: 
            myIntervalVal =  "-3"
            break;

            case 4: 
            myIntervalVal =  "3"
            break;

            case 5: 
            myIntervalVal =  "4"
            break;

            case 6: 
            myIntervalVal =  "o5"
            break;

            case 7: 
            myIntervalVal = "5"
            break;

            case 8: 
            myIntervalVal =  "-6"
            break;

            case 9: 
            myIntervalVal = "6"
            break;

            case 10: 
            myIntervalVal =  "-7"
            break;

            case 11: 
            myIntervalVal =  "7"
            break;

            case 12: 
            myIntervalVal =  "1"
            break;
            } // end of interval


            text.text = text.text + myIntervalVal;
      } // end for note
   }

   onRun: {
      if (typeof curScore === 'undefined')
         Qt.quit();

      var cursor = curScore.newCursor();
      var startStaff;
      var endStaff;
      var endTick;
      var fullScore = false;
      cursor.rewind(1);
      if (!cursor.segment) { // no selection
         fullScore = true;
         startStaff = 0; // start with 1st staff
         endStaff  = curScore.nstaves - 1; // and end with last
      } else {
         startStaff = cursor.staffIdx;
         cursor.rewind(2);
         if (cursor.tick === 0) {
            // this happens when the selection includes
            // the last measure of the score.
            // rewind(2) goes behind the last segment (where
            // there's none) and sets tick=0
            endTick = curScore.lastSegment.tick + 1;
         } else {
            endTick = cursor.tick;
         }
         endStaff = cursor.staffIdx;
      }
//      console.log(startStaff + " - " + endStaff + " - " + endTick)

      for (var staff = startStaff; staff <= endStaff; staff++) {
         for (var voice = 0; voice < 4; voice++) {
            cursor.rewind(1); // beginning of selection
            cursor.voice    = voice;
            cursor.staffIdx = staff;

            if (fullScore)  // no selection
               cursor.rewind(0); // beginning of score

            while (cursor.segment && (fullScore || cursor.tick < endTick)) {
               if (cursor.element && cursor.element.type === Element.CHORD) {
                  var text = newElement(Element.STAFF_TEXT);

                  var graceChords = cursor.element.graceNotes;
                  for (var i = 0; i < graceChords.length; i++) {
                     // iterate through all grace chords
                     var graceNotes = graceChords[i].notes;

//                       console.log('>>> cursor.key = ' + cursor.keySignature);
                     nameChord(graceNotes, text, cursor.keySignature);
                     // there seems to be no way of knowing the exact horizontal pos.
                     // of a grace note, so we have to guess:
                     text.offsetX = -2.5 * (graceChords.length - i);
                     switch (voice) {
                        case 0: text.offsetY =  1; break;
                        case 1: text.offsetY = 10; break;
                        case 2: text.offsetY = -1; break;
                        case 3: text.offsetY = 12; break;
                     }

                     cursor.add(text);
                     // new text for next element
                     text = newElement(Element.STAFF_TEXT);
                  }

                  var notes = cursor.element.notes;
                  nameChord(notes, text,cursor.keySignature);

                  switch (voice) {
                     case 0: text.offsetY =  1; break;
                     case 1: text.offsetY = 10; break;
                     case 2: text.offsetY = -1; break;
                     case 3: text.offsetY = 12; break;
                  }
                  if ((voice == 0) && (notes[0].pitch > 83))
                     text.offsetX = 1;
                  cursor.add(text);
               } // end if CHORD
               cursor.next();
            } // end while segment
         } // end for voice
      } // end for staff
      Qt.quit();
   } // end onRun
}

// 1 C
// 2 C#
// 3 D
// 4 D#
// 5 E
// 6 F
// 7 F#
// 8 G
// 9 G#
// 10 A
// 11 A#
// 12 B

// Key C = 0
// Key G = 1
// Key D = 2
// Key A = 3

// Key E = 4
// Key B = 5
// Key F# = 6
// Key C# = 7
// Key Cb = -7

// Key Gb = -6
// Key Db = -5
// Key Ab = -4
// Key Eb = -3
// Key Bb = -2
// Key F = -1

