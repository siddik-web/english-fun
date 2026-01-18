import '../models/word_pair.dart';

class WordPairsData {
  // Mutable list to allow adding AI-generated pairs
  static final List<WordPair> _dynamicPairs = [];
  
  static const List<WordPair> _staticPairs = [
    // ========================================
    // VOWEL FUN - focusing on vowel sounds
    // ========================================
    
    // Short i vs Long ee
    WordPair(
      word1: 'Ship',
      word2: 'Sheep',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Ship',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Sheep',
      category: 'Vowel Fun',
      mouthHint1: 'Short "i" - smile a little!',
      mouthHint2: 'Long "ee" - big smile!',
    ),
    WordPair(
      word1: 'Sit',
      word2: 'Seat',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Sit',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Seat',
      category: 'Vowel Fun',
      mouthHint1: 'Short "i" - quick sound!',
      mouthHint2: 'Long "ee" - stretch it!',
    ),
    WordPair(
      word1: 'Bit',
      word2: 'Beat',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Bit',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Beat',
      category: 'Vowel Fun',
      mouthHint1: 'Short "i" sound',
      mouthHint2: 'Long "ee" sound',
    ),
    WordPair(
      word1: 'Lip',
      word2: 'Leap',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Lip',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Leap',
      category: 'Vowel Fun',
      mouthHint1: 'Short "i" - quick!',
      mouthHint2: 'Long "ee" - jump high!',
    ),
    WordPair(
      word1: 'Fill',
      word2: 'Feel',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Fill',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Feel',
      category: 'Vowel Fun',
      mouthHint1: 'Short "i" - fill it up!',
      mouthHint2: 'Long "ee" - how do you feel?',
    ),
    
    // Short a vs Long a
    WordPair(
      word1: 'Hat',
      word2: 'Hate',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Hat',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Hate',
      category: 'Vowel Fun',
      mouthHint1: 'Short "a" - open wide!',
      mouthHint2: 'Long "a" - say the letter A!',
    ),
    WordPair(
      word1: 'Tap',
      word2: 'Tape',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Tap',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Tape',
      category: 'Vowel Fun',
      mouthHint1: 'Short "a" - tap tap!',
      mouthHint2: 'Long "a" - sticky tape!',
    ),
    WordPair(
      word1: 'Rat',
      word2: 'Rate',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Rat',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Rate',
      category: 'Vowel Fun',
      mouthHint1: 'Short "a" - quick sound!',
      mouthHint2: 'Long "a" - stretch it out!',
    ),
    WordPair(
      word1: 'Can',
      word2: 'Cane',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Can',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cane',
      category: 'Vowel Fun',
      mouthHint1: 'Short "a" - I can do it!',
      mouthHint2: 'Long "a" - candy cane!',
    ),
    
    // ========================================
    // LETTER SOUNDS - consonant focus
    // ========================================
    
    // F vs V
    WordPair(
      word1: 'Fan',
      word2: 'Van',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Fan',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Van',
      category: 'Letter Sounds',
      mouthHint1: 'F - top teeth touch bottom lip',
      mouthHint2: 'V - teeth touch lip with buzzing',
    ),
    WordPair(
      word1: 'Fine',
      word2: 'Vine',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Fine',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Vine',
      category: 'Letter Sounds',
      mouthHint1: 'F - soft air sound',
      mouthHint2: 'V - buzzy sound',
    ),
    WordPair(
      word1: 'Fast',
      word2: 'Vast',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Fast',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Vast',
      category: 'Letter Sounds',
      mouthHint1: 'F - quiet air!',
      mouthHint2: 'V - voice buzzes!',
    ),
    
    // P vs B
    WordPair(
      word1: 'Pat',
      word2: 'Bat',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Pat',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Bat',
      category: 'Letter Sounds',
      mouthHint1: 'P - pop your lips!',
      mouthHint2: 'B - buzz your lips!',
    ),
    WordPair(
      word1: 'Pig',
      word2: 'Big',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Pig',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Big',
      category: 'Letter Sounds',
      mouthHint1: 'P - puff of air!',
      mouthHint2: 'B - voice on!',
    ),
    WordPair(
      word1: 'Pear',
      word2: 'Bear',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Pear',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Bear',
      category: 'Letter Sounds',
      mouthHint1: 'P - quiet pop!',
      mouthHint2: 'B - loud buzz!',
    ),
    
    // T vs D
    WordPair(
      word1: 'Tip',
      word2: 'Dip',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Tip',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Dip',
      category: 'Letter Sounds',
      mouthHint1: 'T - tap your tongue!',
      mouthHint2: 'D - voice with tongue!',
    ),
    WordPair(
      word1: 'Two',
      word2: 'Do',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Two',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Do',
      category: 'Letter Sounds',
      mouthHint1: 'T - sharp sound!',
      mouthHint2: 'D - softer sound!',
    ),
    WordPair(
      word1: 'Ten',
      word2: 'Den',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Ten',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Den',
      category: 'Letter Sounds',
      mouthHint1: 'T - count to ten!',
      mouthHint2: 'D - lion\'s den!',
    ),
    
    // S vs Z
    WordPair(
      word1: 'Sue',
      word2: 'Zoo',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Sue',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Zoo',
      category: 'Letter Sounds',
      mouthHint1: 'S - snake sound!',
      mouthHint2: 'Z - bee buzz!',
    ),
    WordPair(
      word1: 'Sip',
      word2: 'Zip',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Sip',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Zip',
      category: 'Letter Sounds',
      mouthHint1: 'S - sssip quietly!',
      mouthHint2: 'Z - zzzzip it up!',
    ),
    
    // ========================================
    // TRICKY PAIRS - challenging minimal pairs
    // ========================================
    
    // A vs E
    WordPair(
      word1: 'Bat',
      word2: 'Bet',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Bat',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Bet',
      category: 'Tricky Pairs',
      mouthHint1: 'A - open mouth wide!',
      mouthHint2: 'E - smaller mouth',
    ),
    WordPair(
      word1: 'Pen',
      word2: 'Pan',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Pen',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Pan',
      category: 'Tricky Pairs',
      mouthHint1: 'E - mouth slightly open',
      mouthHint2: 'A - open mouth wide',
    ),
    WordPair(
      word1: 'Bad',
      word2: 'Bed',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Bad',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Bed',
      category: 'Tricky Pairs',
      mouthHint1: 'A - open wide like yawning!',
      mouthHint2: 'E - smile a little!',
    ),
    WordPair(
      word1: 'Man',
      word2: 'Men',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Man',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Men',
      category: 'Tricky Pairs',
      mouthHint1: 'A - one man!',
      mouthHint2: 'E - many men!',
    ),
    
    // A vs U
    WordPair(
      word1: 'Cap',
      word2: 'Cup',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cap',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cup',
      category: 'Tricky Pairs',
      mouthHint1: 'A - wide mouth',
      mouthHint2: 'U - round lips',
    ),
    WordPair(
      word1: 'Cat',
      word2: 'Cut',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cat',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cut',
      category: 'Tricky Pairs',
      mouthHint1: 'A - meow with wide mouth!',
      mouthHint2: 'U - uh sound!',
    ),
    WordPair(
      word1: 'Ran',
      word2: 'Run',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Ran',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Run',
      category: 'Tricky Pairs',
      mouthHint1: 'A - I ran fast!',
      mouthHint2: 'U - let\'s run!',
    ),
    
    // I vs E
    WordPair(
      word1: 'Pin',
      word2: 'Pen',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Pin',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Pen',
      category: 'Tricky Pairs',
      mouthHint1: 'I - smile tight!',
      mouthHint2: 'E - relax mouth!',
    ),
    WordPair(
      word1: 'Tin',
      word2: 'Ten',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Tin',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Ten',
      category: 'Tricky Pairs',
      mouthHint1: 'I - tin can!',
      mouthHint2: 'E - count to ten!',
    ),
    WordPair(
      word1: 'Sit',
      word2: 'Set',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Sit',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Set',
      category: 'Tricky Pairs',
      mouthHint1: 'I - sit down!',
      mouthHint2: 'E - ready, set, go!',
    ),
    
    // ========================================
    // MORE VOWEL FUN - Additional vowel pairs
    // ========================================
    
    // Short o vs Long o
    WordPair(
      word1: 'Hop',
      word2: 'Hope',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Hop',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Hope',
      category: 'Vowel Fun',
      mouthHint1: 'Short "o" - hop hop!',
      mouthHint2: 'Long "o" - say OH!',
    ),
    WordPair(
      word1: 'Not',
      word2: 'Note',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Not',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Note',
      category: 'Vowel Fun',
      mouthHint1: 'Short "o" - quick!',
      mouthHint2: 'Long "o" - musical note!',
    ),
    WordPair(
      word1: 'Dot',
      word2: 'Dote',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Dot',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Dote',
      category: 'Vowel Fun',
      mouthHint1: 'Short "o" - small dot!',
      mouthHint2: 'Long "o" - stretch it!',
    ),
    WordPair(
      word1: 'Cop',
      word2: 'Cope',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cop',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cope',
      category: 'Vowel Fun',
      mouthHint1: 'Short "o" sound',
      mouthHint2: 'Long "o" - you can cope!',
    ),
    
    // Short u vs Long u
    WordPair(
      word1: 'Cub',
      word2: 'Cube',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cub',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cube',
      category: 'Vowel Fun',
      mouthHint1: 'Short "u" - baby bear!',
      mouthHint2: 'Long "u" - say YOU!',
    ),
    WordPair(
      word1: 'Tub',
      word2: 'Tube',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Tub',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Tube',
      category: 'Vowel Fun',
      mouthHint1: 'Short "u" - bath tub!',
      mouthHint2: 'Long "u" - long tube!',
    ),
    WordPair(
      word1: 'Cut',
      word2: 'Cute',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cut',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cute',
      category: 'Vowel Fun',
      mouthHint1: 'Short "u" - cut it!',
      mouthHint2: 'Long "u" - so cute!',
    ),
    
    // More short i vs long ee
    WordPair(
      word1: 'Chip',
      word2: 'Cheap',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Chip',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cheap',
      category: 'Vowel Fun',
      mouthHint1: 'Short "i" - potato chip!',
      mouthHint2: 'Long "ee" - not expensive!',
    ),
    WordPair(
      word1: 'Slip',
      word2: 'Sleep',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Slip',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Sleep',
      category: 'Vowel Fun',
      mouthHint1: 'Short "i" - don\'t slip!',
      mouthHint2: 'Long "ee" - time to sleep!',
    ),
    WordPair(
      word1: 'Grin',
      word2: 'Green',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Grin',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Green',
      category: 'Vowel Fun',
      mouthHint1: 'Short "i" - big grin!',
      mouthHint2: 'Long "ee" - green color!',
    ),
    
    // More short a vs long a
    WordPair(
      word1: 'Mad',
      word2: 'Made',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Mad',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Made',
      category: 'Vowel Fun',
      mouthHint1: 'Short "a" - angry!',
      mouthHint2: 'Long "a" - I made it!',
    ),
    WordPair(
      word1: 'Plan',
      word2: 'Plane',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Plan',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Plane',
      category: 'Vowel Fun',
      mouthHint1: 'Short "a" - make a plan!',
      mouthHint2: 'Long "a" - airplane!',
    ),
    WordPair(
      word1: 'Gap',
      word2: 'Gape',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Gap',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Gape',
      category: 'Vowel Fun',
      mouthHint1: 'Short "a" - small gap!',
      mouthHint2: 'Long "a" - mouth wide open!',
    ),
    
    // ========================================
    // MORE LETTER SOUNDS - Additional consonants
    // ========================================
    
    // K vs G
    WordPair(
      word1: 'Cap',
      word2: 'Gap',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cap',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Gap',
      category: 'Letter Sounds',
      mouthHint1: 'K - quiet sound!',
      mouthHint2: 'G - voice on!',
    ),
    WordPair(
      word1: 'Came',
      word2: 'Game',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Came',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Game',
      category: 'Letter Sounds',
      mouthHint1: 'K - I came here!',
      mouthHint2: 'G - let\'s play a game!',
    ),
    WordPair(
      word1: 'Cold',
      word2: 'Gold',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cold',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Gold',
      category: 'Letter Sounds',
      mouthHint1: 'K - brrr cold!',
      mouthHint2: 'G - shiny gold!',
    ),
    
    // L vs R
    WordPair(
      word1: 'Light',
      word2: 'Right',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Light',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Right',
      category: 'Letter Sounds',
      mouthHint1: 'L - tongue touches top!',
      mouthHint2: 'R - tongue curls back!',
    ),
    WordPair(
      word1: 'Lap',
      word2: 'Rap',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Lap',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Rap',
      category: 'Letter Sounds',
      mouthHint1: 'L - sit on my lap!',
      mouthHint2: 'R - rap music!',
    ),
    WordPair(
      word1: 'Lock',
      word2: 'Rock',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Lock',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Rock',
      category: 'Letter Sounds',
      mouthHint1: 'L - lock the door!',
      mouthHint2: 'R - big rock!',
    ),
    
    // M vs N
    WordPair(
      word1: 'Mat',
      word2: 'Nat',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Mat',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Nat',
      category: 'Letter Sounds',
      mouthHint1: 'M - lips together!',
      mouthHint2: 'N - tongue touches top!',
    ),
    WordPair(
      word1: 'Map',
      word2: 'Nap',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Map',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Nap',
      category: 'Letter Sounds',
      mouthHint1: 'M - look at the map!',
      mouthHint2: 'N - take a nap!',
    ),
    
    // W vs V
    WordPair(
      word1: 'Wet',
      word2: 'Vet',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Wet',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Vet',
      category: 'Letter Sounds',
      mouthHint1: 'W - round your lips!',
      mouthHint2: 'V - teeth touch lip!',
    ),
    WordPair(
      word1: 'West',
      word2: 'Vest',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=West',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Vest',
      category: 'Letter Sounds',
      mouthHint1: 'W - go west!',
      mouthHint2: 'V - wear a vest!',
    ),
    
    // SH vs CH
    WordPair(
      word1: 'Ship',
      word2: 'Chip',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Ship',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Chip',
      category: 'Letter Sounds',
      mouthHint1: 'SH - shhhh sound!',
      mouthHint2: 'CH - ch ch sound!',
    ),
    WordPair(
      word1: 'Shop',
      word2: 'Chop',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Shop',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Chop',
      category: 'Letter Sounds',
      mouthHint1: 'SH - go shopping!',
      mouthHint2: 'CH - chop the food!',
    ),
    
    // TH vs F
    WordPair(
      word1: 'Thin',
      word2: 'Fin',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Thin',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Fin',
      category: 'Letter Sounds',
      mouthHint1: 'TH - tongue between teeth!',
      mouthHint2: 'F - teeth touch lip!',
    ),
    WordPair(
      word1: 'Think',
      word2: 'Fink',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Think',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Fink',
      category: 'Letter Sounds',
      mouthHint1: 'TH - think hard!',
      mouthHint2: 'F - different sound!',
    ),
    
    // ========================================
    // MORE TRICKY PAIRS - Advanced challenges
    // ========================================
    
    // O vs U
    WordPair(
      word1: 'Hot',
      word2: 'Hut',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Hot',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Hut',
      category: 'Tricky Pairs',
      mouthHint1: 'O - it\'s hot!',
      mouthHint2: 'U - small hut!',
    ),
    WordPair(
      word1: 'Cop',
      word2: 'Cup',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cop',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cup',
      category: 'Tricky Pairs',
      mouthHint1: 'O - police officer!',
      mouthHint2: 'U - drink from cup!',
    ),
    WordPair(
      word1: 'Dot',
      word2: 'Dut',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Dot',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Dut',
      category: 'Tricky Pairs',
      mouthHint1: 'O - small dot!',
      mouthHint2: 'U - uh sound!',
    ),
    
    // Short vs Long vowels mixed
    WordPair(
      word1: 'Rid',
      word2: 'Read',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Rid',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Read',
      category: 'Tricky Pairs',
      mouthHint1: 'I - get rid of it!',
      mouthHint2: 'EE - read a book!',
    ),
    WordPair(
      word1: 'Hid',
      word2: 'Head',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Hid',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Head',
      category: 'Tricky Pairs',
      mouthHint1: 'I - I hid it!',
      mouthHint2: 'E - my head!',
    ),
    WordPair(
      word1: 'Bit',
      word2: 'Bet',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Bit',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Bet',
      category: 'Tricky Pairs',
      mouthHint1: 'I - little bit!',
      mouthHint2: 'E - I bet you can!',
    ),
    
    // Consonant endings
    WordPair(
      word1: 'Back',
      word2: 'Bag',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Back',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Bag',
      category: 'Tricky Pairs',
      mouthHint1: 'K - sharp ending!',
      mouthHint2: 'G - soft ending!',
    ),
    WordPair(
      word1: 'Sack',
      word2: 'Sad',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Sack',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Sad',
      category: 'Tricky Pairs',
      mouthHint1: 'K - big sack!',
      mouthHint2: 'D - feeling sad!',
    ),
    WordPair(
      word1: 'Rip',
      word2: 'Rib',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Rip',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Rib',
      category: 'Tricky Pairs',
      mouthHint1: 'P - rip the paper!',
      mouthHint2: 'B - your rib bone!',
    ),
    
    // Double letters
    WordPair(
      word1: 'Hop',
      word2: 'Hopp',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Hop',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Hopp',
      category: 'Tricky Pairs',
      mouthHint1: 'Single P - hop once!',
      mouthHint2: 'Double P - hop hop!',
    ),
    WordPair(
      word1: 'Tap',
      word2: 'Tapp',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Tap',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Tapp',
      category: 'Tricky Pairs',
      mouthHint1: 'Single P - one tap!',
      mouthHint2: 'Double P - tap tap!',
    ),

    // ========================================
    // SUPER VOWEL EXTENSION
    // ========================================

    // Short E vs Long A (Common confusion)
    WordPair(
      word1: 'Bell',
      word2: 'Bale',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Bell',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Bale',
      category: 'Vowel Fun',
      mouthHint1: 'Short E - ring the bell!',
      mouthHint2: 'Long A - bale of hay!',
    ),
    WordPair(
      word1: 'Sell',
      word2: 'Sail',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Sell',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Sail',
      category: 'Vowel Fun',
      mouthHint1: 'Short E - sell it!',
      mouthHint2: 'Long A - sail away!',
    ),
    WordPair(
      word1: 'Men',
      word2: 'Main',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Men',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Main',
      category: 'Vowel Fun',
      mouthHint1: 'Short E - many men!',
      mouthHint2: 'Long A - main street!',
    ),
    WordPair(
      word1: 'Wet',
      word2: 'Wait',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Wet',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Wait',
      category: 'Vowel Fun',
      mouthHint1: 'Short E - water!',
      mouthHint2: 'Long A - stop and wait!',
    ),

    // Short O vs Long O (More)
    WordPair(
      word1: 'Rob',
      word2: 'Robe',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Rob',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Robe',
      category: 'Vowel Fun',
      mouthHint1: 'Short O - ah sound',
      mouthHint2: 'Long O - cozy robe!',
    ),
    WordPair(
      word1: 'Hop',
      word2: 'Hope',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Hop',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Hope',
      category: 'Vowel Fun',
      mouthHint1: 'Short O - jump jump!',
      mouthHint2: 'Long O - I hope so!',
    ),
    WordPair(
      word1: 'Not',
      word2: 'Note',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Not',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Note',
      category: 'Vowel Fun',
      mouthHint1: 'Short O - no not!',
      mouthHint2: 'Long O - write a note!',
    ),

    // Short U vs Long U/OO
    WordPair(
      word1: 'Cub',
      word2: 'Cube',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cub',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Cube',
      category: 'Vowel Fun',
      mouthHint1: 'Short U - bear cub!',
      mouthHint2: 'Long U - ice cube!',
    ),
    WordPair(
      word1: 'Tub',
      word2: 'Tube',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Tub',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Tube',
      category: 'Vowel Fun',
      mouthHint1: 'Short U - bath tub!',
      mouthHint2: 'Long U - toothpaste tube!',
    ),
    WordPair(
      word1: 'Us',
      word2: 'Use',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Us',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Use',
      category: 'Vowel Fun',
      mouthHint1: 'Short U - all of us!',
      mouthHint2: 'Long U - use a tool!',
    ),

    // Short I vs Short E (Very tricky!)
    WordPair(
      word1: 'Pin',
      word2: 'Pen',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Pin',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Pen',
      category: 'Vowel Fun',
      mouthHint1: 'Short I - sharp pin!',
      mouthHint2: 'Short E - write with pen!',
    ),
    WordPair(
      word1: 'Tin',
      word2: 'Ten',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Tin',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Ten',
      category: 'Vowel Fun',
      mouthHint1: 'Short I - metal tin!',
      mouthHint2: 'Short E - number 10!',
    ),
    WordPair(
      word1: 'Sit',
      word2: 'Set',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Sit',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Set',
      category: 'Vowel Fun',
      mouthHint1: 'Short I - sit down!',
      mouthHint2: 'Short E - set the table!',
    ),

    // ========================================
    // SUPER CONSONANT COLLECTION
    // ========================================

    // S vs SH
    WordPair(
      word1: 'See',
      word2: 'She',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=See',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=She',
      category: 'Letter Sounds',
      mouthHint1: 'S - smile sound!',
      mouthHint2: 'SH - quiet sound!',
    ),
    WordPair(
      word1: 'Seat',
      word2: 'Sheet',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Seat',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Sheet',
      category: 'Letter Sounds',
      mouthHint1: 'S - sit on seat!',
      mouthHint2: 'SH - paper sheet!',
    ),
    WordPair(
      word1: 'Sip',
      word2: 'Ship',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Sip',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Ship',
      category: 'Letter Sounds',
      mouthHint1: 'S - sip a drink!',
      mouthHint2: 'SH - big ship!',
    ),
    WordPair(
      word1: 'Sock',
      word2: 'Shock',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Sock',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Shock',
      category: 'Letter Sounds',
      mouthHint1: 'S - warm sock!',
      mouthHint2: 'SH - surprise shock!',
    ),

    // L vs R (Classic difficult pair)
    WordPair(
      word1: 'Late',
      word2: 'Rate',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Late',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Rate',
      category: 'Letter Sounds',
      mouthHint1: 'L - tongue up!',
      mouthHint2: 'R - tongue back!',
    ),
    WordPair(
      word1: 'Lead',
      word2: 'Read',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Lead',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Read',
      category: 'Letter Sounds',
      mouthHint1: 'L - lead the way!',
      mouthHint2: 'R - read a book!',
    ),
    WordPair(
      word1: 'Long',
      word2: 'Wrong',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Long',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Wrong',
      category: 'Letter Sounds',
      mouthHint1: 'L - long snake!',
      mouthHint2: 'R - not right!',
    ),
    WordPair(
      word1: 'Fly',
      word2: 'Fry',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Fly',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Fry',
      category: 'Letter Sounds',
      mouthHint1: 'L - fly high!',
      mouthHint2: 'R - fry an egg!',
    ),

    // P vs F
    WordPair(
      word1: 'Pan',
      word2: 'Fan',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Pan',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Fan',
      category: 'Letter Sounds',
      mouthHint1: 'P - pop lips!',
      mouthHint2: 'F - bite lip!',
    ),
    WordPair(
      word1: 'Pine',
      word2: 'Fine',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Pine',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Fine',
      category: 'Letter Sounds',
      mouthHint1: 'P - pine tree!',
      mouthHint2: 'F - I feel fine!',
    ),
    WordPair(
      word1: 'Peel',
      word2: 'Feel',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Peel',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Feel',
      category: 'Letter Sounds',
      mouthHint1: 'P - peel banana!',
      mouthHint2: 'F - feel soft!',
    ),

    // B vs V
    WordPair(
      word1: 'Ban',
      word2: 'Van',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Ban',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Van',
      category: 'Letter Sounds',
      mouthHint1: 'B - lips together!',
      mouthHint2: 'V - teeth on lip!',
    ),
    WordPair(
      word1: 'Best',
      word2: 'Vest',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Best',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Vest',
      category: 'Letter Sounds',
      mouthHint1: 'B - number one!',
      mouthHint2: 'V - jacket!',
    ),
    WordPair(
      word1: 'Boat',
      word2: 'Vote',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Boat',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Vote',
      category: 'Letter Sounds',
      mouthHint1: 'B - sail boat!',
      mouthHint2: 'V - cast vote!',
    ),
    
    // ========================================
    // MORE TRICKY PAIRS
    // ========================================

    // Final Consonants (D vs T)
    WordPair(
      word1: 'Bad',
      word2: 'Bat',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Bad',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Bat',
      category: 'Tricky Pairs',
      mouthHint1: 'D - soft end!',
      mouthHint2: 'T - sharp end!',
    ),
    WordPair(
      word1: 'Had',
      word2: 'Hat',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Had',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Hat',
      category: 'Tricky Pairs',
      mouthHint1: 'D - I had it!',
      mouthHint2: 'T - wear a hat!',
    ),
    WordPair(
      word1: 'Sad',
      word2: 'Sat',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Sad',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Sat',
      category: 'Tricky Pairs',
      mouthHint1: 'D - feeling blue!',
      mouthHint2: 'T - sat down!',
    ),
    WordPair(
      word1: 'Feed',
      word2: 'Feet',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Feed',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Feet',
      category: 'Tricky Pairs',
      mouthHint1: 'D - feed the dog!',
      mouthHint2: 'T - walk on feet!',
    ),

    // Final Consonants (G vs K)
    WordPair(
      word1: 'Bag',
      word2: 'Back',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Bag',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Back',
      category: 'Tricky Pairs',
      mouthHint1: 'G - heavy bag!',
      mouthHint2: 'K - my back!',
    ),
    WordPair(
      word1: 'Dog',
      word2: 'Dock',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Dog',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Dock',
      category: 'Tricky Pairs',
      mouthHint1: 'G - woof woof!',
      mouthHint2: 'K - boat dock!',
    ),
    WordPair(
      word1: 'Log',
      word2: 'Lock',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Log',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Lock',
      category: 'Tricky Pairs',
      mouthHint1: 'G - wood log!',
      mouthHint2: 'K - key lock!',
    ),
    
    // Initial Th (Voiced vs Unvoiced)
    WordPair(
      word1: 'The',
      word2: 'Three',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=The',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Three',
      category: 'Tricky Pairs',
      mouthHint1: 'Voiced - buzzing!',
      mouthHint2: 'Unvoiced - blowing!',
    ),
    WordPair(
      word1: 'They',
      word2: 'Thumb',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=They',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Thumb',
      category: 'Tricky Pairs',
      mouthHint1: 'Voiced - they play!',
      mouthHint2: 'Unvoiced - thumb up!',
    ),
    
    // V vs W (More practice)
    WordPair(
      word1: 'Vine',
      word2: 'Wine',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Vine',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Wine',
      category: 'Tricky Pairs',
      mouthHint1: 'V - grape vine!',
      mouthHint2: 'W - red wine!',
    ),
    WordPair(
      word1: 'Veil',
      word2: 'Whale',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Veil',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Whale',
      category: 'Tricky Pairs',
      mouthHint1: 'V - bride\'s veil!',
      mouthHint2: 'W - big whale!',
    ),
    
    // Y vs J
    WordPair(
      word1: 'Yet',
      word2: 'Jet',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Yet',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Jet',
      category: 'Tricky Pairs',
      mouthHint1: 'Y - not yet!',
      mouthHint2: 'J - fly jet!',
    ),
    WordPair(
      word1: 'Yale',
      word2: 'Jail',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Yale',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Jail',
      category: 'Tricky Pairs',
      mouthHint1: 'Y - university!',
      mouthHint2: 'J - locked up!',
    ),
    
    // H vs (Nothing)
    WordPair(
      word1: 'Hat',
      word2: 'At',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Hat',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=At',
      category: 'Tricky Pairs',
      mouthHint1: 'H - breath out!',
      mouthHint2: 'No H - just vowel!',
    ),
    WordPair(
      word1: 'Heat',
      word2: 'Eat',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Heat',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Eat',
      category: 'Tricky Pairs',
      mouthHint1: 'H - hot heat!',
      mouthHint2: 'No H - eat food!',
    ),
    WordPair(
      word1: 'Hold',
      word2: 'Old',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Hold',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Old',
      category: 'Tricky Pairs',
      mouthHint1: 'H - hold hands!',
      mouthHint2: 'No H - old man!',
    ),
    WordPair(
      word1: 'Hair',
      word2: 'Air',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Hair',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Air',
      category: 'Tricky Pairs',
      mouthHint1: 'H - long hair!',
      mouthHint2: 'No H - fresh air!',
    ),

    // R vs W (Elmer Fudd sound)
    WordPair(
      word1: 'Run',
      word2: 'Won',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Run',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Won',
      category: 'Tricky Pairs',
      mouthHint1: 'R - curl tongue!',
      mouthHint2: 'W - round lips!',
    ),
    WordPair(
      word1: 'Red',
      word2: 'Wed',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Red',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Wed',
      category: 'Tricky Pairs',
      mouthHint1: 'R - red color!',
      mouthHint2: 'W - wedding!',
    ),
    WordPair(
      word1: 'Ring',
      word2: 'Wing',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Ring',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Wing',
      category: 'Tricky Pairs',
      mouthHint1: 'R - wear a ring!',
      mouthHint2: 'W - bird wing!',
    ),
    WordPair(
      word1: 'Ride',
      word2: 'Wide',
      imageUrl1: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Ride',
      imageUrl2: 'https://placehold.co/400x400/2196f3/ffffff.png?text=Wide',
      category: 'Tricky Pairs',
      mouthHint1: 'R - ride bike!',
      mouthHint2: 'W - wide open!',
    ),
  ];

  /// Get all pairs (static + dynamically generated)
  static List<WordPair> get allPairs => [..._staticPairs, ..._dynamicPairs];

  /// Add AI-generated pairs to the dynamic list
  static void addGeneratedPairs(List<WordPair> pairs) {
    _dynamicPairs.addAll(pairs);
  }

  /// Get pairs filtered by category
  static List<WordPair> getPairsByCategory(String category) {
    return allPairs.where((pair) => pair.category == category).toList();
  }

  /// Get all categories
  static List<String> get categories {
    return allPairs.map((pair) => pair.category).toSet().toList();
  }

  /// Get random pairs from a category
  static List<WordPair> getRandomPairs(String category, int count) {
    final categoryPairs = getPairsByCategory(category);
    categoryPairs.shuffle();
    return categoryPairs.take(count).toList();
  }
  
  /// Get count of dynamic (AI-generated) pairs for a category
  static int getDynamicPairsCount(String category) {
    return _dynamicPairs.where((pair) => pair.category == category).length;
  }
}
