Write-Output "Collecting Domain Users and Computers"
Get-ADDomainController -filter * | Select-Object name, domain, IPv4Address, ServerObjectDN  | export-csv -path ./domain.csv
Get-ADUser -Filter * -Properties * | Select GivenName, SurName, SamAccountName, EmailAddress, DistinguishedName, ObjectClass | export-csv -path ./ad-users.txt
Get-ADComputer -filter * -Properties * | Select-Object cn, DNSHostName, primaryGroup | export-csv -path ./ad_computers.txt
explorer.exe .