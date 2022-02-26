function ConvertTo-HexString {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true,
                   Position=0,
                   ValueFromPipeline)]
        [string]$StrToEncode
    )

    Begin {
        $enc = [System.Text.Encoding]::UTF8
    }

    Process {
        Write-Verbose "String: $StrToEncode"
        $encStrArr = $enc.GetBytes($StrToEncode)
        Write-Verbose "EncStrArr: $encStrArr"
        $encArrHex = $encStrArr | ForEach-Object {"{0:X}" -f $_}
        Write-Verbose "EncArrHex: $encArrHex"
        $encStrHex = $encArrHex -join ""
        Write-Verbose "EncStrHex: $encStrHex"
        Write-Output $encStrHex
    }

    End {}
}