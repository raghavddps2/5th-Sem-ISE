BEGIN{
    pktdrop=0;
}
{
    event=$1;
    if(event=="d")
    {
        pktdrop++;
    }
}
END{
    printf("No. of packets dropped=%d",pktdrop)
}