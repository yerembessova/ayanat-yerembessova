# Lab 5 — Encoding forensics

Name: Ayanat · Date: 10/11/2026 · Tools: Ubuntu guest but I connected it to PowerShell to make it easier for me to paste commands.

## What I received
Excel

| ID | Фамилия | Имя | Отдел | Должность | Город |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 101 | Әбдірахманова | Аружан | Бухгалтерия | Главный бухгалтер | Алматы |

<how it looked in Excel, LibreOffice and the terminal — one line each>

## Diagnosis (made before the fix)
- file said: <…>  (evidence/file-before.txt)
- First 16 bytes: <hex>  (evidence/hexdump-before.txt)
- Encoding: <exact name> — because <bytes>
- Line ending: <CRLF / LF> — because <bytes>
- BOM: <yes / no> — because <bytes>; in the fixed file I <kept / removed / added> it because <reason>

## Fix
<the command or scripts/fix.sh, in a code block>

## Verification
<file-after.txt summary; the screenshot evidence/opens-correctly.png>

## What did not work the first time
<at least one real thing>
