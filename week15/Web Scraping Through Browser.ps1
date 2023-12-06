clear

#[System.Collections.ArrayList]$multi = @()

$url = "https://classlist.champlain.edu/show/courses/semester/spring/type/dayevening"

#start internet explorer object
$ie = New-Object -ComObject internetexplorer.application
$ie.navigate($url)
while($ie.Busy) {start-sleep -s 5}
$ie.visible=$true

$FullTable = @()

$trs=$ie.Document.getElementsByTagName("tr") #Get every row

for($i=1; $i -lt $trs.length; $i++){ #for every row
$tds = $trs[$i].getElementsByTagName("td") #Get every column

$FullTable += [pscustomobject]@{"Number" = $tds[0].innerText ` 
                                "Title" = $tds[1].innerText ` 
                                "Days" = $tds[4].innerText ` 
                                "Times" = $tds[5].innerText ` 
                                "Instructor" = $tds[6].innerText }
} #end of for loop
#$FullTable
#Get every CSI Course
#$FullTable | select Number, Instructor, Days, Times | where { $_.Number -ilike "CSI*"} | Out-String

#Print Number, Instructor, Days, and Times for every 200 level CSI course
#$FullTable | select Number, Instructor, Days, Times | where { $_.Number -ilike "CSI 2*"} | Out-String

#Print Number, Instructor, Days, and Times for every 300 level CSI course on wednesdays
#$FullTable | select Number, Instructor, Days, Times | where { `
#( $_.Number -ilike "CSI 3*") -and ( $_.Days -ilike "*W*") } | Out-String

#Print Number, Title, Instructor, Days for every CSI course that is taught by Staff
#$FullTable | select Number, Days, Times, Instructor | where { ` 
#( $_.Number -ilike "CSI*") -and ($_.Instructor -ilike "*Staff*") }

# Print Number, Title, Instructor, Days for every course that include the String Programming in Title
$FullTable | select Number, Days, Times, Instructor, Title | where { $_.Title -ilike "*Programming*"} | Out-String

$ie.Quit()