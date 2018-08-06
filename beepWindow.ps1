[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms");

while(1 -gt 0)
{
    $a = Get-Process |where {$_.mainWindowTitle -and ($_.mainWindowTitle -like "*błąd*" -or $_.mainWindowTitle -like "*komunikat [1-9]*")};
    
    $a | format-table id,name,mainwindowtitle –AutoSize;
    if($a.count -gt 0)
    {
        [console]::beep(1000,500)
        [System.Windows.forms.MessageBox]::Show('Run?','Game input','OK','Error')
    };
    Start-Sleep -s 10
}

#test - chrome killer
#while(1 -gt 0){$a = Get-Process |where {$_.mainWindowTitle -and $_.mainWindowTitle -like "*chrome*"};$a | format-table id,name,mainwindowtitle –AutoSize;if($a.count -gt 0){$a |Stop-Process};}
