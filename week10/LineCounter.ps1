$FilesToLookAt = Get-ChildItem -Recurse -Include *.bash

#$FilesToLookAt

for($i=0; $i -lt $FilesToLookAt.Count; $i++){
Get-Content $FilesToLookAt[$i] | Measure-Object -Line -Word
}