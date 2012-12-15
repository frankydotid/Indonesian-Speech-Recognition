;  FILENAME 
;  id1_mbrola.scm
; 
;  DESCRIPTION
;  This is a wrapper for Festival of Mbrola voice for Indonesian
;  male voice (id1). The voice was created by Arry Akhmad 
;  Arman (http://indotts.melsa.net.id/).  This file is a modification
;  of cz2_mbrola.scm.
;
;  HOW TO USE
;  You need to have Festival and Mbrola installed on your system.
;  Festival can be downloaded from http://www.cstr.ed.ac.uk/projects/festival/
;  and Mbrola can be downloaded from http://tcts.fpms.ac.be/synthesis/.
;  You will also need the voice database file (id1) that can be downloaded
;  from Mbrola page.
;
;  Mbrola binary for i386 linux is at http://tcts.fpms.ac.be/synthesis/mbrola/bin/pclinux/mbr301h.zip.
;
;  - Create directory 'indonesian' under '/usr/share/festival/voices' and
;    'id1_mbrola' under '/usr/share/festival/voices/indonesian'. 
;  - Put 'id1' file under 'id1_mbrola' directory. 
;  - Create 'festvox' directory under 'id1_mbrola' and put this file under
;    'festvox'
;  - Run festival and set the voice to use Indonesian: (voice_id1_mbrola)
;  
;  PROBLEMS
;  - the 'r', 'ny', and 'ng' are not properly pronounced
;  - same letters that appears side by side caused error in Mbrola:
;    Unkown recovery for X-X segment
;    e.g.: menggali (g-g), rumah hantu (h-h) 
;
;  COPYRIGHT NOTICE
;  Copyright 2012 Franky <franky.id@gmail.com>
;  Copyright 2000,2003 Pavel Machek <pavel@ucw.cz>
;  Copyright 2002 Petr Baudis <pasky@ucw.cz>
;
;  Version 1.0
;
;  You MAY use this software under terms of GNU GPL, or under following license:
;
;  Permission is hereby granted, free of charge, to use and distribute  
;  this software and its documentation without restriction, including   
;  without limitation the rights to use, copy, modify, merge, publish,  
;  distribute, sublicense, and/or sell copies of this work, and to      
;  permit persons to whom this work is furnished to do so, subject to   
;  the following conditions:                                            
;   1. The code must retain the above copyright notice, this list of    
;      conditions and the following disclaimer.                         
;   2. Original authors' names are not deleted. 
;                                                                       
;  EVERYONE
;  DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING      
;  ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT   
;  SHALL THE UNIVERSITY OF EDINBURGH NOR THE CONTRIBUTORS BE LIABLE     
;  FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES    
;  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN   
;  AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,          
;  ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF       
;  THIS SOFTWARE.                                                       
;
;  REFERENCES
;  1. Proceedings of the Seventh International Conference on Austronesian Linguistics (1994)
;  2. http://en.wikipedia.org/wiki/Consonants
;  3. http://en.wikipedia.org/wiki/Schwa#Indonesian_and_Malay
;  4. http://en.wikipedia.org/wiki/Vowel
;  5. http://www.cstr.ed.ac.uk/projects/festival/manual/festival_15.html#SEC58
;  6. http://www.cstr.ed.ac.uk/projects/festival/manual/festival_13.html#SEC41
;  7. http://www.cstr.ed.ac.uk/projects/festival/manual/festival_17.html#SEC63
;  8. http://www.cstr.ed.ac.uk/projects/festival/manual/festival_18.html#SEC67
;  9. http://www.cstr.ed.ac.uk/projects/festival/manual/festival_14.html	-> utterance
;  10. http://www.cstr.ed.ac.uk/emasters/summer_school_2005/tutorial3/tutorial.html  -> how to capture utterance
;  11. http://tcts.fpms.ac.be/synthesis/mbrola/mbrfaq.html#Q10  -> error description
;  12. http://www.cstr.ed.ac.uk/projects/festival/manual/festival_24.html -> important
; 


;  set directory name
(set! id1_mbrola_dir (cdr (assoc 'id1_mbrola voice-locations)))


;  include required libraries
(require 'mbrola)


;  PRONOUNCIATION (IPA)
;  The features were copied from czech version, originally mrpa/spanish version. 
;  Feature values added for 'consonant type' and 'place of articulation' to
;  match IPA definition, but they are only the approximation of IPA definition, 
;  so you may want to double check that if you want to have it matched 
;  perfectly. The phonemes set are the phonemes used in id1 database.
(defPhoneSet

  ;;; NAME
  indonesian
  
  ;;; FEATUREDEFS
  (
   ;; vowel or consonant
   (vc + -)  

   ;; vowel length: short long diphthong schwa ([3])
   (vlng s l d a 0)
   
   ;; vowel height: high mid low ([4] Look at the chart)
   (vheight 1 2 3 -)
   
   ;; vowel frontness: front mid back ([4])
   (vfront 1 2 3 -)
   
   ;; lip rounding ([4])
   (vrnd + -)
   
   ;; some type of consonant are not included here, can be added in the future
   ;; consonant type: stop fricative affricative nasal liquid lateral-approximant
   ;; flap-tap ([2])
   (ctype s f a n l r p 0)
   
   ;; place of articulation: labial alveolar palatal labio-dental
   ;; dental velar glotal ([2])
   (cplace l a p b d v g 0)
   
   ;; consonant voicing ([2])
   (cvox + -)
  )
  ;; Phone set members (follows id1 database phonemes set 'id1.txt')
  (
   (_    - 0 - - - 0 0 +)
   (V    + s 3 2 - 0 0 -)	;;; set vowel to use short length ([1] . page 207)
   (aI    + d 1 1 - 0 0 -)
   (aU    + d 1 3 + 0 0 -)
   (b    - 0 - - - s l +)
   (tS   - 0 - - - s p -)
   (d    - 0 - - - s a +)
   (@    + a 2 2 - 0 0 -)	
   (e   + s 2 1 - 0 0 -)
   (f    - 0 - - + f b -)
   (g    - 0 - - - s v +)
   (h   - 0 - - - f g -)
   (I    + s 1 1 - 0 0 -)
   (dZ    - 0 - - - a a +)
   (k    - 0 - - - s v -)
   (l    - 0 - - - r a +)
   (m    - 0 - - - n l +)
   (n    - 0 - - - n a +)
   (nY    - 0 - - + n v +)
   (N    - 0 - - + n v +)
   (Q    + s 2 3 + 0 0 -)
   (OI    + d 1 1 - 0 0 -) 
   (p    - 0 - - - s l -)
   (r    - 0 - - - p a +)
   (s    - 0 - - - f a -)
   (t    - 0 - - - s d -)
   (U    + s 1 3 + 0 0 -)
   (w    - 0 - - - r v +)
   (j    - 0 - - - r p -)   
   (z    - 0 - - - f a +)
  )
)

;  TOKENIZATION RULES
;  Convert unknown symbol to text, see [5], e.g. '$' to 'dollars'
;  Cannot handle the separation of punctuations and word, e.g. satu,
(define (indonesian_token_to_words token name)
"(indonesians_token_to_words TOKEN NAME)"
  ;  Comprehensive rules for English can be found in 
  ;  /usr/share/festival/token.scm. For now, just return the name
  ;  as it is. Please modify if you are interested in it.
  (list name)
)


; SILENCE DEFINITION
(PhoneSet.silences '(_))

; RULESET FOR READING
(lts.ruleset
;  Name of rule set
 indonesian_ruleset
;  Predefined set, put '(nil)' if none
; (nil)
(
  nil
)
;  Rules
(
 ; ( [ _ ] = _ )
 ( [ a ] = V )
 ( [ ai ] = aI )
 ( [ au ] = aU )
 ( [ b ] = b )
 ( [ b e d a ] = b e d V )
 ( [ m e d a n ] = m e d V n )
 ( [ m e r a h ] = m e r V h )
 ( [ m e n t e n g ] = m e n t e N )
 ( [ e m b e r ] = e m b e r )
 ( [ c ] = tS )
 ( [ d ] = d )
 ( [ e ] = @ )
 ( # [ e ] = e )
 ( [ f ] = f )
 ( [ g ] = g )
 ( [ h ] = h )
 ( [ i ] = I )
 ( [ j ] = dZ )
 ( [ k ] = k )
 ( [ kh ] = k h ) 
 ( [ l ] = l )
 ( [ m ] = m )
 ( [ n ] = n )
 ( [ ng ] = N )
 ( [ ny ] = nY )
 ( [ o ] = Q )
 ( [ oi ] = OI )
 ( [ p ] = p )
 ( [ q ] = k )
 ( [ r ] = r )
 ( [ s ] = s )
 ( [ sy ] = s y )
 ( [ t ] = t )
 ( [ u ] = U )
 ( [ v ] = f )
 ( [ w ] = w )
 ( [ x ] = k s )
 ( [ y ] = j )
 ( [ z ] = z )
 ( [ 1 ] = s V t U _ )
 ( [ 2 ] = d U V _ )
 ( [ 3 ] = t I g V _ )
 ( [ 4 ] = @ m p V t _ )
 ( [ 5 ] = l I m V _ )
 ( [ 6 ] = @ n V m _ )
 ( [ 7 ] = t U dZ U h _ )
 ( [ 8 ] = d @ l V p V n _ )
 ( [ 9 ] = s @ m b I l V n _ )
 ( [ 0 ] = n Q l _ )
 ( [ "." ] = _ )
 ( [ "," ] = _ )
 ( [ "?" ] = _ )
 ( [ "!" ] = _ )
 ( [ ":" ] = _ )
 ( [ ";" ] = _ )
 ( [ "+" ] = t V m b V h _ )
 ( [ "-" ] = _ )
 ;( [ "_" ] = _ )
 ( [ ">" ] = _ )
 ( [ "<" ] = _ )
 ( [ "(" ] = _ )
 ( [ ")" ] = _ )
 ( [ "[" ] = _ )
 ( [ "#\]" ] = _ ) 
 ( [ "{" ] = _ )
 ( [ "}" ] = _ )
 ( [ "\"" ] = _ )
 ( [ "'" ] = _ )
 ( [ "`" ] = _ )
 ( [ "@" ] = e t _ )
 ( [ "*" ] = _ )
 ( [ "~" ] = _ )
 ( [ "#" ] = h e s _ )
 ( [ "$" ] = d Q l V r _ )
 ( [ "%" ] = p @ r s e n _ )
 ( [ "^" ] = _ ) ;; ???
 ( [ "&" ] = d V n _ )
 ( [ "|" ] = _ _ )
 ( [ "\\" ] = b e k s l e s _ )
))

;  LEXICON 
;  Create the pronounciation rules [6].
(lex.create "indonesian")
(lex.set.phoneset "indonesian")
(define (indonesian_lts word features)
  "(indonesian_lts WORD FEATURES)
Using letter to sound rules build a indonesian pronunciation of WORD."
  (list word
        nil
        (lex.syllabify.phstress (lts.apply (downcase word) 'indonesian_ruleset))))

(lex.set.lts.method 'indonesian_lts)

(lex.set.lts.ruleset 'indonesian_ruleset)

;  Lexicon entry to test stress (accent)
(lex.add.entry
  '("abang" nil ( ((V) 0) ((b V N) 0)) )
)
(lex.add.entry
  '("saya" nil ( ((s V) 0) ((j V) 0)) )
)
(lex.add.entry
  '("benci" nil ( ((b @ n) 1) ((tS I) 1)) )
)
(lex.add.entry
  '("badai" nil ( ((b V) 1) ((d aI) 0)) )
)



;  PHRASE PREDICTION
;  [7]
(set! indonesian_phrase_cart_tree
'
; ((R:Token.parent.punc in ("?" "." ":"))
  ; ((BB))
  ; ((R:Token.parent.punc in ("'" "\"" "," ";"))
   ; ((B))
   ; ((n.name is 0)
    ; ((BB))
    ; ((NB))))))

; czech version from spanish version in [12]
((lisp_token_end_punc in ("?" "." ":" "!"))
  ((BB))
  ((lisp_token_end_punc in ("'" "\"" "," ";"))
   ((B))
   ((n.name is 0)  ;; end of utterance
    ((BB))
    ((NB))))))
	

;  ACCENT RULES
;  This is not a proper one
(set! indonesian_accent_cart_tree
 '((R:SylStructure.parent.gpos is content)
   ((stress is 1)
    ((Accented))
    ((position_type is single)
     ((Accented))
     ((NONE))))
   ((NONE))))


;  DURATION
;  Indonesian is a syllable-timed language ([1]), all syllables have equal duration
;  (assume 0.170, vowel 0.09, consonant 0.08). This might not be true, just an
;  assumption.
(set! indonesian_durs
  ;; (phone inherent-duration minimum-duration) assume min = 0.45 x inh
'(
   (_ 0.250 0.250)
   (V 0.090 0.040)
   (aI 0.170 0.076)
   (aU 0.170 0.076)
   (b 0.080 0.036)
   (tS 0.080 0.036)
   (d 0.080 0.036)
   (@ 0.090 0.040)
   (e 0.090 0.040)
   (f 0.080 0.036)
   (g 0.080 0.036)
   (h 0.080 0.036)
   (I 0.090 0.040)
   (dZ 0.080 0.036)
   (k 0.080 0.036)
   ;(kh 0.080 0.036)
   (l 0.080 0.036)
   (m 0.080 0.036)
   (n 0.080 0.036)
   (nY 0.080 0.036)
   (N 0.080 0.036)
   (Q 0.090 0.040)
   (OI 0.170 0.076)
   (p 0.080 0.036)
   ;(q 0.080 0.036)
   (r 0.080 0.036)
   (s 0.080 0.036)
   ;(sy 0.080 0.036)
   (t 0.080 0.036)
   (U 0.090 0.040)
   ;(v 0.080 0.036)
   (w 0.080 0.036)
   ;(x 0.080 0.036)
   (j 0.080 0.036)   
   (z 0.080 0.036)
   ;(@ 0.100 0.045) ;; ???? this needs to be here :/ (from czech version)
))


; DURATION TREE RULE
; Copied
(set! indonesian_dur_tree
 '
   ((R:SylStructure.parent.R:Syllable.p.syl_break > 1 ) ;; clause initial
    ((R:SylStructure.parent.stress is 1)
     ((1.5))
     ((1.2))
    )
    ((R:SylStructure.parent.syl_break > 1)   ;; clause final
     ((R:SylStructure.parent.stress is 1)
      ((2.0))
      ((1.5))
     )
     ((R:SylStructure.parent.stress is 1)
      ((1.2))
      ((1.0))
     )
    )
   )
)

; Copied
(define (int_simple)
  (set! int_simple_params
	'((f0_mean 120) (f0_std 10)))

  (Parameter.set 'Int_Target_Method 'Simple)
  (Parameter.set 'Int_Method 'Simple))

; Copied
(define (int_tree)
  (require 'f2bf0lr)
  (set! f0_lr_start f2b_f0_lr_start)
  (set! f0_lr_mid f2b_f0_lr_mid)
  (set! f0_lr_end f2b_f0_lr_end)

  (Parameter.set 'Int_Target_Method 'Int_Targets_LR)
  (Parameter.set 'Int_Method 'Intonation_Tree)
  (set! int_lr_params
        '((target_f0_mean 105) (target_f0_std 15)
          (model_f0_mean 170) (model_f0_std 34)))
)

; Main definition of the voice
(define (voice_id1_mbrola)
"(voice_id1_mbrola)
 Set up the current voice to be male Indonesian using mbrola."
  
  ;; Phone set
  (voice_reset)
  (Parameter.set 'Language 'indonesian)
  (Parameter.set 'PhoneSet 'indonesian)
  (PhoneSet.select 'indonesian)
  
  ;; Tokenization rules
  (set! token_to_words indonesian_token_to_words)
  
  ;; POS tagger
  (require 'pos)
  (set! pos_supported nil)
  (set! pos_lex_name nil)
  ; (set! pos_ngram_name 'english_pos_ngram)
  
  ;; Lexicon
  (lex.select "indonesian")

  ;; Phrase prediction
  (require 'phrase)
  (Parameter.set 'Phrase_Method 'cart_tree)
  (set! phrase_cart_tree indonesian_phrase_cart_tree)
  
  ;; Accent and tone prediction
  (require 'tobi)
  (set! int_tone_cart_tree f2b_int_tone_cart_tree)
  (set! int_accent_cart_tree indonesian_accent_cart_tree) 
  ; f2b_int gives better results than czech ?
  ; try f2b_int_accent_cart_tree instead.
  (set! postlex_vowel_reduce_cart_tree 
	postlex_vowel_reduce_cart_data)
  ;; F0 prediction

  (int_simple)
;  (int_tree)
	 
  ;; Duration prediction
  (set! duration_cart_tree indonesian_dur_tree)
  (set! duration_ph_info indonesian_durs)
  (Parameter.set 'Duration_Method Duration_Tree_ZScores)
  (Parameter.set 'Duration_Stretch 0.7)
  
  ;; Waveform synthesizer
  (set! us_abs_offset 0.0)
  (set! window_factor 1.0)
  (set! us_rel_offset 0.0)
  (set! us_gain 0.9)

  (Parameter.set 'Synth_Method 'MBROLA_Synth)
  (set! mbrola_progname "mbrola")
  (set! mbrola_database 
	(format 
	 nil
	 "%s%s "
	 id1_mbrola_dir "id1" 
	 ))

  (set! current-voice 'id1_mbrola)
)

;  PROCLAIM YOUR VOICE
(proclaim_voice
 'id1_mbrola
 '((language indonesian)
   (gender male)
   (dialect none)
   (description
    "This is test indonesian voice using mbrola.")))

(provide 'id1_mbrola)
