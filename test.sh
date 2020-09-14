#!/bin/bash
#set -x

REFERENCE=./reference
PGM=./assignment-2

# simple valid
BASE_SEQ1="AAAAAAAAAAAAAAAAAAAA"
TARGET_SEQ1="AAAAA"

# VALID but has invalid characters that need to be ignored
BASE_SEQ2="aAAAaAAAaAAAaAAAaAAaAAaAaAaAaAaaaa"
TARGET_SEQ2="AAAAA"

# BASE is invalid: too short
BASE_SEQ3="A"
TARGET_SEQ3="AAAAA"

BASE_SEQ4="AAAAAAAAAAAAAAAAAAA"
TARGET_SEQ4="AAAAA"

# base has invalid character
BASE_SEQ5="AAAAAAAAAAAAAAAAAAAB"
TARGET_SEQ5="AAAAA"

# match, full overlap
BASE_SEQ6="GGGGGGGGAAAAAGGGGGGG"
TARGET_SEQ6="AAAAA"

BASE_SEQ7="AAAAAGGGGGGGGGGGGGGG"
TARGET_SEQ7="AAAAA"

BASE_SEQ8="GGGGGGGGGGGGGGGAAAAA"
TARGET_SEQ8="AAAAA"

# no match
BASE_SEQ9="TTTTTTTTTTTTTTTTTTTT"
TARGET_SEQ9="AAAAA"

BASE_SEQ10="ACGTACGTACGTACGTACGT"
TARGET_SEQ10="AAAAA"

# target has invalid character, too short
BASE_SEQ11="ACGTACGTACGTACGTACGT"
TARGET_SEQ11="ACGTH"

# match, either full overlap or target as suffix
BASE_SEQ12="ACGTACGTACGTACGTACGT"
TARGET_SEQ12="ACGTA"

# match, target as suffix
BASE_SEQ13="ACGTACGTACGTACGTACGT"
TARGET_SEQ13="ACGTT"

# match, target as suffix
BASE_SEQ14="ACGTTGCAACGTTGCAACGT"
TARGET_SEQ14="CGTAA"

# no match
BASE_SEQ15="ACGTTGCAACGTTGCAACGT"
TARGET_SEQ15="GTCAA"

# match, full overlap, extra characters ignored
BASE_SEQ16="ACGTACGTACGTACGTACGG"
TARGET_SEQ16="TACGGG"

# target too short
BASE_SEQ17="AAAAAAAAAAAAAAAAAAAA"
TARGET_SEQ17="A"

BASE_SEQ18="AAAAAAAAAAAAAAAAAAAA"
TARGET_SEQ18="AAAAB"

BASE_SEQ19="AAAAAAAAAAAAAAAAAAAA"
TARGET_SEQ19="AaAaa"

# empty base
BASE_SEQ20=""
TARGET_SEQ20="AAAAA"

# empty target
BASE_SEQ21="AAAAAAAAAAAAAAAAAAAA"
TARGET_SEQ21=""

## bonus

# valid, target as prefix
BASE_BONUS1="ACGTTGCAACGTTGCAACGT"
TARGET_BONUS1="GGACG"

# valid, target as prefix with ignored characters
BASE_BONUS2="AAGTACGTACGTACGTACGT"
TARGET_BONUS2="TAAAGT"

# valid, target as prefix
BASE_BONUS3="ACGTACGTACGTACGTACGT"
TARGET_BONUS3="GACGT"

# invalid, threshold larger than match
BASE_BONUS4="ACGTTGCAACGTTGCATTGG"
TARGET_BONUS4="TTTAC"

# invalid, threshold larger than match after ignored characters
BASE_BONUS5="ACGTTGCAACGTTGCATTGG"
TARGET_BONUS5="TTTACG"

function run_test()
{
   base=$1
   target=$2
   
   echo "Testing with BASE Sequence: $base and TARGET: $target"
   solution="$(echo -e "${base}\n${target}" | $REFERENCE)"
   answer="$(echo -e "${base}\n${target}" | $PGM)"
   if [[ "$answer" == "$solution" ]]; then
      echo "PASS"
      echo "$solution"
      return 0
   fi
   echo "FAIL: your program poduced: '$answer' output should have been: '$solution'"
   return 1
}

total=0
correct=0

if run_test $BASE_SEQ1 $TARGET_SEQ1; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ2 $TARGET_SEQ2; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ3 $TARGET_SEQ3; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ4 $TARGET_SEQ4; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ5 $TARGET_SEQ5; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ6 $TARGET_SEQ6; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ7 $TARGET_SEQ7; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ8 $TARGET_SEQ8; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ9 $TARGET_SEQ9; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ10 $TARGET_SEQ10; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ11 $TARGET_SE11; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ12 $TARGET_SEQ12; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ13 $TARGET_SEQ13; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ14 $TARGET_SEQ14; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ15 $TARGET_SEQ15; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ16 $TARGET_SEQ16; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ17 $TARGET_SEQ17; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ18 $TARGET_SEQ18; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ19 $TARGET_SEQ19; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ20 $TARGET_SEQ20; then
  ((correct++))
fi
((total++))

if run_test $BASE_SEQ21 $TARGET_SEQ21; then
  ((correct++))
fi
((total++))

if run_test $BASE_BONUS1 $TARGET_BONUS1; then
  ((correct++))
fi

if run_test $BASE_BONUS2 $TARGET_BONUS2; then
  ((correct++))
fi

if run_test $BASE_BONUS3 $TARGET_BONUS3; then
  ((correct++))
fi

if run_test $BASE_BONUS4 $TARGET_BONUS4; then
  ((correct++))
fi

if run_test $BASE_BONUS5 $TARGET_BONUS5; then
  ((correct++))
fi

echo "score: ${correct}/${total}"
