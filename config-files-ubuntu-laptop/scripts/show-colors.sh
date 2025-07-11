#!/bin/env bash

echo "Showing the 256-color palette (colour0 - colour255)"
echo "----------------------------------------------------"
echo "Category: Standard 16 ANSI Colors (colour0 - colour15)"
echo "----------------------------------------------------"

# ANSI Basic 8
for i in {0..7}; do
    printf "\e[38;5;%sm colour%-3s \e[48;5;%sm   \e[0m    " "$i" "$i" "$i"
    if (( (i + 1) % 8 == 0 )); then
        echo -e "\e[0m"
    fi
done
echo -e "\e[0m"

# ANSI Bright 8
for i in {8..15}; do
    printf "\e[38;5;%sm colour%-3s \e[48;5;%sm   \e[0m    " "$i" "$i" "$i"
    if (( (i + 1) % 8 == 0 )); then
        echo -e "\e[0m"
    fi
done
echo -e "\e[0m"




echo -e "\nCategory: 6x6x6 Color Cube (colour16 - colour231)"
echo "----------------------------------------------------"
echo "Starts from colour16 and goes up to colour231."
echo "This cube has 6 levels for Red, Green, and Blue components (0, 95, 135, 175, 215, 255)."
echo "Arranged in a grid to show hue progression:"
echo -e "\e[0m"

# Loop through the 6x6x6 cube
# The outer loops manage the R and G components, the inner loop the B component
start_index=16 # Starting index for the 6x6x6 cube

for r_level in {0..5}; do # Red level
    for g_level in {0..5}; do # Green level
        for b_level in {0..5}; do # Blue level
            current_index=$(( start_index + (r_level * 36) + (g_level * 6) + b_level ))
            printf "\e[38;5;%sm colour%-3s \e[48;5;%sm   \e[0m" "$current_index" "$current_index" "$current_index"
        done
        echo -e "\e[0m" # New line after each group of 6 Blue variations (i.e., after each G level)
    done
    echo -e "\e[0m" # Extra new line after each block of 6x6 (i.e., after each R level) for visual separation
done

echo -e "\e[0m" # Final reset

echo -e "\nCategory: Grayscale Ramp (colour232 - colour255)"
echo "----------------------------------------------------"
echo "Starts from colour232 (near black) and goes up to colour255 (near white)."
echo "There are 24 shades of gray."
echo -e "\e[0m"

for i in {232..255}; do
    printf "\e[38;5;%sm colour%-3s \e[48;5;%sm   \e[0m" "$i" "$i" "$i"
    if (( (i - 231) % 6 == 0 )); then # Print 6 colors per line for grayscale
        echo -e "\e[0m"
    fi
done
echo -e "\e[0m"

echo
echo "----------------------------------------------------"
echo "Standard 8 Colors (Normal/Dim - often called 'black', 'red', etc. in configs):"
# Foreground: 30-37, Background: 40-47
# tmux names: black, red, green, yellow, blue, magenta, cyan, white
# Note: The exact appearance can vary by terminal theme.
# 'white' (37) is often a light gray.
# 'yellow' (33) is often an ochre/orange-ish yellow.

echo -e "\e[30m Black   \e[40m     \e[0m (FG 30, BG 40)"
echo -e "\e[31m Red     \e[41m     \e[0m (FG 31, BG 41)"
echo -e "\e[32m Green   \e[42m     \e[0m (FG 32, BG 42)"
echo -e "\e[33m Yellow  \e[43m     \e[0m (FG 33, BG 43)"
echo -e "\e[34m Blue    \e[44m     \e[0m (FG 34, BG 44)"
echo -e "\e[35m Magenta \e[45m     \e[0m (FG 35, BG 45)"
echo -e "\e[36m Cyan    \e[46m     \e[0m (FG 36, BG 46)"
echo -e "\e[37m White   \e[47m     \e[0m (FG 37, BG 47)"
echo -e "\e[0m" # Reset colors

echo "Bright 8 Colors (often called 'brightblack', 'brightred', etc. in configs):"
# Foreground: 90-97, Background: 100-107
# tmux names: brightblack, brightred, brightgreen, brightyellow, brightblue, brightmagenta, brightcyan, brightwhite
# Note: 'brightblack' (90) is often a darker gray.
# These are typically achieved by using the 'bold' attribute (1;) with the first 8 colors,
# or by using their specific "bright" codes (90-97 for FG, 100-107 for BG).

echo -e "\e[90m Br.Black\e[100m     \e[0m (FG 90, BG 100)"
echo -e "\e[91m Br.Red  \e[101m     \e[0m (FG 91, BG 101)"
echo -e "\e[92m Br.Green\e[102m     \e[0m (FG 92, BG 102)"
echo -e "\e[93m Br.Yellow\e[103m     \e[0m (FG 93, BG 103)"
echo -e "\e[94m Br.Blue \e[104m     \e[0m (FG 94, BG 104)"
echo -e "\e[95m Br.Mag. \e[105m     \e[0m (FG 95, BG 105)"
echo -e "\e[96m Br.Cyan \e[106m     \e[0m (FG 96, BG 106)"
echo -e "\e[97m Br.White\e[107m     \e[0m (FG 97, BG 107)"
echo -e "\e[0m" # Reset colors

echo "You can also get the bright colors by using the 'bold' attribute (1;) on the normal 8 colors:"
echo -e "\e[1;30m Bold Black\e[0m (often same as Br.Black)"
echo -e "\e[1;31m Bold Red\e[0m (often same as Br.Red)"
echo -e "\e[1;32m Bold Green\e[0m (often same as Br.Green)"
echo -e "\e[1;33m Bold Yellow\e[0m (often same as Br.Yellow)"
echo -e "\e[1;34m Bold Blue\e[0m (often same as Br.Blue)"
echo -e "\e[1;35m Bold Magenta\e[0m (often same as Br.Magenta)"
echo -e "\e[1;36m Bold Cyan\e[0m (often same as Br.Cyan)"
echo -e "\e[1;37m Bold White\e[0m (often same as Br.White)"
echo -e "\e[0m"
