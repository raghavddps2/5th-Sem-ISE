set ns [new Simulator]

set namf [open "3btrial.nam" w]
set trf [open "3btrial.tr" w]

$ns trace-all $trf
$ns namtrace-all $namf

proc finish {} {
    global ns namf trf
    $ns flush-trace
    close $trf
    close $namf
    exec awk -f 3btrial.awk 3btrial.tr &
    exec nam 3btrial.nam &
    exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

$ns duplex-link $n0 $n2 2Mb 20ms DropTail
$ns duplex-link $n1 $n2 2Mb 20ms DropTail
$ns duplex-link $n2 $n3 2Mb 20ms DropTail

set tcpag [new Agent/TCP]
set udpag [new Agent/UDP]
set sink1 [new Agent/TCPSink]
set sink2 [new Agent/Null]

$ns attach-agent $n0 $tcpag
$ns attach-agent $n1 $udpag
$ns attach-agent $n3 $sink1
$ns attach-agent $n3 $sink2

set cbrapp [new Application/Traffic/CBR]
set ftpapp [new Application/FTP]

$cbrapp attach-agent $udpag
$ftpapp attach-agent $tcpag

$ns connect $udpag $sink2
$ns connect $tcpag $sink1

$ns at 0.0 "$cbrapp start"
$ns at 0.0 "$ftpapp start"
$ns at 8.0 "$cbrapp stop"
$ns at 8.0 "$ftpapp stop"
$ns at 8.0 "finish"
$ns run

