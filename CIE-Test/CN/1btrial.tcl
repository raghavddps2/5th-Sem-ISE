set ns [new Simulator]

set tracef [open "1btrial.tr" w]
set namf [open "1btrial.nam" w]

$ns trace-all $tracef
$ns namtrace-all $namf

proc finish { } {
    global ns tracef namf
    $ns flush-trace
    close $tracef
    close $namf
    exec gawk -f 1btrial.awk 1btrial.tr &
    exec nam 1btrial.nam &
    exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]

set udp0 [new Agent/UDP]
set sink [new Agent/Null]

$ns attach-agent $n0 $udp0
$ns attach-agent $n2 $sink

$ns duplex-link $n0 $n1 1kb 10ms DropTail
$ns duplex-link $n1 $n2 1kb 10ms DropTail

$ns connect $udp0 $sink

set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp0

$ns at 0.0 "$cbr0 start"
$ns at 3.0 "$cbr0 stop"
$ns at 3.0 "finish"
$ns run


