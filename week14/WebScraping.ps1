clear

$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://192.168.3.29/ToBeScrapped.html

# Get a count of the links in the page
#$scraped_page.Links.Count

# Display links as HTML elements
#$scraped_page.Links

# Display only URL and its text
#$scraped_page.Links | where { $_.href -ilike "*https*" } | select href

$h2s=$scraped_page.ParsedHtml.body.getElementsByTagName("h2") #| select outerText

#for($i=0; $i -lt $h2s.Length; $i++){
#$h2s[$i].getElementsByTagName("a") | select `
#@{Name="h2 element"; Expression={$i}}, outerText, href
#}

# Print innerText of every div element that has the class as "div-1"
$divs1=$scraped_page.ParsedHtml.getElementsByTagName("div") | where { `
$_.getAttributeNode("class").Value -ilike "*div-1*" } | select innerText

#$divs1

#$trs=$scraped_page.ParsedHtml.body.getElementsByTagName("tr")

#$multirow = @()
#for($i=1; $i -lt $trs.length; $i++){
#$tds=$trs[$i].getElementsByTagName("td")

#$singlerow = @(
#@{Row=$i; Employee=$tds[0].innerText; Department=$tds[1].innerText; `
#Salary=$tds[2].innerText}
#)
#$multirow + $singlerow
#}
#$multirow

#calc avg salary
$avg=0

#for($i=1; $i -lt $trs.length; $i++){
#$tds=$trs[$i].getElementsByTagName("td")
#$avg+=$tds[2].innerText
#}
#$avg=$avg/3

#echo "Average Salary is" $avg

$alldivs=$scraped_page.ParsedHtml.body.getElementsByTagName("div")
Foreach($alldiv in $alldivs)
{
    $alldiv.id
}

#$alldivs