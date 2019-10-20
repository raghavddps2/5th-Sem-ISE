BEGIN {
    pktftp=0;
    pkttel=0;
    ftpsiz=0;
    telsiz=0;
    ftpput=0;
    telput=0;
}
{
    event=$1;
    pkttype=$5;
    from=$9;
    to=$10;
    pktsiz=$6;
    if(event=="r"&&pkttype=="tcp"&&from=="0.0"&&to="3.0")
    {
        pktftp++;
        ftpsiz=pktsiz;
    }
    if(event=="r"&&pkttype=="tcp"&&from=="1.0"&&to="3.0")
    {
        pkttel++;
        telsiz=pktsiz;
    }
}
END{
    ftpput = ftpsiz*pktftp;
    telput = telsiz*pkttel;
    printf("The throughput of FTP=%d",ftpput);
    printf("The throughput of TELNET=%d",telput);
}