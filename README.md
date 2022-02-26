# IronScripter Reverse String Challenge
This challenge was detailed in three parts:
1. Write PowerShell code to reverse a word string like 'PowerShell'
2. Write PowerShell code to reverse a sentence also reversing each word
3. Create a PowerShell script to display a WPF form
	* Have a place to eneter a word or sentence
	* Have buttons to reverse, encode and decode the entered value
	* Display the updated text in the form and save it to the clipboard
	* For bonus points, change case of the characters on the reverse

The work in this repository meets the requirements of the challenge except for the bonus points challenge. This PowerShell GUI application was created sith pure PowerShell using the Windows Presentation Foundation (WPF) and without using the XAML interface.

The script, ReverseForm.ps1, creates the WPF form with a text box and four buttons:
1. **Reverse** - Reverse the string in the textbox
2. **Decode** - Decodes the string in the text box
3. **Encode** - Encodes the string in the text box
4. **Exit** - Exits the script

It uses three functions to update the string and they are executed within the button's Add-Click events. The functions are:
1. **Get-WordReverse**: called by *REVERSE* button
2. **ConvertTo-HexString**: called by *ENCODE* button
3. **ConvertFrom-HexString**: called by *DECODE*
