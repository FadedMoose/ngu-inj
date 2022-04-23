@echo off
PowerShell -Command "Get-Content '%~dpnx0' | Select-Object -Skip 3 | Out-String | Invoke-Expression"
goto :eof
Function _FindNStart{
    ##echo "Start FindNStart"
    cd (Get-ChildItem -Path "C:\Program Files (x86)\Steam" -Filter "*NGU IDLE*" -Recurse).Fullname
    Start-Process -FilePath "NGUIdle.exe"
    ##echo "End FindNStart"
    _BothRunning
    }
Function _CallInj{
        ##echo "Start CallInj"
        cd (Get-ChildItem -Path "C:\Users" -Filter "*3.4.2_DOWNLOADME*" -Recurse).Fullname
        cd dist
        Start-Process inject.bat}
Function _BothRunning{
##echo "Start BothRunning"
$_clock = 0
while($_clock -le 2){
    Start-Sleep -Seconds 1
    if(((get-process "steam" -ea SilentlyContinue) -ne $Null) -and ((get-process "NGUIdle" -ea SilentlyContinue) -ne $Null)){
        $_clock +=1
        ##echo "NGU & Steam have been running for $_clock seconds"
}
    else{
        $_clock = 0
}
}
##echo "End BothRunning"
_CallInj
}
_FindNStart