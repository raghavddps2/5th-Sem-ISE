function get(a){return parseInt(document.getElementById(a).value)}
function set(a,b){document.getElementById(a).innerHTML=b}
function cat(a,b){return(a+b.toString())}

function checksum(){
    if((document.getElementById('usn').value).length==10)
    return true
    return false
}

function check(a,val){
    if(a>100)
    set('res1','Invalid marks')
    else if(a>90)
    set(cat('res',val),'S+')
    else if(a>80)
    set(cat('res',val),'S')
    else if(a>70)
    set(cat('res',val),'A')
    else if(a>60)
    set(cat('res',val),'B')
    else if(a>50)
    set(cat('res',val),'C')
    else if(a>40)
    set(cat('res',val),'D')
    else 
    set(cat('res',val),'F')
}

function grad(){
    if(checksum()){
    for(i=1;i<=3;i++)
    check(get(cat('gra',i)),i)
    }
    else 
    set('res1','Invalid USN')
}