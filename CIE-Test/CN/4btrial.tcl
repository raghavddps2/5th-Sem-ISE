set ns [new Simulator]

set namf [open "4btrial.nam" w]
set trf [open "4btrial.tr" w]

$ns trace-all $trf
$ns namtrace-all $namf

proc finish { } {
    global ns namf trf
    $ns flush-trace
    close $namf
    close $trf
    exec gawk -f 4btrial.awk 4btrial.tr &
    exec nam 4btrial.nam &
    exit 0
}

Agent/Ping instproc recv {from rtt} {
    $self instvar node_
    puts "node [$node_ id] got pinged from $from with rtt time $rtt"
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]

set ping1 [new Agent/Ping]
set ping2 [new Agent/Ping]
set ping3 [new Agent/Ping]
set ping4 [new Agent/Ping]
set ping5 [new Agent/Ping]
set ping6 [new Agent/Ping]

$ns attach-agent $n1 $ping1
$ns attach-agent $n2 $ping2
$ns attach-agent $n3 $ping3
$ns attach-agent $n4 $ping4
$ns attach-agent $n5 $ping5
$ns attach-agent $n6 $ping6

$ns duplex-link $n0 $n6 50kb 20ms DropTail
$ns duplex-link $n0 $n5 50kb 20ms DropTail
$ns duplex-link $n0 $n4 50kb 20ms DropTail
$ns duplex-link $n0 $n3 50kb 20ms DropTail
$ns duplex-link $n0 $n2 50kb 20ms DropTail
$ns duplex-link $n0 $n1 50kb 20ms DropTail

$ns queue-limit $n0 $n6 1
$ns queue-limit $n0 $n1 1

$ns connect $ping1 $ping6
$ns connect $ping2 $ping5
$ns connect $ping3 $ping4

$ns at 0.0 "$ping1 send"
$ns at 0.0 "$ping2 send"
$ns at 0.0 "$ping3 send"
$ns at 0.0 "$ping4 send"
$ns at 0.0 "$ping5 send"
$ns at 0.0 "$ping6 send"
$ns at 1.0 "finish"
$ns run
