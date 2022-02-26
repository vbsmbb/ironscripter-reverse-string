function ConvertFrom-HexString {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true,
                   Position=0,
                   ValueFromPipeline)]
        [string]$HexStr
    )

    Begin {
        $enc = [System.Text.Encoding]::UTF8
    }

    Process {
        Write-Verbose "Hex string: $HexStr"
        $hexArr = @()
        for ($i=0; $i -lt $HexStr.Length; $i+=2) {
            Write-Verbose "Hex: $($HexStr.Substring($i,2))"
            $hexArr += $HexStr.Substring($i,2)
        }
        $str = $hexArr | ForEach-Object {[char][byte]"0x$_"}
        $str = $str -join ""
        Write-Output $str
    }

    End {}
}
