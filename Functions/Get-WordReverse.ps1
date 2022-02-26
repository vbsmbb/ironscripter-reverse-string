function Get-WordReverse {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true,
                   ValueFromPipeline=$true,
                   Position=0)]
        [string]$Word,
        [Parameter(Position=1)]
        [switch]$TypeHex
    )

    Begin {
        $charArr = 'a','b','c','d','e','A','B','C','D','E'
    }

    Process {
        if (!$TypeHex) {
            $revStr = ([regex]::Matches($Word,'.','RightToLeft') | ForEach-Object {$_.value}) -join ''
        } else {
            $hexArr = @()
            for ($i=$Word.Length-2; $i -ge 0; $i-=2) {
                $hexArr += $Word.Substring($i,2)
            }
            $revStr = $hexArr -join ""
        }
        Write-Output $revStr
    }

    End {}
}
