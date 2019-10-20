set ns [new Simulator]

set namf [open "5btrial.nam" w]
set trf [open "5btrial.tr" w]

$ns trace-all $trf
$ns namtrace-all $namf

proc finish { } {
    global ns namf trf
    $ns flush-trace
    close $trf
    close $namf
    exec gawk -f 5btrial.awk 5btrial.tr &
    exec nam 5btrial.nam &
    exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]

$ns color 1 red
$ns color 2 blue

$n0 color red
$n1 color blue

$ns duplex-link $n0 $n2 2Mb 20ms DropTail
$ns duplex-link $n1 $n2 2Mb 20ms DropTail
$ns duplex-link $n2 $n3 2Mb 20ms DropTail

$ns duplex-link-op $n0 $n2 orient right-down
$ns duplex-link-op $n1 $n2 orient right-up
$ns duplex-link-op $n3 $n2 orient left

set lan1 [$ns newLan "$n3 $n4 $n5 $n6" 10Mb 50ms LL Queue/DropTail MAC/Csma/Cd Channel]

set tcpag [new Agent/TCP]
set udpag [new Agent/UDP]
set sink1 [new Agent/TCPSink]
set sink2 [new Agent/Null]

$tcpag set fid_ 1
$udpag set fid_ 2

$ns attach-agent $n0 $tcpag
$ns attach-agent $n1 $udpag
$ns attach-agent $n4 $sink1
$ns attach-agent $n6 $sink2

set ftpapp [new Application/FTP]
set cbrapp [new Application/Traffic/CBR]

$ftpapp attach-agent $tcpag
$cbrapp attach-agent $udpag

$ns connect $tcpag $sink1
$ns connect $udpag $sink2

$ns at 0.0 "$ftpapp start"
$ns at 0.0 "$cbrapp start"
$ns at 5.0 "$ftpapp stop"
$ns at 5.0 "$cbrapp stop"
$ns at 6.0 "finish"
$ns run




