/* 인쇄  시작 */
function printDocument() {
	const completeParam = makeHtml();
    reportPrint(completeParam);
}

function makeHtml(){
	
	var content = document.getElementById('content_inbox').innerHTML;
	
    const obj = {html : ''};
    let html = '<div class="printPop">';
    html += content;
    html += '</div>';    
    obj.html = html;
    return obj;
}

function reportPrint(param){
    const setting = "width=890, height=841";
    const objWin = window.open('', 'print', setting);
    objWin.document.open();
    objWin.document.write('<html><head><title>DEVELOFFICE</title>');
    objWin.document.write('<link rel="stylesheet" href="resources/css/style.css">');
    objWin.document.write('<link rel="stylesheet" href="resources/css/style_approval.css"/>');
    objWin.document.write('</head><body>');
    objWin.document.write(param.html);
    objWin.document.write('</body></html>');
    objWin.focus(); 
    objWin.document.close();
 	
    setTimeout(function(){objWin.print();objWin.close();}, 100);
}

/* 인쇄 끝 */


$(document).ready(function() {
	 
    $(".datepicker").datepicker({        // selector 를 콤마로 구분
        dateFormat: "yy-mm-dd",
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        prevText: '이전 달',
        nextText: '다음 달',
        changeMonth: true,
        changeYear: true,
        showMonthAfterYear: true,
        yearSuffix: '년'
    });
});


