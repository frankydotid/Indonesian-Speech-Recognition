=====================================================================
README
=====================================================================

I. DESCRIPTION
This is a repository for my Speech Recognition class using HTK and
Festival for Indonesian language. 

II. SPEECH RECOGNITION
I used HTK for speech recognition task that can be downloaded from
http://htk.eng.cam.ac.uk/. You may need the manual (HTK Book) and
you also may want to start from Chapter 3 Tutorial if you are only
interested in the experiment without knowing the basic theory (not
recommended).

My training data (train.tar.gz) contains 50 recorded sentences
together with their transcriptions. The test data contains 20
sentences (or 25?). Each folder of train and test data has some 
slightly different configuration. Read Notes (Directories)
for the details. 

The best results is 90% (18 out of 20 sentences) after some 
tweaking with major help from my professor.

III. SPEECH SYNTHESIS
Speech synthesis was performed using Festival and Mbrola voice
database, since Festival does not provide Indonesian voice. The 
Indonesian voice database in Mbrola was created by Arry Akhmad Arman
(http://indotts.melsa.net.id/). 

The speech-synthesis folder only contains one important file
'id1_mbrola.scm'. This is a festival wrapper to use Mbrola voice 
database inside Festival. I think this is the first one,
because I cannot find any other scm file for Indonesian. 

The result is still poor, mainly due to intonation and accent
rule, which is none.

IV. DISCLAIMER
This is a school project, do not use it for any important task. I
do not responsible for the undesired results of using the data 
provided here.

