$AdminSiteURL = "https://<tenant_name>-admin.sharepoint.com" #Example https://wafsec-admin.sharepoint.com

$cred = Get-Credential

Connect-SPOService -Url $AdminSiteURL -Credential $cred

Get-SPOSite -IncludePersonalSite $true -Limit all -Filter "Url -like '-my.sharepoint.com/personal/'" | Select Owner, StorageUsageCurrent, StorageQuota | Export-Csv -Path "C:\temp\OneDriveUsage.csv" -Delimiter ';'