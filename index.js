var forwardCount = 40000;
var forwardTo = function(ip){
	forwardCount++;
	console.log("Discovered "+ip+" running on "+forwardCount);
	var exec = require('child_process').exec;
var child = exec('iptables -t nat -A PREROUTING -p tcp --dport '+forwardCount+' -j DNAT --to-destination '+ip+':12348', function(){
console.log(arguments);
});
	
}


var nmap = require('libnmap'),
    opts = {
        range: [
            '192.168.1.1-255'
        ]
    };
nmap.scan(opts, function(err, report) {
    if (err) throw new Error(err);
    for (var item in report) {
        if (report[item].runstats[0].hosts[0].item.up !== "0") {
            for (var r in report[item].host) {
                var self = report[item].host[r];
                if(self.address.length === 2){
		if (self.address[1].item.vendor === "Delta Electronics") {
                   	forwardTo(self.address[0].item.addr);
                }
		}
            }
            //console.log(JSON.stringify(report[item]));
        }
    }
});
