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
      imageUrl1: 'https://images.unsplash.com/photo-1534224039826-c7a0eda0e6b3?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1484557985045-edf25e08da73?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "i" - smile a little!',
      mouthHint2: 'Long "ee" - big smile!',
    ),
    WordPair(
      word1: 'Sit',
      word2: 'Seat',
      imageUrl1: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1503602642458-232111445657?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "i" - quick sound!',
      mouthHint2: 'Long "ee" - stretch it!',
    ),
    WordPair(
      word1: 'Bit',
      word2: 'Beat',
      imageUrl1: 'https://images.unsplash.com/photo-1558642452-9d2a7deb7f62?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "i" sound',
      mouthHint2: 'Long "ee" sound',
    ),
    WordPair(
      word1: 'Lip',
      word2: 'Leap',
      imageUrl1: 'https://images.unsplash.com/photo-1601412436009-d964bd02edbc?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1552674605-db6ffd4facb5?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "i" - quick!',
      mouthHint2: 'Long "ee" - jump high!',
    ),
    WordPair(
      word1: 'Fill',
      word2: 'Feel',
      imageUrl1: 'https://images.unsplash.com/photo-1563453392212-326f5e854473?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1474631245212-32dc3c8310c6?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "i" - fill it up!',
      mouthHint2: 'Long "ee" - how do you feel?',
    ),
    
    // Short a vs Long a
    WordPair(
      word1: 'Hat',
      word2: 'Hate',
      imageUrl1: 'https://images.unsplash.com/photo-1521369909029-2afed882baee?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1594797782697-7c1d5f1cf0fb?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "a" - open wide!',
      mouthHint2: 'Long "a" - say the letter A!',
    ),
    WordPair(
      word1: 'Tap',
      word2: 'Tape',
      imageUrl1: 'https://images.unsplash.com/photo-1578873375969-d60aad647bb9?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "a" - tap tap!',
      mouthHint2: 'Long "a" - sticky tape!',
    ),
    WordPair(
      word1: 'Rat',
      word2: 'Rate',
      imageUrl1: 'https://images.unsplash.com/photo-1425082661705-1834bfd09dca?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "a" - quick sound!',
      mouthHint2: 'Long "a" - stretch it out!',
    ),
    WordPair(
      word1: 'Can',
      word2: 'Cane',
      imageUrl1: 'https://images.unsplash.com/photo-1527156231393-7023794f363c?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1513884923967-4b182ef167ab?w=400&h=400&fit=crop',
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
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1561361513-2d000a50f0dc?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'F - top teeth touch bottom lip',
      mouthHint2: 'V - teeth touch lip with buzzing',
    ),
    WordPair(
      word1: 'Fine',
      word2: 'Vine',
      imageUrl1: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1516594798947-e65505dbb29d?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'F - soft air sound',
      mouthHint2: 'V - buzzy sound',
    ),
    WordPair(
      word1: 'Fast',
      word2: 'Vast',
      imageUrl1: 'https://images.unsplash.com/photo-1553284965-83fd3e82fa5a?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'F - quiet air!',
      mouthHint2: 'V - voice buzzes!',
    ),
    
    // P vs B
    WordPair(
      word1: 'Pat',
      word2: 'Bat',
      imageUrl1: 'https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1594142428932-beb1fcf7ad5c?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'P - pop your lips!',
      mouthHint2: 'B - buzz your lips!',
    ),
    WordPair(
      word1: 'Pig',
      word2: 'Big',
      imageUrl1: 'https://images.unsplash.com/photo-1516467508483-a7212febe31a?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1509391366360-2e959784a276?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'P - puff of air!',
      mouthHint2: 'B - voice on!',
    ),
    WordPair(
      word1: 'Pear',
      word2: 'Bear',
      imageUrl1: 'https://images.unsplash.com/photo-1514756331096-242fdeb70d4a?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1530595467537-0b5996c41f2d?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'P - quiet pop!',
      mouthHint2: 'B - loud buzz!',
    ),
    
    // T vs D
    WordPair(
      word1: 'Tip',
      word2: 'Dip',
      imageUrl1: 'https://images.unsplash.com/photo-1582719188393-bb71ca45dbb9?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'T - tap your tongue!',
      mouthHint2: 'D - voice with tongue!',
    ),
    WordPair(
      word1: 'Two',
      word2: 'Do',
      imageUrl1: 'https://images.unsplash.com/photo-1517466787929-bc90951d0974?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1435224668334-0f82ec57b605?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'T - sharp sound!',
      mouthHint2: 'D - softer sound!',
    ),
    WordPair(
      word1: 'Ten',
      word2: 'Den',
      imageUrl1: 'https://images.unsplash.com/photo-1509228468518-180dd4864904?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'T - count to ten!',
      mouthHint2: 'D - lion\'s den!',
    ),
    
    // S vs Z
    WordPair(
      word1: 'Sue',
      word2: 'Zoo',
      imageUrl1: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1534567153574-2b12153a87f0?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'S - snake sound!',
      mouthHint2: 'Z - bee buzz!',
    ),
    WordPair(
      word1: 'Sip',
      word2: 'Zip',
      imageUrl1: 'https://images.unsplash.com/photo-1544787219-7f47ccb76574?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558171813-4c088753af8f?w=400&h=400&fit=crop',
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
      imageUrl1: 'https://images.unsplash.com/photo-1594142428932-beb1fcf7ad5c?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'A - open mouth wide!',
      mouthHint2: 'E - smaller mouth',
    ),
    WordPair(
      word1: 'Pen',
      word2: 'Pan',
      imageUrl1: 'https://images.unsplash.com/photo-1583485088034-697b5bc54ccd?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'E - mouth slightly open',
      mouthHint2: 'A - open mouth wide',
    ),
    WordPair(
      word1: 'Bad',
      word2: 'Bed',
      imageUrl1: 'https://images.unsplash.com/photo-1608848461950-0fe51dfc41cb?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'A - open wide like yawning!',
      mouthHint2: 'E - smile a little!',
    ),
    WordPair(
      word1: 'Man',
      word2: 'Men',
      imageUrl1: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'A - one man!',
      mouthHint2: 'E - many men!',
    ),
    
    // A vs U
    WordPair(
      word1: 'Cap',
      word2: 'Cup',
      imageUrl1: 'https://images.unsplash.com/photo-1588850561407-ed78c282e89b?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'A - wide mouth',
      mouthHint2: 'U - round lips',
    ),
    WordPair(
      word1: 'Cat',
      word2: 'Cut',
      imageUrl1: 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'A - meow with wide mouth!',
      mouthHint2: 'U - uh sound!',
    ),
    WordPair(
      word1: 'Ran',
      word2: 'Run',
      imageUrl1: 'https://images.unsplash.com/photo-1552674605-db6ffd4facb5?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1571008887538-b36bb32f4571?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'A - I ran fast!',
      mouthHint2: 'U - let\'s run!',
    ),
    
    // I vs E
    WordPair(
      word1: 'Pin',
      word2: 'Pen',
      imageUrl1: 'https://images.unsplash.com/photo-1589191858840-1ed62d1c9b1c?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1583485088034-697b5bc54ccd?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'I - smile tight!',
      mouthHint2: 'E - relax mouth!',
    ),
    WordPair(
      word1: 'Tin',
      word2: 'Ten',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1509228468518-180dd4864904?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'I - tin can!',
      mouthHint2: 'E - count to ten!',
    ),
    WordPair(
      word1: 'Sit',
      word2: 'Set',
      imageUrl1: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400&h=400&fit=crop',
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
      imageUrl1: 'https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "o" - hop hop!',
      mouthHint2: 'Long "o" - say OH!',
    ),
    WordPair(
      word1: 'Not',
      word2: 'Note',
      imageUrl1: 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1455390582262-044cdead277a?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "o" - quick!',
      mouthHint2: 'Long "o" - musical note!',
    ),
    WordPair(
      word1: 'Dot',
      word2: 'Dote',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1516594798947-e65505dbb29d?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "o" - small dot!',
      mouthHint2: 'Long "o" - stretch it!',
    ),
    WordPair(
      word1: 'Cop',
      word2: 'Cope',
      imageUrl1: 'https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "o" sound',
      mouthHint2: 'Long "o" - you can cope!',
    ),
    
    // Short u vs Long u
    WordPair(
      word1: 'Cub',
      word2: 'Cube',
      imageUrl1: 'https://images.unsplash.com/photo-1530595467537-0b5996c41f2d?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "u" - baby bear!',
      mouthHint2: 'Long "u" - say YOU!',
    ),
    WordPair(
      word1: 'Tub',
      word2: 'Tube',
      imageUrl1: 'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "u" - bath tub!',
      mouthHint2: 'Long "u" - long tube!',
    ),
    WordPair(
      word1: 'Cut',
      word2: 'Cute',
      imageUrl1: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "u" - cut it!',
      mouthHint2: 'Long "u" - so cute!',
    ),
    
    // More short i vs long ee
    WordPair(
      word1: 'Chip',
      word2: 'Cheap',
      imageUrl1: 'https://images.unsplash.com/photo-1566478989037-eec170784d0b?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "i" - potato chip!',
      mouthHint2: 'Long "ee" - not expensive!',
    ),
    WordPair(
      word1: 'Slip',
      word2: 'Sleep',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1541781774459-bb2af2f05b55?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "i" - don\'t slip!',
      mouthHint2: 'Long "ee" - time to sleep!',
    ),
    WordPair(
      word1: 'Grin',
      word2: 'Green',
      imageUrl1: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "i" - big grin!',
      mouthHint2: 'Long "ee" - green color!',
    ),
    
    // More short a vs long a
    WordPair(
      word1: 'Mad',
      word2: 'Made',
      imageUrl1: 'https://images.unsplash.com/photo-1608848461950-0fe51dfc41cb?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "a" - angry!',
      mouthHint2: 'Long "a" - I made it!',
    ),
    WordPair(
      word1: 'Plan',
      word2: 'Plane',
      imageUrl1: 'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?w=400&h=400&fit=crop',
      category: 'Vowel Fun',
      mouthHint1: 'Short "a" - make a plan!',
      mouthHint2: 'Long "a" - airplane!',
    ),
    WordPair(
      word1: 'Gap',
      word2: 'Gape',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop',
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
      imageUrl1: 'https://images.unsplash.com/photo-1588850561407-ed78c282e89b?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'K - quiet sound!',
      mouthHint2: 'G - voice on!',
    ),
    WordPair(
      word1: 'Came',
      word2: 'Game',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'K - I came here!',
      mouthHint2: 'G - let\'s play a game!',
    ),
    WordPair(
      word1: 'Cold',
      word2: 'Gold',
      imageUrl1: 'https://images.unsplash.com/photo-1483664852095-d6cc6870702d?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1610375461246-83df859d849d?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'K - brrr cold!',
      mouthHint2: 'G - shiny gold!',
    ),
    
    // L vs R
    WordPair(
      word1: 'Light',
      word2: 'Right',
      imageUrl1: 'https://images.unsplash.com/photo-1513506003901-1e6a229e2d15?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'L - tongue touches top!',
      mouthHint2: 'R - tongue curls back!',
    ),
    WordPair(
      word1: 'Lap',
      word2: 'Rap',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'L - sit on my lap!',
      mouthHint2: 'R - rap music!',
    ),
    WordPair(
      word1: 'Lock',
      word2: 'Rock',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1501594907352-04cda38ebc29?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'L - lock the door!',
      mouthHint2: 'R - big rock!',
    ),
    
    // M vs N
    WordPair(
      word1: 'Mat',
      word2: 'Nat',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'M - lips together!',
      mouthHint2: 'N - tongue touches top!',
    ),
    WordPair(
      word1: 'Map',
      word2: 'Nap',
      imageUrl1: 'https://images.unsplash.com/photo-1524661135-423995f22d0b?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1541781774459-bb2af2f05b55?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'M - look at the map!',
      mouthHint2: 'N - take a nap!',
    ),
    
    // W vs V
    WordPair(
      word1: 'Wet',
      word2: 'Vet',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1516467508483-a7212febe31a?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'W - round your lips!',
      mouthHint2: 'V - teeth touch lip!',
    ),
    WordPair(
      word1: 'West',
      word2: 'Vest',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'W - go west!',
      mouthHint2: 'V - wear a vest!',
    ),
    
    // SH vs CH
    WordPair(
      word1: 'Ship',
      word2: 'Chip',
      imageUrl1: 'https://images.unsplash.com/photo-1534224039826-c7a0eda0e6b3?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1566478989037-eec170784d0b?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'SH - shhhh sound!',
      mouthHint2: 'CH - ch ch sound!',
    ),
    WordPair(
      word1: 'Shop',
      word2: 'Chop',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'SH - go shopping!',
      mouthHint2: 'CH - chop the food!',
    ),
    
    // TH vs F
    WordPair(
      word1: 'Thin',
      word2: 'Fin',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1535591273668-578e31182c4f?w=400&h=400&fit=crop',
      category: 'Letter Sounds',
      mouthHint1: 'TH - tongue between teeth!',
      mouthHint2: 'F - teeth touch lip!',
    ),
    WordPair(
      word1: 'Think',
      word2: 'Fink',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
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
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'O - it\'s hot!',
      mouthHint2: 'U - small hut!',
    ),
    WordPair(
      word1: 'Cop',
      word2: 'Cup',
      imageUrl1: 'https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'O - police officer!',
      mouthHint2: 'U - drink from cup!',
    ),
    WordPair(
      word1: 'Dot',
      word2: 'Dut',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'O - small dot!',
      mouthHint2: 'U - uh sound!',
    ),
    
    // Short vs Long vowels mixed
    WordPair(
      word1: 'Rid',
      word2: 'Read',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'I - get rid of it!',
      mouthHint2: 'EE - read a book!',
    ),
    WordPair(
      word1: 'Hid',
      word2: 'Head',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'I - I hid it!',
      mouthHint2: 'E - my head!',
    ),
    WordPair(
      word1: 'Bit',
      word2: 'Bet',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'I - little bit!',
      mouthHint2: 'E - I bet you can!',
    ),
    
    // Consonant endings
    WordPair(
      word1: 'Back',
      word2: 'Bag',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'K - sharp ending!',
      mouthHint2: 'G - soft ending!',
    ),
    WordPair(
      word1: 'Sack',
      word2: 'Sad',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1608848461950-0fe51dfc41cb?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'K - big sack!',
      mouthHint2: 'D - feeling sad!',
    ),
    WordPair(
      word1: 'Rip',
      word2: 'Rib',
      imageUrl1: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'P - rip the paper!',
      mouthHint2: 'B - your rib bone!',
    ),
    
    // Double letters
    WordPair(
      word1: 'Hop',
      word2: 'Hopp',
      imageUrl1: 'https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'Single P - hop once!',
      mouthHint2: 'Double P - hop hop!',
    ),
    WordPair(
      word1: 'Tap',
      word2: 'Tapp',
      imageUrl1: 'https://images.unsplash.com/photo-1578873375969-d60aad647bb9?w=400&h=400&fit=crop',
      imageUrl2: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      category: 'Tricky Pairs',
      mouthHint1: 'Single P - one tap!',
      mouthHint2: 'Double P - tap tap!',
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
