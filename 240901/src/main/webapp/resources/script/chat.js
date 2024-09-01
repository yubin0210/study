"use strict";

// 메시지 받았을 때 (전챗 및 귓말 함께 처리)
function onReceive(chat) {					
	const content = JSON.parse(chat.body)	
	
	if(content.from.includes('user::')) {	// 사용자 목록 변화에 따른 메시지이면
		getSessions()						// 세션 목록을 새로 불러오자
		content.from = ''
	}
	else if(content.className == 'whisper' && content.from == username) {
			content.from = '[to ' + content.to + ']' 
	}
	else if(content.className == 'whisper' && content.from != username){
		content.from = '[from ' + content.from + ']'
	}
	
	let str = ''
	str += '<div class="' + content.className + '">'
	str += '<div>'
	str += '<b>' + content.from + ' : ' + content.text + '</b>'
	str += '<sub>' + content.time + '</sub>'
	str += '</div></div>'
	
	messageArea.innerHTML += str						// 태그로 구성하여 화면에 반영
	messageArea.scrollTop = messageArea.scrollHeight	// 스크롤 이동시키기
}

// 접속했을 때
function onConnect() {
	const right = document.querySelector('div.right')
	const target = right.getAttribute('to')
	
	console.log('STOMP Connection')
	stomp.subscribe('/topic', onReceive)
	stomp.subscribe('/sendTo/' + username, onReceive)
	stomp.send('/app/enter', {}, JSON.stringify({
		from: username,
	}))
	
	document.querySelector('input[name="msg"]').focus()
}

// 클라이언트가 메시지를 입력할 때
function onInput() {	
	const text = document.querySelector('input[name="msg"]').value
	
	if(text == '') {		// 입력안하고 엔터누르면 
		return				// 진행하지 않는다
	}
	
	document.querySelector('input[name="msg"]').value = ''	// 일단 입력창 내용 지워두고
	
	if(text.startsWith('/w ')) {		// 귓속말이면
		const arr = text.split(' ')
		const data = {		
			from: username,
			text: arr.slice(2).join(' '),
			to: arr[1],
			className: 'whisper',
		}
		
		stomp.send('/app/sendTo/' + arr[1], {}, JSON.stringify(data))
		stomp.send('/app/sendTo/' + username, {}, JSON.stringify(data))	// 자신에게도 보냄
		
		// 귓속말 상태를 이어간다 (클릭이벤트 강제 발동)
		const event = new Event('click')
		const target = Array.from(document.querySelectorAll('ul > li'))
			.filter(e => e.innerText == data.to)[0]
		target.dispatchEvent(event)
	}
	else {	// 아니면 (전체 채팅)
		stomp.send('/app/topic', {}, JSON.stringify({		
			from: username,
			text: text,
		}))
	}
	
	document.querySelector('input[name="msg"]').focus()	
}

// 웹소켓 연결 종료
function onDisconnect(event) {
	event.preventDefault()		
	stomp.send('/app/disconnect', {}, JSON.stringify({
		from: username,
	}))
}

// 대상 클릭하면 귓속말열기
function inputSendTo(event) {
	const input = document.querySelector('input[name="msg"]')
	input.value = '/w ' + event.target.innerText + ' '
	input.focus()
}

// 접속자 불러오기 (AJAX)
async function getSessions() {
	const url = cpath + '/sessions'
	const result = await fetch(url).then(resp => resp.json())
	const userList = document.querySelector('ul.userList')
	
	userList.innerHTML = ''
	result.forEach(e => {
		const li = document.createElement('li')
		li.innerText = e
		li.onclick = inputSendTo
		userList.appendChild(li)
	})
}

// 로그아웃
async function onLogout(e) {
	await fetch(cpath + '/logout')	// 세션에서 로그아웃 하고
	onDisconnect(e)					// 웹소켓을 해지한다 (순서 때문에 로그아웃을 fetch로 수행했음)
	location.href = cpath			// 다 끝나면 대문페이지로 이동
}
