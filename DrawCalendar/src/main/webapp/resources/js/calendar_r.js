		let date = new Date();

		const renderCalendar = function() {
			
			const thisYear = date.getFullYear();
			const thisMonth = date.getMonth();
			const thisDate = date.getDate();
			const thisDay = date.getDay();
			const dateCnt = 35;
			
			document.querySelector('.go-today').textContent = thisYear+'년'+(thisMonth+1)+'월'+thisDate+'일'; 
		
			const thisFirst = new Date(thisYear, thisMonth, 1);
			const TFDate = thisFirst.getDate();
			const TFDay = thisFirst.getDay();
			
			const preLast = new Date(thisYear, thisMonth, 0);
			const thisLast = new Date(thisYear, thisMonth+1, 0);
			const nextLast = new Date(thisYear, thisMonth+2, 0);
			
			const preMonth = preLast.getMonth()+1;
			const nextMonth = nextLast.getMonth()+1;
			
			const PLDate = preLast.getDate();
			const TLDate = thisLast.getDate();
			const NLDate = nextLast.getDate();
			
			const PLDay = preLast.getDay();
			const TLDay = thisLast.getDay();
			const NLDay = nextLast.getDay();
			
			const prevDates = [];
			const thisDates = [];
			const nextDates = [];
			
			const Cal_Arr = (setDate, preDate, startDate) => {
				//1주차
				if( thisDate <= setDate ) { 
					for( let i = 0; i < preDate; i++) {
						prevDates.unshift(preMonth+'.'+(PLDate-i));	
					} 
					for( let i = 1; i < dateCnt-prevDates.length+1; i ++ ) {
						thisDates.push((thisMonth+1)+'.'+i); 
					}
				}	
				//2주차
				if( thisDate >setDate && thisDate <=setDate+7) { 
					for( let i = 0; i < preDate-7; i++) { 
							prevDates.unshift(preMonth+'.'+(PLDate-i));	
					}
					if(prevDates.length >= 5) {
						if(TLDate >= 30) {
							for( let i = 1; i < dateCnt-prevDates.length+1; i++) {
								thisDates.push((thisMonth+1)+'.'+i);	
							} 
						}else{
							for( let i = 1; i < TLDate+1; i++) {
								thisDates.push((thisMonth+1)+'.'+i);	
							}
						}	
					}else{
						for( let i = 1; i < TLDate+1; i++) {
							thisDates.push((thisMonth+1)+'.'+i);	
						}
					}	
					for( let i = 1; i < dateCnt-prevDates.length-thisDates.length+1; i ++ ) {
						nextDates.push(nextMonth+'.'+i); 
					}
				}
				//3주차
				if( thisDate >setDate+7 && thisDate <= setDate+14) {
					for( let i = startDate; i < TLDate+1; i++) {
						thisDates.push((thisMonth+1)+'.'+i);	
					} 
					for( let i = 1; i < dateCnt-thisDates.length+1; i ++ ) {
						nextDates.push(nextMonth+'.'+i); 
					}
				}
				//4주차
				if( thisDate >setDate+14 && thisDate <= setDate+21) {
					for( let i = startDate+7; i < TLDate+1; i++) {
						thisDates.push((thisMonth+1)+'.'+i);	
					} 
					for( let i = 1; i < dateCnt-thisDates.length+1; i ++ ) {
						nextDates.push(nextMonth+'.'+i); 
					}
				}
				//5주차
				if( thisDate >setDate+21 && thisDate <= setDate+28) {
					for( let i = startDate+14; i < TLDate+1; i++) {
						thisDates.push((thisMonth+1)+'.'+i);	
					} 
					for( let i = 1; i < dateCnt-thisDates.length+1; i ++ ) {
						nextDates.push(nextMonth+'.'+i); 
					}
				}
				if( thisDate > setDate+28 ) {
					for( let i = startDate+21; i < TLDate+1; i++) {
						thisDates.push((thisMonth+1)+'.'+i);	
					} 
					for( let i = 1; i < dateCnt-thisDates.length+1; i ++ ) {
						nextDates.push(nextMonth+'.'+i); 
					}
				}
	
			}
				
		 	switch( TFDay ) {
			 	case 0: Cal_Arr( 7, 7, 8 ); break;
				case 1: Cal_Arr( 6, 8, 7 ); break;
				case 2: Cal_Arr( 5, 9, 6 ); break;
				case 3: Cal_Arr( 4, 10, 5 ); break;	
				case 4: Cal_Arr( 3, 11, 4 ); break;
				case 5: Cal_Arr( 2, 12, 3 ); break;
				case 6: Cal_Arr( 1, 13, 2 ); break;
		 	}
	
			const dates = prevDates.concat(thisDates, nextDates);
			
			dates.forEach((date, i) => {
				var spDate = date.split('.');
				dates[i] = '<div class="date">' + spDate[1] + '<div class="' +date+'"></div></div>';
			})
			
			document.querySelector('.dates').innerHTML = dates.join('');
			
		
           for(let i = 0; i < plan_list.length; i ++) {
				var draw_date = plan_list[i].draw_date;
				$('[class="'+draw_date+'"]').html('<div class="on" date="'+draw_date+'"><img src="resources/img/draw.png"></div>');			
			}
		}
		
		const prevWeek = function() {
			date.setDate(date.getDate()-7);	
			renderCalendar();
		}
		
		const nextWeek = function() {
			date.setDate(date.getDate()+7);
			renderCalendar();
		} 
		
		const goToday = function() {
			date = new Date();
			renderCalendar();
		}  
		renderCalendar();