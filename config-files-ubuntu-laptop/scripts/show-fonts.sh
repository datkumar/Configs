#!/bin/bash

echo "--------------------------------------------------------"
echo "Terminal Font and Attribute Test Script"
echo "--------------------------------------------------------"

echo -e "\n--- Basic Text Attributes ---"
echo "These use standard ANSI escape codes. Support may vary."
echo "--------------------------------------------------------"
echo -e "Normal Text"
echo -e "\e[1mBold Text\e[0m"
echo -e "\e[2mDim/Faint Text (often looks like Normal)\e[0m"
echo -e "\e[3mItalic Text (may not be supported by all terminals/fonts)\e[0m"
echo -e "\e[4mUnderlined Text\e[0m"
echo -e "\e[5mBlinking Text (rarely supported, often ignored or bold)\e[0m"
echo -e "\e[7mReverse Video (swaps foreground and background colors)\e[0m"
echo -e "\e[8mConcealed/Hidden Text (text is present but invisible)\e[0m"
echo -e "\e[9mStrikethrough Text (may not be supported by all terminals/fonts)\e[0m"
echo -e "\e[21mDouble Underline (less common than single)\e[0m"
echo -e "\e[22mNormal Intensity (resets Bold/Dim)\e[0m"
echo -e "\e[23mNot Italic/Not Fraktur\e[0m"
echo -e "\e[24mNot Underlined\e[0m"
echo -e "\e[25mNot Blinking\e[0m"
echo -e "\e[27mNot Reverse Video\e[0m"
echo -e "\e[28mNot Concealed\e[0m"
echo -e "\e[29mNot Strikethrough\e[0m"
echo -e "\e[0m" # Reset all attributes

echo -e "\n--- Unicode Character Sets ---"
echo "Check if your font supports these common symbols."
echo "--------------------------------------------------------"

echo -e "\n--- Box Drawing Characters (for borders, tmux, htop) ---"
echo "┌─┬─┐"
echo "│ │ │"
echo "├─┼─┤"
echo "│ │ │"
echo "└─┴─┘"

echo -e "\n--- Block Elements (for progress bars, indicators) ---"
echo "Full Block: █"
echo "Light Shade: ░"
echo "Medium Shade: ▒"
echo "Dark Shade: ▓"
echo "Top Half: ▀"
echo "Bottom Half: ▄"
echo "Left Half: ▌"
echo "Right Half: ▐"

echo -e "\n--- Powerline Symbols (requires a patched font like Nerd Font) ---"
echo "These often appear as squares or missing glyphs if your font isn't patched."
echo "⚡"
echo "These are common ones:"
echo "Right Arrow (filled): "
echo "Left Arrow (filled): "
echo "Right Arrow (thin): "
echo "Left Arrow (thin): "
echo "Branch: "
echo "Lock: "
echo "Folder: " # Note: often the same as lock icon in many fonts

echo -e "\n--- Common Symbols and Dingbats ---"
echo "✓ Checkmark"
echo "✗ Ballot X"
echo "⌘ Command (Mac)"
echo "⌥ Option (Mac)"
echo "⇧ Shift"
echo "⌃ Control"
echo "▶ Play"
echo "⏸ Pause"
echo "⏹ Stop"
echo "⚙ Gear/Cog"
echo "✨ Sparkles"
echo "⭐ Star"
echo "❤️ Heart"
echo "⬆ Up Arrow"
echo "⬇ Down Arrow"
echo "⬅ Left Arrow"
echo "⮕ Right Arrow"
echo "ℹ Information"

echo -e "\n--- Mathematical Symbols ---"
echo "π Pi"
echo "∑ Summation"
echo "√ Square Root"
echo "≠ Not Equal To"
echo "≈ Approximately Equal To"
echo "∞ Infinity"
echo "∫ Integral"
echo "∀ For All"
echo "∃ There Exists"
echo "⊆ Subset Of"
echo "∈ Element Of"
echo "α β γ δ ε ζ η θ ι κ λ μ ν ξ ο π ρ ς σ τ υ φ χ ψ ω"

echo -e "\n--- Emoji (requires a font with color emoji support) ---"
echo "😀😃😄😁😆😅😂🤣🥲😊😇🙂🙃😉😌"
echo "😋😛😜🤪🤨🧐🤓😎🥸🤩🥳😏😒😞😔"
echo "🌑🌒🌓🌔🌕🌖🌗🌘" # Moon phases
echo "🖥️💻🖱️⌨️💾💽💿📀" # Computer related
echo "🚀🛸🌌🌠🌟✨💫" # Space related

echo -e "\n--- Ligatures (requires terminal/font support, e.g., Fira Code) ---"
echo "If your font supports ligatures, '->' might combine to an arrow."
echo "=> --> === ===> <=> <> != !== := => -> "
echo "(Look closely at '->' and '=>' in particular)"

echo -e "\n--------------------------------------------------------"
echo "End of Font Test. Look for any missing characters (squares/boxes) or"
echo "incorrectly rendered attributes."
echo "--------------------------------------------------------"
echo -e "\e[0m" # Final reset
