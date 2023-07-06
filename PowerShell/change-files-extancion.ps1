Get-ChildItem -Path C:\Users\Administrator\Desktop\test -Filter *.txt | Rename-Item -NewName { $_.name -Replace &#39;.txt$&#39;,&#39;.xml&#39; }
