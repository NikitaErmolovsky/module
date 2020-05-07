global __nmppsConvert_risc8s32s: label;
begin ".textConv"
<_nmppsConvert_risc8s32s>
	ar5=ar7-2;
	push ar0, gr0;
	push ar1, gr1;
	push ar2, gr2;
	push ar3, gr3;
	ar0=[--ar5];//ссылка на массив 8-бит
	ar1=[--ar5];//ссылка на массив 32-бит
	ar2=[--ar5];//размер массива 8-бит
	gr1=0;
	<Kolvo_iter>
		gr1++;
		ar2-=8;
	if  > goto Kolvo_iter
	gr3 = gr1;
	<Loop2>
		gr3=gr3-4;
		if > goto Loop2
	
	<Loop>
	
		gr2= [ar0++];
		gr0=4;
		
		<Loop1>
			
			if gr3 >= 0
				[ar1++]= gr2 and 11111111b;
				
			gr2>>=8;
			if gr3<0
				gr3=gr3+1;
		gr0--;
		if >  goto Loop1 with gr0--;
	gr1--;
	if >  goto Loop with gr1--;
	pop ar3,gr3;
	pop ar2,gr2;
	pop ar1,gr1;
	pop ar0,gr0;
end ".textConv";