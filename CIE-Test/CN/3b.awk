BEGIN{
    TCPSent = 0;
    TCPRecieved = 0;
    UDPSent = 0;
    UDPRecieved = 0;
}
{
    packetType = $5
    event = $1
    if(packetType == "tcp")
    {
        if(event == "+")
        {
            TCPSent++;
        }
        else if(event == "r")
        {
            TCPRecieved++;
        }
    }
    else if(packetType == "cbr")
    {
        if(event == "+")
        {
            UDPSent++;
        }
        else if(event == "r")
        {
            UDPRecieved++;
        }
    }
}
END{
    printf("TCP packets sent : %d\n",TCPSent);
    printf("TCP packets recieved : %d\n",TCPRecieved);
    printf("UDP packets sent : %d\n",UDPSent);
    printf("UDP packets recieved : %d\n",UDPRecieved);
}