BEGIN{
    sentpktudp=0;
    recpktudp=0;
    sentpkttcp=0;
    recpkttcp=0;
}
{
    event=$1;
    pkttype=$5;

    if(pkttype=="tcp"){
        if(event=="+"){
            sentpkttcp++;
        }
        else if(event=="r"){
            recpkttcp++;
        }
    }
    else if(pkttype=="cbr"){
        if(event=="+"){
            sentpktudp++;
        }
        else if(event=="r"){
            recpktudp++;
        }
    }
}
END{
    printf("Packets sent by TCP=%d",sentpkttcp);
    printf("Packets received by TCP=%d",recpkttcp);
    printf("Packets sent by UDP=%d",sentpktudp);
    printf("Packets received by UDP=%d",recpktudp);
}