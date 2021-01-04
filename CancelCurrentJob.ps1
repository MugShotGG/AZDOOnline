#Sourced From Here and Required Build Stop Perms for the pool
#https://stackoverflow.com/questions/62044055/is-it-possible-to-cancel-a-azure-devops-pipeline-job-programmatically

$uri = "https://dev.azure.com/thecodemanual/DevOps Manual/_apis/build/builds/$(Build.BuildId)?api-version=5.1"

$json = @{status="Cancelling"} | ConvertTo-Json -Compress

Invoke-RestMethod -Uri $uri -Method Patch -Headers @{Authorization = "Bearer $(System.AccessToken)"} -ContentType "application/json" -Body $json
