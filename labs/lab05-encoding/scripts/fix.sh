#!/bin/sh
# Lab 5: convert staff-broken.csv from RK1048 to UTF-8
in=evidence/staff-broken.csv
out=evidence/staff-fixed.csv
iconv -f RK1048 -t UTF-8 "$in" > "$out"      # 1. encoding
# 2. line endings — keep ONE of these lines:
# sed -i 's/\r$//' "$out"                   # CRLF -> LF
# sed -i 's/$/\r/' "$out"                   # LF -> CRLF (only if the source was LF)
# 3. BOM — only if you decided to add one:
printf '\357\273\277' | cat - "$out" > tmp && mv tmp "$out"
