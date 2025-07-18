#!/bin/sh

# Gruvbox colors
BLANK='#28282800'           # Transparent background
CLEAR='#28282888'           # Semi-transparent
DEFAULT='#b16286cc'         # Ring color (Purple)
TEXT='#ebdbb2ff'            # Light text
WRONG='#cc241dcc'           # Red
VERIFYING='#98971acc'       # Green

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--screen 1                   \
--blur 5                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %Y-%m-%d"    \
--keylayout 1

