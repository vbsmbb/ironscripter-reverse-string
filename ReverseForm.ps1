[CmdletBinding()]
param ()

# Bring the required assembly into the session
Add-Type -AssemblyName PresentationFramework

# Make sure the word reverse function and the encode string is in the session
foreach ($file in Get-ChildItem -Path .\Functions -Filter "*.ps1") {
    . $file.FullName
}

# Text encoded flag
$global:txtEnc = $false

# Create the window
$mw = New-Object System.Windows.Window
$mw.Height = 300
$mw.Width = 500
$mw.WindowStartupLocation = 'CenterScreen'
$mw.title = "Reverse String"

# Create a grid container with three rows
#   1. Row one for the Label
#   2. Row two for the TextBox
#   3. Row three for the buttons
$grid = New-Object System.Windows.Controls.Grid
$row1 = New-Object System.Windows.Controls.RowDefinition
$row2 = New-Object System.Windows.Controls.RowDefinition
$row3 = New-Object System.Windows.Controls.RowDefinition
$row1.Height = "50"
$row2.Height = "50"
$row3.Height = "70"
$grid.RowDefinitions.Add($row1)
$grid.RowDefinitions.Add($row2)
$grid.RowDefinitions.Add($row3)

# Create a label
$label1 = New-Object System.Windows.Controls.Label
$label1.HorizontalAlignment = "Left"
$label1.VerticalAlignment = "Top"
$label1.Content = "Word or Sentence to Reverse"
$label1.FontWeight = "Bold"
$label1.Margin = "10,10,10,0"
$label1.FontFamily = "Arial"
$label1.FontSize = "16"

# Create a text box
$textBox = New-Object System.Windows.Controls.TextBox
$textBox.HorizontalAlignment = "Left"
$textBox.VerticalAlignment = "Top"
$textBox.Height = "30"
$textBox.Width = "300"
$textBox.MaxWidth = "450"
$textBox.MaxLines = "1"
$textBox.MaxLength = "100"
$textBox.Margin = "10,0,10,10"
$textBox.BorderThickness = 3
$textBox.SetValue([System.Windows.Controls.Grid]::RowProperty, 1)

# Add a reverse string button
$reverse = New-Object System.Windows.Controls.Button
$reverse.Content = "Reverse"
$reverse.Width = "75"
$reverse.Height = "50"
$reverse.HorizontalAlignment = "Left"
$reverse.VerticalAlignment = "Top"
$reverse.Margin = "10,0,10,10"
$reverse.SetValue([System.Windows.Controls.Grid]::RowProperty, 2)

# Add an encode button
$encode = New-Object System.Windows.Controls.Button
$encode.Content = "Encode"
$encode.Width = "75"
$encode.Height = "50"
$encode.HorizontalAlignment = "Left"
$encode.VerticalAlignment = "Top"
$encode.Margin = "95,0,10,10"
$encode.SetValue([System.Windows.Controls.Grid]::RowProperty,2)

# Add a decode button
$decode =New-Object System.Windows.Controls.Button
$decode.Content = "Decode"
$decode.Width = "75"
$decode.Height = "50"
$decode.HorizontalAlignment = "left"
$decode.VerticalAlignMent = "Top"
$decode.Margin = "180,0,10,10"
$decode.SetValue([System.Windows.Controls.Grid]::RowProperty,2)

# Add a Close Button
$quit = New-Object System.Windows.Controls.Button
$quit.Content = "Exit"
$quit.Width = 75
$quit.Height = 50
$quit.HorizontalAlignment = "Left"
$quit.VerticalAlignment = "Top"
$quit.Margin = "265,0,10,10"
$quit.SetValue([System.Windows.Controls.Grid]::RowProperty, 2)

# Add event action for the REVERSE button
$reverse.Add_Click({
    if ($global:txtEnc) {
        $revStr = Get-WordReverse -Word $textBox.Text -TypeHex
    } else {
        $revStr = $textBox.Text | Get-WordReverse
    }
    $textBox.Text = $revStr
})

# Add event for the encode button
$encode.Add_Click({
    $encStr = $textBox.Text | ConvertTo-HexString
    $textBox.Text = $encStr
    $global:txtEnc = $true
})

$decode.Add_Click({
    $decStr = $textBox.Text | ConvertFrom-HexString
    $textBox.Text = $decStr
    $global:txtEnc = $false
})

# Add event action for the EXIT button
$quit.add_click( {
    Write-Host "$(Get-Date) [QUIT] Closing the form" -ForegroundColor Green
    $mw.close()
})

# Place the objects in the grid
$grid.AddChild($label1)
$grid.AddChild($textBox)
$grid.AddChild($reverse)
$grid.AddChild($encode)
$grid.AddChild($decode)
$grid.AddChild($quit)
$mw.Content = $grid

# Display and execute the form
[void]$mw.ShowDialog()
