Get-ChildItem -Path C:\Users\Administrator\Desktop\test -Filter *.txt | Rename-Item -NewName { $_.name -Replace '.txt$','.xml' }
