	let date = new Date();

	const renderWeek = () => {
		const thisYear = date.getFullYear();
		const thisMonth = date.getMonth();
		const thisDate = date.getDate();
		const thisDay = date.getDay();
		
		document.querySelector('.go-today').textContent = thisYear+'년'+(thisMonth+1)+'월'+thisDate+'일';
		
		const preLast = new Date(thisYear, thisMonth, 0);
		const thisLast = new Date(thisYear, thisMonth+1, 0);
		const nextLast = new Date(thisYear, thisMonth+2, 0);
		
		const preMonth = preLast.getMonth()+1;
		const nextMonth = nextLast.getMonth()+1;
		
		const PLDate = preLast.getDate();
		const TLDate = thisLast.getDate();
		const NLDate = nextLast.getDate();
		
		const weekStart = new Date(thisYear, thisMonth, thisDate-thisDay);
		const weekEnd = new Date(thisYear, thisMonth, thisDate + (6-thisDay));
	
		const startDate = weekStart.getDate();
		const endDate = weekEnd.getDate();	
		const startMonth = weekStart.getMonth()+1;
		
		const weekDate = [];

		
		if(endDate < 7) {
			if(startMonth !== thisMonth+1){
				for(let i = startDate; i < PLDate+1; i++){
					weekDate.push(preMonth+'.'+i);
				}
				for(let i = 1; 1 < 7-weekDate.length+1; i ++){
					weekDate.push((thisMonth+1)+'.'+i);
				}
			}
			if(startMonth === thisMonth+1) {
				for(let i = startDate; i < TLDate+1; i++){
					weekDate.push((thisMonth+1)+'.'+i);
				}
				for(let i = 1; 1 < 7-weekDate.length+1; i ++){
					weekDate.push(nextMonth+'.'+i);
				}
			}
				
		}
		
		if(startDate >= 1 && startDate <= TLDate-6 ){
			for(let i = startDate; 1 < 7-weekDate.length+1; i ++){
				weekDate.push((thisMonth+1)+'.'+i);
			}
		}
		
		var html = '';
		for(let i = 9; i < 20; i++) {
			html += '<tr><td class="time" time="'+i+'" >'+i+'시'+'</td>'
			for(let j = 0; j < 7; j++) {
				html += '<td date="'+weekDate[j]+'" time="'+i+'"></td>'
			}
			html += '</tr>'
		}
	
		weekDate.forEach((date, i) => {
			var spDate = date.split('.');
			weekDate[i] = '<th class="date">' + date + '</th>';
		})
		weekDate.unshift('<tr class="dates""><td></td>');
		weekDate.push('</tr>')
		weekDate.push('<tr class="day"><td></td><td>SUN</td><td>MON</td><td>TUE</td><td>WED</td><td>THU</td><td>FRI</td><td>SAT</td></tr>');
			
		document.querySelector('.weekTable').innerHTML = weekDate.join('')+''+html; 
 		
		for(let i = 0; i< plan_list.length; i++) {
			var draw_date = plan_list[i].draw_date;
			var draw_time = plan_list[i].draw_time;
		    var announce_time = plan_list[i].announce_time;
		    var puchase_time = plan_list[i].puchase_time;
		    
		 	$('[date="'+draw_date+'"][time="'+draw_time+'"]').css( {
		 		"background" : "black" ,
		 		"opacity" : "0.6",
				"border" : "1px solid white"
		 	}).addClass('on');
		 	
		 	$('[date="'+draw_date+'"][time="'+announce_time+'"]').css( {
		 		"background" : "blue" ,
		 		"opacity" : "0.6",
				"border" : "1px solid white"
		 	}).addClass('on');
		 	
		 	$('[date="'+draw_date+'"][time="'+puchase_time+'"]').css( {
		 		"background" : "green" ,
		 		"opacity" : "0.6",
				"border" : "1px solid white"
		 	}).addClass('on');
		}
	}
	renderWeek();
	
	const prevWeek = () => {
		date.setDate(date.getDate()-7);	
		renderWeek();
	}
	
	const nextWeek = () => {
		date.setDate(date.getDate()+7);
		renderWeek();
	} 
	
	const goToday = () => {
		date = new Date();
		renderWeek();
	}  