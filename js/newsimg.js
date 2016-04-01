	var ShowCount = 1;//œ‘ æ ˝¡ø
	var i;
	var str="";	
	var sImg = new Array();
	sImg[0]="images/ranImgs/0.jpg";
	sImg[1]="images/ranImgs/1.jpg";
	sImg[2]="images/ranImgs/2.jpg";
	sImg[3]="images/ranImgs/3.jpg";
	sImg[4]="images/ranImgs/4.jpg";
	sImg[5]="images/ranImgs/5.jpg";
	sImg[6]="images/ranImgs/6.jpg";
	sImg[7]="images/ranImgs/7.jpg";
	sImg[8]="images/ranImgs/8.jpg";
	sImg[9]="images/ranImgs/9.jpg";
	function mixArray(source)
	{
		var goal=[];
		for(var i=0;i<source.length;i++)
		{
			var pos=Math.floor(Math.random()*(source.length-i));
			goal[i]=source[pos];
			source[pos]=source[source.length-1-i];
		}
		return goal;
	}
	
	var Ro = new Array();
	for (var x=0;x<sImg.length ;x++ )
	{							   
		Ro[x]=x;	
	}
	Ro=mixArray(Ro);
	

	for (var j=0;j<ShowCount ; j++)
	{

	    str += "<img src='" + sImg[Ro[j]] + "' />";
	}
	document.getElementById("newsImg").innerHTML=str;