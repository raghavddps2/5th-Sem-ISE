set ns [new Simulator]

set namf [open "2btrial.nam" w]
set trf [open "2btrial.tr" w]

$ns trace-all $trf
$ns namtrace-all $namf

proc finish { } {
    global ns namf trf
    $ns flush-trace
    close $namf
    close $trf
    exec gawk -f 2btrial.awk 2btrial.tr &
    exec nam 2btrial.nam &
    exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

$ns duplex-link $n0 $n2 4Mb 20ms DropTail
$ns duplex-link $n1 $n2 4Mb 20ms DropTail
$ns duplex-link $n2 $n3 1Mb 20ms DropTail

set tcp0 [new Agent/TCP]
set tcp1 [new Agent/TCP]
set sink0 [new Agent/TCPSink]
set sink1 [new Agent/TCPSink]

$ns attach-agent $n0 $tcp0
$ns attach-agent $n1 $tcp1
$ns attach-agent $n3 $sink0
$ns attach-agent $n3 $sink1

set ftpapp [new Application/FTP]
set telapp [new Application/Telnet]

$ftpapp attach-agent $tcp0
$telapp attach-agent $tcp1
$ns connect $tcp0 $sink0
$ns connect $tcp1 $sink1

$ns at 0.0 "$telapp start"
$ns at 0.0 "$ftpapp start"
$ns at 8.0 "$telapp stop"
$ns at 8.0 "$ftpapp stop"
$ns at 8.0 "finish"
$ns run

