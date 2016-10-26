

function draw() {
fetch("https://api.travis-ci.org/repos/HPI-SWA-Lab/BP2016H1/builds", {
	headers: {
		Accept: "application/vnd.travis-ci.2+json"
	}
}).then(r => r.json()).then( json => 
  json.builds[0].job_ids[0]
).then( job_id => 
  "https://s3.amazonaws.com/archive.travis-ci.org/jobs/"+ job_id +"/log.txt"
).then(url =>
  fetch(url).then( r => r.text())
).then( t => {
  s = t.split(/\n/).filter( ea => ea.match(/\#/)).join("\n")
  document.querySelector("#travis").innerHTML = ""+ new Date() +"<br><pre>" + s +"</pre>"
})
  
  setTimeout(draw, 10000)
}

draw()
