var approval_msg = new validateMessage('approval');
approvalTableClass = function(pConfig)
{
	this._row = pConfig.row;
  	this._table = pConfig.table;
	this._headerExist = pConfig.header ? pConfig.header : true;
	this._noDataDisplay = true;
	this._initRowNumber = pConfig.initRowNumber ? pConfig.initRowNumber : 1;
console.log(this);
}

approvalTableClass.prototype = {
	insertRow : function(pValue)
	{
		this.initializeTable();

		if(pValue.result == null || pValue.result == "" || pValue.result.length == 0){
			this.noDataDisplay(pValue.message ? pValue.message : "");
			return;
		}

		for(var i=0; i<pValue.result.length; i++){
			var row = document.getElementById(this._table).insertRow(-1);
			if(pValue.result[i]["row_class_name"] !== undefined &&  pValue.result[i]["row_class_name"] !== ""){
				row.className = pValue.result[i]["row_class_name"];
			}

			for(var j=0; j<this._row.length; j++){
				var c = row.insertCell(-1);
				if(pValue.result[i][this._row[j][0]]){
					if(this._row[j][1] != "") c.className = this._row[j][1];
					c.innerHTML = pValue.result[i][this._row[j][0]];
					if(this._row[j][0] === "document_regdate" && pValue.result[i]["document_regdate_title"] !== undefined &&  pValue.result[i]["document_regdate_title"] !== ""){
						c.title = pValue.result[i]["document_regdate_title"];
					}
				}else{
					c.innerHTML = "&nbsp;";
				}
			}
		}
	}

	// 데이터가 존재하지 않을 경우
	,noDataDisplay : function(pMessage)
	{
		if( this._noDataDisplay ){
			console.log("no data");
			if( this._headerExist ){
				if( this._headerExist ){
					var row = document.getElementById(this._table).insertRow(-1);
					var c = row.insertCell(-1);
					c.colSpan = this._row.length;
					c.innerHTML = pMessage;
					c.className = 'approval-no-data';
				}else{
										
				}
			}
		}
	}

	// 테이블 row 데이터 초기화
	,initializeTable : function()
	{
		if( document.getElementById(this._table) ){
			if( this._headerExist ){
				for(var i=(document.getElementById(this._table).rows.length-1) ; i>=this._initRowNumber ; --i)
					document.getElementById(this._table).deleteRow(i);
			}else{
				for(var i=(document.getElementById(this._table).rows.length-1) ; i>=0 ; --i)
					document.getElementById(this._table).deleteRow(i);
			}
		}
	}
};

//관련문서 첨부
var approvalRelatedDocumentTable = new approvalTableClass({table:"tableRelatedDocument", row : [["action", ""], ["star", ""], ["document_code", ""], ["none_link_title", "title"], ["register", ""]]});

var autoComplete = function(){
	$j(".js-complete").autocomplete({
		source: function(request, response){
			$j.ajax( {
				url: Common.getServiceRoot() + "approval/complete/search",
				dataType: 'json',
				data: {
					word: request.term,
				},
				type: 'POST',
				minLength: 1,
				delay: 500,
				success: function( data ) {
					response( data );
				}
			} );
		}

		,open: function()
		{
			$j('.ui-autocomplete').css('z-index', 1111);
			$j('.ui-widget-content').css('overflow-y', 'hidden');
			return false;
		}

		,focus: function() {
			return false;
		}

		,autoFocus : true

		,select: function(event, ui){
			this.value = "";
			var selectCase = $j(this).attr('id');
			var selectMethod = "";
			switch(selectCase){
				case "inputApprovalLineSetting" :
					if(typeof ApprovalRef === "object"){
						ApprovalRef.addApprovalLineSetting(selectCase, ui.item.user_no, ui.item.node_id, ui.item.user_name);
					}
					break;
				case 'inputApprovalFormFirstLine' :
				case 'inputApprovalFormSecondLine' : 
				case 'inputApprovalFormThirdLine' :
					ApprovalRef.addApprovalFormLineUser(selectCase, ui.item.user_no, ui.item.node_id, ui.item.user_name);
					break;
				case "inputApprovalThirdLine" :
					ApprovalRef.addApprovalLineUser(selectCase, ui.item.user_no, ui.item.node_id, ui.item.user_name);
					break;
				default :
			}
			return false;
		}

		,response: function(event, ui){
			
		}
	})
	.autocomplete( "instance" )._renderItem = function( ul, item ) {	
		return $j( "<li>" )
		.append( "<div><span class='team-membername'>" + item.left + "</span><span class='team-name'>" + item.right + "</span></div>" )
		.appendTo( ul );
	};
	
	$j('.js-complete').each(function() {
		$j(this).data('ui-autocomplete')._renderItem = function (ul, item) {
			return $j( "<li>" )
				.append( "<div><span class='team-membername'>" + item.left + "</span><span class='team-name'>" + item.right + "</span></div>" )
				.appendTo( ul );
		};
	});
};

var ApprovalRef = {
		_searchRelatedDocument : {'pMenu' : 'get_document_box_list', 'pCallback' : 'ApprovalRef.setTableRelatedDocument', 'pStatus' : 'related_document_from_write', 'page' : '1'},
		_approvalLineNumber : {'A':21, 'B':20, 'C':20, 'D':63, 'E':28, 'F':100, 'G':100, 'H':100, 'I':100},
		// 신청/처리 결재선
		Ajax: function(pParam, pFlag, pSync)
		{
			if(pFlag === undefined){
				Common._createBackGround();
				Common._createProgress();
			}

			if(pSync == undefined) pSync = true;

			getAjaxData(Common.getRoot() + 'approval/document_ajax/', pParam, ApprovalRef.AjaxCallback, pSync);
		}

		,AjaxCallback: function(pValue)
		{
			if( pValue.layerID && pValue.layerID.indexOf("showPreviewApprovalForm") < 0 ){
				Common._closeProgress();
				Common._closeBackGround();
			}

			if (pValue.resultCode == RT_OK)
			{
				var methods = (new Function( 'return ' + pValue.layerID ))();
				try
				{
					methods.call(this, pValue);
				} catch(E)
				{
					alert("callback : " + E);
					console.log(E);
				}
			}
			else
			{
				if(pValue.message){
					alert(pValue.message);
				}
				if(pValue.reload === RT_OK){
					document.location.reload(true);
				}
				return;

			}
		},
		approvalLineSetting : function(pLine, pType){
			var params = {
					'pMenu' : 'approval_line_setting',
					'pMethod' : 'BCF',
					'pApprovalType' : pType,
					'pCallback' : 'ApprovalRef.showApprovalLineSetting',
					'pApprovalLineType' : pLine,
					'pApprovalLine' : $j('#'+pLine).val()
			}
			ApprovalRef.Ajax(params);
		},
		showApprovalLineSetting : function(pValue){
			$j('#wrap').append(pValue.result);
			// 확인 버튼 처리
			
			$j('#layerApprovalLineSetting').find('div.layer_button').find('.btn_variables').attr('onclick', 'ApprovalRef.saveApprovalLineSetting();');
			$j('#layerApprovalLineSetting').showPopup();
			$j('#layerApprovalLineSetting').focus();
		},
		
		addApprovalLineSetting : function(pId, pNo, pNode, pName){	// 결재자 선택
			if(ApprovalRef.checkApprovalLineSetting(pNo) === false){
				var approval_line_type = $j("#tempApprovalLineType").val();
				var approval_line_types = ['approval_first_line', 'approval_second_line', 'approval_third_line'];
				approval_line_types.splice(approval_line_types.indexOf(approval_line_type), 1);

				// 20170531  추가 부분
				if($j('#coworker_type').length && ($j('#coworker_type').prop('checked') || $j('#coworker_type').val() === 'Y')){
					if(ApprovalRef.checkDuplicateApprovalLineUser(pNo, ['approval_third_line'])){
						//alert('다른 사용자의 결재를 기안하는 경우 해당 사용자는 결재자로 추가할 수 없습니다.');
						alert(approval_msg.getMessage('approval_error_other_line_user'));
						return;
					}//
				}

				if(ApprovalRef.checkDuplicateApprovalLineUser(pNo, approval_line_types)){
					//alert("이미 추가된 결재자는 추가할 수 없습니다.");
					alert(approval_msg.getMessage('approval_error_already_line_user'));
					return;
				}
				
				//$j("#sortApprovalLineSetting").append('<li class="js-approval-line-setting ui-sortable-handle" user_no="'+pNo+'" node_id="'+pNode+'"><span>'+pName+'</span><span class="icon file_delete js-approval-line-setting-delete"></span><span class="spr-approval updown" title="이동"></span></li>');	
				$j("#sortApprovalLineSetting").append('<li class="js-approval-line-setting ui-sortable-handle" user_no="'+pNo+'" node_id="'+pNode+'"><span>'+pName+'</span><span class="icon file_delete js-approval-line-setting-delete"></span><span class="spr-approval updown" title="'+approval_msg.getMessage('insa_move')+'"></span></li>');
			}else{
				//alert("이미 추가된 결재자는 추가할 수 없습니다.");
				alert(approval_msg.getMessage('approval_error_already_line_user'));
				return;
			}
		},
		checkApprovalLineSetting: function(pNo){	// 결재선 사용자 중복체크
			for(var i=0; i<$j("#sortApprovalLineSetting").children("li").length; i++){
				if(pNo === $j("#sortApprovalLineSetting ").children("li").eq(i).attr("user_no")){
					return true;
				}
			}

			return false;
		},
		checkDuplicateApprovalLineUser: function(pNo, pType){	// 결재선 사용자 중복체크
			var approval_lines = [], approval_line_user = [], approval_line_user_info = [];
			var return_value = false;
			if(typeof pType === 'string'){
				approval_lines = pType.split(",");
			}else if(typeof pType === 'object'){
				approval_lines = pType;
			}

			for(var i=0; i<approval_lines.length; i++){
				if(return_value === false){
					approval_line_user = $j('#'+approval_lines[i]).val().split(",");

					for(var j=0; j<approval_line_user.length; j++){
						approval_line_user_info = approval_line_user[j].split("|");
						if(pNo === approval_line_user_info[0]){
							return_value = true;
							continue;
						}
					}
				}
			}

			return return_value;
		},
		
		saveApprovalLineSetting: function(){	// 결재선 레이어 확인 버튼 클릭
			var approval_line_type = $j("#tempApprovalLineType").val();
			var approval_line = [];
			
			var approval_type = '';
			if(approval_line_type === 'approval_first_line'){
				approval_type = 'B';
			}else if(approval_line_type === 'approval_second_line'){
				approval_type = 'C';
			}

			for(var i=0; i<$j("#sortApprovalLineSetting").children("li").length; i++){
				approval_line.push($j("#sortApprovalLineSetting").children("li").eq(i).attr("user_no") + "|" + $j("#sortApprovalLineSetting").children("li").eq(i).attr("node_id"));
			}
			
			if(approval_line.length > ApprovalRef._approvalLineNumber[approval_type]){
				alert(approval_msg.getMessage('APPROVAL_SET_MAX_COUNT_'+approval_type).format(ApprovalRef._approvalLineNumber[approval_type]));
				return false;
			}

			$j($j('#'+approval_line_type)).val(approval_line.join(','));

			ApprovalRef.Ajax({
				"pMenu" : "get_approval_line_select_table",
				"pMethod" : 'BCF',
				"pApprovalType" : $j('#tempApprovalType').val(),
				"pFirstLine" : $j('#approval_first_line').val(),
				"pSecondLine" : $j('#approval_second_line').val(),
				"pThirdLine" : $j('#approval_third_line').val(),
				"pCallback" : 'ApprovalRef.resultSaveApprovalLineSelect'
			});
		},
		resultSaveApprovalLineSelect: function(pValue){
			$j('#layerApprovalLineSetting').hidePopup();
			$j('.js-approval-line tr').each(function (index) {
				var thHeight = $j(this).children('th').height();
				$j(this).find('th > div').css({'height' : 'auto'});
				$j(this).find('th > div').css({'line-height' : 'normal'});
				$j(this).children('th').height();
			});
			
			$j('#approval_first_line').val(pValue.first_line);
			$j('#approval_second_line').val(pValue.second_line);
			
			// 데이터 처리 : 나중에 변경 필요
			var $tmpDiv = $j('<div>');
			var firstLine = [];
			var secondLine = [];
			var thirdLine = [];
			$tmpDiv.html(pValue.first_line_table);
			$tmpDiv.find('td.name').not('[scope=col], .team').each(function(key, val){
				var tmpVal = Common.trim($j(val).html());
				if(tmpVal != ''){
					firstLine.push(tmpVal);
				}
			});
			
			$tmpDiv.html(pValue.second_line_table);
			$tmpDiv.find('td.name').not('[scope=col], .team').each(function(key, val){
				var tmpVal = Common.trim($j(val).html());
				if(tmpVal != ''){
					secondLine.push(tmpVal);
				}
			});
			
			$j("#approvalFirstLine").html(firstLine.join('&nbsp;&gt&nbsp;'));
			$j('#approvalSecondLine').html(secondLine.join('&nbsp;&gt&nbsp;'));
			// 데이터 처리 끝

			$j('.js-approval-line tr').each(function (index) {
				var thHeight = $j(this).children('th').height();
				$j(this).find('th > div').css({'height' : (thHeight - 1) + 'px'});
				$j(this).find('th > div').css({'line-height' : (thHeight -1) + 'px'});
				$j(this).children('th').height();
			});
		}
		
		,saveApprovalLine: function(pId, pName)
		{
			if($j("#"+pId).length){
				var approval_line = [];
				for(var i=0; i<$j("#"+pId).children("span").length; i++){
					var old_new = ($j("#"+pId).children("span").eq(i).attr("old_new") !== undefined ? $j("#"+pId).children("span").eq(i).attr("old_new") : 'old');
					approval_line.push($j("#"+pId).children("span").eq(i).attr("user_no") + "|" + $j("#"+pId).children("span").eq(i).attr("node_id") + "|" + old_new);
				}
				$j("input[name='"+pName+"']").val(approval_line.join(","));
			}
		}
		
		// 양식 결재선 설정이 되어있는 경우처리
		,autoSetApprovalLine : function(pNodeId){
			var params = {
					'pMenu' : 'get_approval_form_info',
					'pNo' : $j('#approval_form').val(),
					'pNodeId' : pNodeId,
					'pCallback' : 'ApprovalRef.getApprovalFormInfo'
			}
			ApprovalRef.Ajax(params)
		},
		getApprovalFormInfo : function(pValue){
			var first_line = [];
			var dup_first = [];
			for(var i=0; i<pValue.approval_first_line.length; i++){
				var approval_user = pValue.approval_first_line[i].split('|'); 
				if(approval_user[0] === $j('#use_user_no').val()){
					dup_first.push(i);
				}else{
					first_line.push(pValue.approval_first_line[i]);
				}
			}
			$j('#approval_first_line').val(first_line.join(','));
			
			var second_line = [];
			var dup_second = [];
			for(var i=0; i<pValue.approval_second_line.length; i++){
				var approval_user = pValue.approval_second_line[i].split('|'); 
				if(approval_user[0] === $j('#use_user_no').val()){
					dup_second.push(i);
				}else{
					second_line.push(pValue.approval_second_line[i]);
				}
			}
			$j('#approval_second_line').val(pValue.approval_second_line);
			
			// 데이터 처리 : 나중에 변경 필요
			var $tmpDiv = $j('<div>');
			var firstLine = [];
			var secondLine = [];
			var thirdLine = [];
			$tmpDiv.html(pValue.result);
			$tmpDiv.find('#approvalFirstLine').find('td.name').not('[scope=col], .team').each(function(key, val){
				var tmpVal = Common.trim($j(val).html());
				if(tmpVal != '' && $j.inArray(key, dup_first) === -1){
					firstLine.push(tmpVal);
				}
			});

			$tmpDiv.find('#approvalSecondLine').find('td.name').not('[scope=col], .team').each(function(key, val){
				var tmpVal = Common.trim($j(val).html());
				if(tmpVal != '' && $j.inArray(key, dup_second) === -1){
					secondLine.push(tmpVal);
				}
			});
			
			if(typeof writeVacation === "object"){
				$j('#approval_third_line').val(pValue.approval_third_line);
				$j('#approvalThirdLine').find('span.refer-list').remove();
			}else if(typeof writeTime === "object"){
				if($j('#approval_third_line').val() !== ""){
					thirdLine.push($j('#approval_third_line').val());
				}
				var dup_idx = -1;
				for(var i=0; i<pValue.approval_third_line.length; i++){
					if($j('#approval_third_line').val() !== pValue.approval_third_line[i]){
						thirdLine.push(pValue.approval_third_line[i]);
					}else{
						dup_idx = i;
					}
				}
				$j('#approval_third_line').val(thirdLine.join(','));
			}
			
			$tmpDiv.find('#approvalThirdLine').find('span.refer-list').each(function(key, val){
				if(dup_idx !== undefined && dup_idx !== -1 && dup_idx === key){
					return true;
				}
				if($j(val).html() != ''){
					$j('#approvalThirdLine').append($j(val));
				}
			});
			
			$j('#approvalFirstLine').html(firstLine.join('&nbsp;&gt&nbsp;'));
			$j('#approvalSecondLine').html(secondLine.join('&nbsp;&gt&nbsp;'));
			// 데이터 처리 끝
		},
		
		// 신청/처리 결재선 끝

		// 파일 첨부 시작
		// 파일 첨부 오픈
		fileAttachOpen : function(){
			$j('#file_attach').click();
		},
		
		getAttachedFileSum : function(){
			var sum = 0;
			$j('.js-approval-attach').each(function(index, value){
				if($j(value).attr('size')){
					sum += parseInt($j(value).attr('size'));
				}
			});
			return sum;
		},
		setAttachedFileSum : function(){
			var sum = 0;
			$j('.js-approval-attach').each(function(index, value){
				if($j(value).attr('size')){
					sum += parseInt($j(value).attr('size'));
				}
			});
			
			$j('#attach_filesize_sum').html(ApprovalRef.formatFileSize(sum));
		},
		
		// 용량 포맷
		formatFileSize: function(pSize)
		{
			if(pSize == 0 ) return "0KB";
			pSize = Number(pSize / 1024);
			returnSize = String(pSize.toFixed(1) + "KB");

			if(pSize > 1024)
			{
				pSize = pSize / 1024;
				returnSize = String(pSize.toFixed(1) + "MB");

				if(pSize > 1024)
				{
					pSize = pSize / 1024;
					returnSize = String(pSize.toFixed(1) + "GB");
				}
			}
			return returnSize;
		},
		// 파일 첨부 끝
		
		// 관련 문서 첨부
		getRelatedDocumentLayer: function(){
			ApprovalRef.Ajax({
				"pMenu" : "get_related_document_layer",
				"pCallback" : "ApprovalRef.showRelatedDocumentLayer"
			});
		},
		showRelatedDocumentLayer: function(pValue){
			$j("#wrap").append(pValue.result.replace(/(ApprovalDocument|Approval)[.]/gi, 'ApprovalRef.'));
			$j('#layerRelatedDocument').showPopup();
			$j('#textSearchRelatedDocument').focus();
			ApprovalRef._searchRelatedDocument['all'] = '';
			ApprovalRef.getRelatedDocumentList();
		},
		getRelatedDocumentListByPage: function(pPage)	// 관련문서 페이지 이동
		{
			ApprovalRef._searchRelatedDocument['page'] = pPage === undefined ? 1 : pPage;
			ApprovalRef.getRelatedDocumentList();
		},
		getRelatedDocumentList: function(){	// 관련 문서 리스트
			ApprovalRef.Ajax(ApprovalRef._searchRelatedDocument, false);	
		},
		setTableRelatedDocument: function(pValue){
			approvalRelatedDocumentTable.insertRow(pValue);
			$j('#pageRelatedDocument').html(pValue.paging.replace(/(ApprovalDocument|Approval)[.]/gi, 'ApprovalRef.'));
			//$j('#anchorApprovalType').html("보기: " + pValue.type);
			$j('#anchorApprovalType').html(approval_msg.getMessage('insa_view')+": " + pValue.type);
			
			// ApprovalDocument -> ApprovalRef 수정
			$j('#tableRelatedDocument').html($j('#tableRelatedDocument').html().replace(/(ApprovalDocument|Approval)[.]/gi, 'ApprovalRef.'));
			$j('#textSearchRelatedDocument').focus();
		}
		,searchRelatedDocument: function()	// 관련 문서 검색
		{
			ApprovalRef._searchRelatedDocument['all'] = $j.trim($j('#textSearchRelatedDocument').val());
			ApprovalRef._searchRelatedDocument['page'] = 1;
			ApprovalRef.getRelatedDocumentList();
		}
		,selectRelatedDocument: function(pNo, pStr)	// 관련 문서 선택
		{
			var exist_chk = false;
			$j.each($j('.js-select-realted_document'), function(index, value){
				if($j(value).attr("document_no") === pNo){
					exist_chk = true;
					return;
				}
			});

			if(exist_chk === false){
				$j("#addRelatedDocument").append($j('<span class="docu-list js-select-realted_document" document_no="' + pNo + '">' + decodeURIComponent(pStr) + ' <span class="icon file_delete" onclick="ApprovalRef.removeRelatedDocument(this);"></span></span>'));
			}
		}
		
		,setFavorites: function(pObj, pNo)	// 관련문서 별표표시
		{
			if($j(pObj).length && pNo){
				ApprovalRef.Ajax({
					"pMenu" : "set_favorites",
					"pCheck" : $j(pObj).hasClass("on") ? "N" : "Y",
					"pNo" : pNo,
					"pCallback" : 'ApprovalRef.resultSetFavorites'
				}, false);

				$j(pObj).hasClass("on") ? $j(pObj).removeClass("on") : $j(pObj).addClass("on");
			}
		}
		,resultSetFavorites: function(pValue)
		{
			if(pValue.message){
				alert(pValue.message);
			}
			if(pValue.result === "N"){
				document.location.reload();
			}
		}
		,addRelatedDocument: function()	// 관련 문서 레이어 확인버튼
		{
			var related_document = [];
			$j.each($j(".js-approval-related"), function(index, value){
				related_document.push($j(value).attr("document_no"));
			});

			$j.each($j('.js-select-realted_document'), function(index, value){
				if($j.inArray($j(value).attr("document_no"), related_document) === -1){
					related_document.push($j(value).attr("document_no"));
					$j("#tableApprovalRelated").append($j("<tr><td><div class=\"filename js-approval-related\" document_no=\"" + $j(value).attr("document_no") + "\"><span class=\"icon file\"></span> <a href=\"javascript:void(0)\" class=\"docu-link\">" + $j(value).contents().eq(0).text()+ "</a> <a href=\"javascript:void(0)\" class=\"icon file_delete js-approval-attach-delete\"><span class=\"blind\">파일 삭제</span></a></div></td></tr>"));
				}
			});

			$j('#layerRelatedDocument').hidePopup();
			if(related_document.length > 0){
				$j('#attach_here_txt').hide();
				$j('#attach_filelist_view').show();
			}
		}
		,removeRelatedDocument: function(pObj)
		{
			$j(pObj).parent().remove();
		}
		// 관련 문서 첨부 끝
		
		,checkApprovalLine : function(){
			// 결재선 설정
			if($j('#vacationtime_mode').val() != 'A' && ($j('#approval_first_line').val() == '' || ($j('#approval_first_line').val().split(',').length == 1) && $j('#approval_second_line').val() == '')){
				//alert('결재자를 선택해주셔야 결재가 진행됩니다.');
				alert(approval_msg.getMessage('approval_error_noselect_user'));
				return false;
			}
			return true;
		},
		
		
		// 휴가/근태 결재선 설정
		_approvalFormFirstLine : [],
		_approvalFormSecondLine : [],
		_approvalFormThirdLine : [],
		_approvalFormLine : [],
		_approvalFormLineMatch : {'inputApprovalFormFirstLine':'FIRST', 'inputApprovalFormSecondLine':'SECOND', 'inputApprovalFormThirdLine':'THIRD'},
		
		// 초기화
		initApprovalFormLine : function(){
			this.setApprovalLineByValue('FIRST', $j('#approval_first_line').val());
			this.setApprovalLineByValue('SECOND', $j('#approval_second_line').val());
			this.setApprovalLineByValue('THIRD', $j('#approval_third_line').val());
			autoComplete();
		},
		
		// 초기 값 셋팅
		setApprovalLineByValue : function(pType, pValue){
			if(pValue === '') return;

			var lines = pValue.split(',');
			var temp = [];
			for(var i=0; i<lines.length; i++){
				temp = lines[i].split('|');
				this._approvalFormLine.push(temp[0]);

				if(pType === 'FIRST'){
					this._approvalFormFirstLine.push(lines[i]);
				}else if(pType === 'SECOND'){
					this._approvalFormSecondLine.push(lines[i]);
				}else if(pType === 'THIRD'){
					this._approvalFormThirdLine.push(lines[i]);
				}
			}
		},
		
		getApprovalFormLineType: function(pId){
			return this._approvalFormLineMatch[pId];
		},
		
		getApprovalFormLineTemplate: function(pId, pNo, pNode, pName)
		{
			var approval_line_type = this.getApprovalFormLineType(pId);

			return '<span class="name" user_no="'+pNo+'" node="' +pNode+'" line="' + pId + '">'+pName+' <span class="icon file_delete approval_form_line_delete"></span></span>';
		},
		
		addApprovalFormLineUser: function(pId, pNo, pNode, pName)
		{
			if( $j('#'+pId).length ){
				console.log('addApprovalFormLineUser [' + pId + '] [' + pNo + '] [' + pNode + '] [' + pName + ']');
				if(ApprovalRef.setApprovalFormLine(pId, pNo, pNode) === false){
					//alert('[' + pName + ']는 중복되었습니다.' );
					alert('[' + pName + ']'+approval_msg.getMessage('approval_error_dup_user') );
					return false;
				}
				$j('#'+pId).parent().parent().append(ApprovalRef.getApprovalFormLineTemplate(pId, pNo, pNode, pName));
			}
		},
		
		setApprovalFormLine : function(pId, pNo, pNode){
			if(this.duplicateApprovalFormLine(pNo)) return false;

			this._approvalFormLine.push(pNo);

			var approval_line_type = this.getApprovalFormLineType(pId);
			var approval_line_value = pNo + "|" + pNode;

			if(approval_line_type === 'FIRST'){
				this._approvalFormFirstLine.push(approval_line_value);
			}else if(approval_line_type === 'SECOND'){
				this._approvalFormSecondLine.push(approval_line_value);
			}else if(approval_line_type === 'THIRD'){
				this._approvalFormThirdLine.push(approval_line_value);
			}
		},
		
		duplicateApprovalFormLine : function(pValue){
			return this._approvalFormLine.contains(pValue);
		},
		
		getApprovalLineValueByImplode: function(pValue, pGlue, pIndex)
		{
			pGlue = pGlue === undefined ? '|' : pGlue;
			pIndex = pIndex === undefined ? 0 : pIndex;
			var temp = pValue.split(pGlue);
			return temp[pIndex];
		},
		
		deleteApprovalFormLine : function(pId, pValue){
			console.log('deleteApprovalFormLine [' + pId + '] [' + pValue + ']');
			for(var i=0; i<this._approvalFormLine.length; i++){
				if( this._approvalFormLine[i] === pValue ) this._approvalFormLine.splice(i, 1);
			}

			var approval_line_type = this.getApprovalFormLineType(pId);

			if(approval_line_type === 'FIRST'){
				for(var i=0; i<this._approvalFormFirstLine.length; i++){
					if( this.getApprovalLineValueByImplode(this._approvalFormFirstLine[i]) === pValue ) this._approvalFormFirstLine.splice(i, 1);
				}	
			}else if(approval_line_type === 'SECOND'){
				for(var i=0; i<this._approvalFormSecondLine.length; i++){
					if( this.getApprovalLineValueByImplode(this._approvalFormSecondLine[i]) === pValue ) this._approvalFormSecondLine.splice(i, 1);
				}	
			}else if(approval_line_type === 'THIRD'){
				for(var i=0; i<this._approvalFormThirdLine.length; i++){
					if( this.getApprovalLineValueByImplode(this._approvalFormThirdLine[i]) === pValue ) this._approvalFormThirdLine.splice(i, 1);
				}	
			}
		},
		
		saveApprovalFormLine : function(){
			var form_line_type = $j('#radioApprovalAuto').prop('checked') ? 'A' : 'L';
			
			if(form_line_type === "A" && $j('select[name="selectApprovalFormNodeGrade"]').val() === ''){
				alert('최종 결재할 조직 등급을 선택해주세요.');
				return false;
			}
			
			$j('#approval_first_line_type').val(form_line_type);
			$j('#approval_first_line').val(form_line_type === 'A' ? $j('#selectApprovalFormNodeGrade option:selected').val() : ApprovalRef._approvalFormFirstLine);
			$j('#approval_second_line').val(ApprovalRef._approvalFormSecondLine);
			$j('#approval_third_line').val(ApprovalRef._approvalFormThirdLine);
			
			if(form_line_type !== 'A' && $j('#approval_first_line').val().split(',').length > (ApprovalRef._approvalLineNumber['B'] - 1)){
				alert(approval_msg.getMessage('APPROVAL_SET_MAX_COUNT_B').format(ApprovalRef._approvalLineNumber['B'] - 1));
				return false;
			}else if($j('#approval_second_line').val().split(',').length > ApprovalRef._approvalLineNumber['C']){
				alert(approval_msg.getMessage('APPROVAL_SET_MAX_COUNT_C').format(ApprovalRef._approvalLineNumber['C']));
				return false;
			}else if($j('#approval_third_line').val().split(',').length > ApprovalRef._approvalLineNumber['F']){
				alert(approval_msg.getMessage('APPROVAL_SET_MAX_COUNT_F').format(ApprovalRef._approvalLineNumber['F']));
				return false;
			}
			
			var url = Common.getRoot() + 'insa/manage/vacation_manage/save_approval_form_line';
			var params = {
					'pFirstLineType':$j('#approval_first_line_type').val(),
					'pFirstLine':$j('#approval_first_line').val(),
					'pSecondLine':$j('#approval_second_line').val(),
					'pThirdLine':$j('#approval_third_line').val()
			};
			getAjaxData(url, params, function(data){
				if(data.resultCode === 'SUCCESS'){
					alert(data.message);
					location.reload();
				}else{
					alert(data.message);
				}
			});
		}
		
		,addApprovalLineUser: function(pId, pNo, pNode, pName)
		{
			var approval_method = "BCF";
			var approval_line_id_match = {'inputApprovalFirstLine':'approvalFirstLine', 'inputApprovalSecondLine':'approvalSecondLine', 'inputApprovalThirdLine':'approvalThirdLine', 'inputApprovalFourthLine':'approvalFourthLine'};
			var approval_line_name_match = {'inputApprovalFirstLine':'approval_first_line', 'inputApprovalSecondLine':'approval_second_line', 'inputApprovalThirdLine':'approval_third_line', 'inputApprovalFourthLine':'approval_fourth_line'};
			var approval_line_id = approval_line_id_match[pId];
			var approval_line_name = approval_line_name_match[pId];
			
			if( ($j('#approval_third_line').val().split(',').length + 1) > ApprovalRef._approvalLineNumber['F']){
				alert(approval_msg.getMessage('APPROVAL_SET_MAX_COUNT_F').format(ApprovalRef._approvalLineNumber['F']));
				return false;
			}

			if(this.checkDuplicateApprovalLineUser(pNo, ['approval_first_line', 'approval_second_line', 'approval_third_line'])){
				alert(approval_msg.getMessage('approval_error_already_line_user'));
				return false;
			}

			$j("#"+approval_line_id).append('<span class="refer-list" user_no="'+pNo+'" old_new="new" node_id="'+pNode+'">'+pName+'<span class="icon file_delete js-approval-line-delete"></span></span>');
			this.saveApprovalLine(approval_line_id, approval_line_name);
		}
		
		,initApprovalLineSelect: function()
		{
			var form_no = $j('#approval_form').val();
			
			var first_line = $j("#approval_first_line").val();
			var second_line = $j("#approval_second_line").val();
			var third_line = $j("#approval_third_line").val();

			ApprovalRef.Ajax({
				"pMenu" : "get_approval_line_select_info",
				"pFirstLine" : first_line,
				"pSecondLine" : second_line,
				"pThirdLine" : third_line,
				"pFourthLine" : '',
				"pMethod" : "BCF",
				"pDocumentMode" : "WRITE",
				"pFormNo" : form_no,
				"pCallback" : "ApprovalRef.resultInitApprovalLineSelect"
			});
		}

		,resultInitApprovalLineSelect: function(pValue)
		{
			$j("#sp_selectApprovalFirstLine").html(pValue.first_line.length);
			var approval_method = "BCF";
			for(var i=0; i<pValue.first_line.length; i++){
				var $option = $j('<option></option>', {'value':pValue.first_line[i].value, 'node_id':pValue.first_line[i].node_id, 'text':pValue.first_line[i].text, 'title':pValue.first_line[i].text});
				if(i === 0){
					$option.prop('disabled', true);
					$option.attr('edit', 'N');
				}else{
					if(pValue.first_line[i].title && pValue.first_line[i].title !== ''){
						$option.addClass('bold');
						$option.attr('title', pValue.first_line[i].title);
					}
				}
				$option.attr('old_new', pValue.first_line[i].old_new ? pValue.first_line[i].old_new : 'old');
				$option.attr('enable_delete', pValue.first_line[i].enable_delete ? pValue.first_line[i].enable_delete : 'Y');
				
				$j("#selectApprovalFirstLine").append($option);
			}
			$j("#sp_selectApprovalSecondLine").html(pValue.second_line.length);
			for(var i=0; i<pValue.second_line.length; i++){
				var $option = $j('<option></option>', {'value':pValue.second_line[i].value, 'node_id':pValue.second_line[i].node_id, 'text':pValue.second_line[i].text, 'title':pValue.second_line[i].text});
				if(pValue.second_line[i].title && pValue.second_line[i].title !== ''){
					$option.addClass('bold');
					$option.attr('title', pValue.second_line[i].title);
				}
				$option.attr('old_new', pValue.second_line[i].old_new ? pValue.second_line[i].old_new : 'old');
				$option.attr('enable_delete', pValue.second_line[i].enable_delete ? pValue.second_line[i].enable_delete : 'Y');
				
				$j("#selectApprovalSecondLine").append($option);
			}
			$j("#sp_selectApprovalThirdLine").html(pValue.third_line.length);
			for(var i=0; i<pValue.third_line.length; i++){
				var $option = $j('<option></option>', {'value':pValue.third_line[i].value, 'node_id':pValue.third_line[i].node_id, 'text':pValue.third_line[i].text, 'title':pValue.third_line[i].text});
				if(pValue.third_line[i].title && pValue.third_line[i].title !== ''){
					$option.addClass('bold');
					$option.attr('title', pValue.third_line[i].title);
				}
				$option.attr('old_new', pValue.third_line[i].old_new ? pValue.third_line[i].old_new : 'old');
				if(pValue.third_line[i].value == $j('#use_user_no').val()){
					$option.prop('disabled', true);
					$option.attr('edit', 'N');
				}
				
				$j("#selectApprovalThirdLine").append($option);
			}

			if(pValue.form_enable_delete && pValue.form_enable_delete === 'Y'){
				$j("#selectApprovalLine").show();
				$j("#selectApprovalLine").attr('onchange', 'ApprovalRef.selectApprovalLine();');
				for(var i=0; i<pValue.approval_line.length; i++){
					$j("#selectApprovalLine").append('<option value="'+pValue.approval_line[i].no+'" title="'+pValue.approval_line[i].title+'">'+pValue.approval_line[i].title+'</option>');
				}
			}
			
			if(pValue.toast_message){
				for(var i=0; i<pValue.toast_message.length; i++){
					showNoticeToast(pValue.toast_message[i]);
				}
			}
		}
		
		,selectApprovalLine: function()
		{
			var select_approval_line = $j("#selectApprovalLine").val();

			if(select_approval_line){
				ApprovalRef.Ajax({
					"pMenu" : "select_approval_line",
					"pNo" : select_approval_line,
					"pCallback" : "ApprovalRef.resultSelectApprovalLine"
				});
			}
		}

		,resultSelectApprovalLine: function(pValue)
		{
			if($j('#selectApprovalFirstLine').length > 0){
				document.getElementById('selectApprovalFirstLine').options.length = 1;
				
				for(var i=0; i<pValue.first_line.length; i++){
					if(i === 0 && $j('#regist_user_no').val() == pValue.first_line[i].value){
						$j("#selectApprovalFirstLine").append('<option value="'+pValue.first_line[i].value+'" node_id="'+pValue.first_line[i].node_id+'" old_new="' + pValue.first_line[i].old_new + '" edit="N" disabled>'+pValue.first_line[i].text+'</option>');
					}else{
						if(pValue.first_line[i].value === $j('#use_user_no').val()){
							continue;
						}
						$j("#selectApprovalFirstLine").append('<option value="'+pValue.first_line[i].value+'" node_id="'+pValue.first_line[i].node_id+'" old_new="' + pValue.first_line[i].old_new + '"' + (pValue.first_line[i].title !== "" ? ' class="bold"' : '') + ' title="'+(pValue.first_line[i].title === "" ? pValue.first_line[i].text : pValue.first_line[i].title)+'">'+pValue.first_line[i].text+'</option>');
					}
				}
			}
			if($j('#selectApprovalSecondLine').length > 0){
				document.getElementById('selectApprovalSecondLine').options.length = 0;
				$j("#sp_selectApprovalSecondLine").html(pValue.second_line.length);
				for(var i=0; i<pValue.second_line.length; i++){
					if(pValue.second_line[i].value === $j('#use_user_no').val()){
						continue;
					}
					$j("#selectApprovalSecondLine").append('<option value="'+pValue.second_line[i].value+'" node_id="'+pValue.second_line[i].node_id+'" old_new="' + pValue.second_line[i].old_new + '"' + (pValue.second_line[i].title !== "" ? ' class="bold"' : '') + ' title="'+(pValue.second_line[i].title === "" ? pValue.second_line[i].text : pValue.second_line[i].title)+'">'+pValue.second_line[i].text+'</option>');
				}
			}
			if($j('#selectApprovalThirdLine').length > 0){
				document.getElementById('selectApprovalThirdLine').options.length = 0;
				$j("#sp_selectApprovalThirdLine").html(pValue.third_line.length);
				for(var i=0; i<pValue.third_line.length; i++){
					if(pValue.third_line[i].value === $j('#use_user_no').val()){
						continue;
					}
					$j("#selectApprovalThirdLine").append('<option value="'+pValue.third_line[i].value+'" node_id="'+pValue.third_line[i].node_id+'" old_new="' + pValue.third_line[i].old_new + '"' + (pValue.third_line[i].title !== "" ? ' class="bold"' : '') + ' title="'+(pValue.third_line[i].title === "" ? pValue.third_line[i].text : pValue.third_line[i].title)+'">'+pValue.third_line[i].text+'</option>');
				}
			}
			if($j('#selectApprovalFourthLine').length > 0){
				document.getElementById('selectApprovalFourthLine').options.length = 0;
				$j("#sp_selectApprovalFourthLine").html(pValue.fourth_line.length);
				for(var i=0; i<pValue.fourth_line.length; i++){
					if(pValue.fourth_line[i].value === $j('#use_user_no').val()){
						continue;
					}
					$j("#selectApprovalFourthLine").append('<option value="'+pValue.fourth_line[i].value+'" node_id="'+pValue.fourth_line[i].node_id+'" old_new="' + pValue.fourth_line[i].old_new + '"' + (pValue.fourth_line[i].title !== "" ? ' class="bold"' : '') + ' title="'+(pValue.fourth_line[i].title === "" ? pValue.fourth_line[i].text : pValue.fourth_line[i].title)+'">'+pValue.fourth_line[i].text+'</option>');
				}
			}
			
			if(pValue.toast_message){
				for(var i=0; i<pValue.toast_message.length; i++){
					showNoticeToast(pValue.toast_message[i]);
				}
			}
		}
		
		,saveApprovalLineSelect: function()
		{
			var first_line = [], second_line = [], third_line = [], fourth_line = [];

			if($j('#selectApprovalFirstLine').length > 0){
				for(var i=0; i<document.getElementById("selectApprovalFirstLine").options.length; i++){
					if(document.getElementById("selectApprovalFirstLine").options[i].value === $j('#use_user_no').val()){
						continue;
					}
					first_line.push(document.getElementById("selectApprovalFirstLine").options[i].value + "|" + document.getElementById("selectApprovalFirstLine").options[i].getAttribute("node_id") + "|" + document.getElementById("selectApprovalFirstLine").options[i].getAttribute("old_new"));
				}
			}
			if($j('#selectApprovalSecondLine').length > 0){
				for(var i=0; i<document.getElementById("selectApprovalSecondLine").options.length; i++){
					if(document.getElementById("selectApprovalSecondLine").options[i].value === $j('#use_user_no').val()){
						continue;
					}
					second_line.push(document.getElementById("selectApprovalSecondLine").options[i].value + "|" + document.getElementById("selectApprovalSecondLine").options[i].getAttribute("node_id") + "|" + document.getElementById("selectApprovalSecondLine").options[i].getAttribute("old_new"));
				}
			}
			if($j('#selectApprovalThirdLine').length > 0){
				var hasCoworker = false;
				for(var i=0; i<document.getElementById("selectApprovalThirdLine").options.length; i++){
					if(document.getElementById("selectApprovalThirdLine").options[i].value === $j('#use_user_no').val()){
						hasCoworker = true;
					}
					third_line.push(document.getElementById("selectApprovalThirdLine").options[i].value + "|" + document.getElementById("selectApprovalThirdLine").options[i].getAttribute("node_id") + "|" + document.getElementById("selectApprovalThirdLine").options[i].getAttribute("old_new"));
				}
				if($j('#use_user_no').val() !== "" && hasCoworker === false){
					third_line.push($j('#use_user_no').val() + "|" + $j('#use_user_node_id').val() + "|new");
				}
			}

			if(first_line.length > ApprovalRef._approvalLineNumber['B']){
				alert(approval_msg.getMessage('APPROVAL_SET_MAX_COUNT_B').format(ApprovalRef._approvalLineNumber['B']));
				return false;
			}
			if(second_line.length > ApprovalRef._approvalLineNumber['C']){
				alert(approval_msg.getMessage('APPROVAL_SET_MAX_COUNT_C').format(ApprovalRef._approvalLineNumber['C']));
				return false;
			}
			if(third_line.length > ApprovalRef._approvalLineNumber['F']){
				alert(approval_msg.getMessage('APPROVAL_SET_MAX_COUNT_F').format(ApprovalRef._approvalLineNumber['F']));
				return false;
			}
			
			ApprovalRef.Ajax({
				"pMenu" : "get_approval_line_select_table",
				"pMethod" : "BCF",
				"pApprovalType" : "ALL",
				"pDocumentNo" : null,
				"pDocumentMode" : 'WRITE',
				"pFirstLine" : first_line.join(","),
				"pSecondLine" : second_line.join(","),
				"pThirdLine" : third_line.join(","),
				"pFourthLine" : fourth_line.join(","),
				"pFormNo" : $j('#approval_form').val(),
				"pCallback" : "ApprovalRef.setApprovalLineSelectTable"
			});

			return true;
		}
		
		,setApprovalLineSelectTable : function(pValue)
		{
			$j('.js-approval-line tr').each(function (index) {
				var thHeight = $j(this).children('th').height();
				$j(this).find('th > div').css({'height' : 'auto'});
				$j(this).find('th > div').css({'line-height' : 'normal'});
				$j(this).children('th').height();
			});
			
			$j('#approval_first_line').val(pValue.first_line);
			$j('#approval_second_line').val(pValue.second_line);
			$j('#approval_third_line').val(pValue.third_line);
			
			// 데이터 처리 : 나중에 변경 필요
			var $tmpDiv = $j('<div>');
			var firstLine = [];
			var secondLine = [];
			var thirdLine = [];
			$tmpDiv.html(pValue.first_line_table);
			$tmpDiv.find('td.name').not('[scope=col], .team').each(function(key, val){
				var tmpVal = Common.trim($j(val).html());
				if(tmpVal != ''){
					firstLine.push(tmpVal);
				}
			});
			
			$tmpDiv.html(pValue.second_line_table);
			$tmpDiv.find('td.name').not('[scope=col], .team').each(function(key, val){
				var tmpVal = Common.trim($j(val).html());
				if(tmpVal != ''){
					secondLine.push(tmpVal);
				}
			});
			
			$j("#approvalFirstLine").html(firstLine.join('&nbsp;&gt&nbsp;'));
			$j('#approvalSecondLine').html(secondLine.join('&nbsp;&gt&nbsp;'));
			
			$tmpDiv.html(pValue.third_line_table);
			$j('#approvalThirdLine').find('span.refer-list').remove();
			$tmpDiv.find('span.refer-list').each(function(key, val){
				if($j(val).html() != ''){
					$j('#approvalThirdLine').append($j(val));
				}
			});
			// 데이터 처리 끝

			$j('.js-approval-line tr').each(function (index) {
				var thHeight = $j(this).children('th').height();
				$j(this).find('th > div').css({'height' : (thHeight - 1) + 'px'});
				$j(this).find('th > div').css({'line-height' : (thHeight -1) + 'px'});
				$j(this).children('th').height();
			});
			
			addressbook.closeAddressbook();
		}
};

$j(document).ready(function(){
	// 파일 첨부
	if($j('#file_attach').length){
		$j('#file_attach').fileupload({
			url : Common.getRoot() + 'approval/upload_file/attach',
			dataType : 'json',
			paramName : 'approval_attach',
			add : function(e, data){
				var isValid = true;
				
				var total_size = ApprovalRef.getAttachedFileSum();
				for(var i=0; i<data.originalFiles.length; i++)
				{
					total_size += data.originalFiles[i].size;
				}
				
				var uploadFile = data.files[0];
				if(uploadFile.size > 50 * 1024 * 1024 || total_size > 50 * 1024 * 1024){
					//alert('파일 첨부는 50MB까지입니다.');
					alert(approval_msg.getMessage('approval_error_attach_size'));
					isValid = false;
				}
				
				if($j('.js-approval-attach').length >= 10){
					//alert('파일 첨부는 10개까지입니다.');
					alert(approval_msg.getMessage('approval_error_attach_qty'));
					isValid = false;
				}
				
				if(isValid){
					data.submit();
				}else{
					return false;
				}
			},
			progressall : function(e, data){
				Common._createProgress();
			},
			done : function(e, data){
				Common._closeProgress();
				
				if($j('.js-approval-attach').length >= 10){
					//alert('파일 첨부는 10개까지입니다.');
					alert(approval_msg.getMessage('approval_error_attach_qty'));
					return;
				}
				
				$j('#attach_here_txt').hide();		// 여기로 ... 텍스트
				$j('#attach_filesize').show();		// 용량
				$j('#attach_filelist_view').show();	// 업로드 파일 리스트

				if(data.result.resultCode == RT_OK){
					$j('#attach_filelist_table').append('<tr><td>' + data.result.text + '</td></tr>');
				}
				
				ApprovalRef.setAttachedFileSum();
			},
			fail : function(e, data){
				Common._closeProgress();
				alert('서버와 통신 중 문제가 발생했습니다. 다시 시도해주시기 바랍니다.');
			},
			drop : function(e, data){
				
			},
			dropZone : $j('#dragZone')
		});
		
		$j('#dragZone')
			.on('drag dragstart dragend dragover dragenter dragleave drop', function(e){
				e.preventDefault();
				e.stopPropagation();
			})
			.on('dragover dragenter', function(){
				$j('#dragZone').addClass('drag');
			})
			.on('dragleave dragend drop', function(){
				$j('#dragZone').removeClass('drag');
			});
		
		$j(document).on('click', '.js-approval-attach-delete', function(){
			$j(this).closest('tr').remove();
			
			if($j('.js-approval-attach-delete').length === 0 && $j('.js-approval-related').length === 0){
				$j('#attach_here_txt').show();		// 여기로 ... 텍스트
				$j('#attach_filesize').hide();		// 용량
				$j('#attach_filelist_view').hide();	// 업로드 파일 리스트
			}
			
			ApprovalRef.setAttachedFileSum();
		});
		
		// 관련문서 첨부
		// 검색기능
		$j(document).on('keydown', '#textSearchRelatedDocument', function(e){
			if(e.keyCode == 13){
				e.preventDefault();
				e.stopPropagation();
				ApprovalRef._searchRelatedDocument['page'] = 1;
				ApprovalRef.searchRelatedDocument();
			}
		});
		// 보기 : 모든 문서
		$j(document).on('click', '.js-approval-btn-box-mode', function(){
			if($j('#menuApprovalTypeMode li').find('.active').length === 0){
				$j('.js-approval-li-types:first').addClass('active');
			}
			if($j(this).parent().children('ul').hasClass('dropdown-menu')){
				$j(this).parent().children('ul').toggleClass('show');
			}
		});
		// 보기 : 모든 문서	
		$j(document).on('blur', '.js-approval-box-type', function(){
			if($j('#menuApprovalTypeMode').hasClass('show')){
				$j('#menuApprovalTypeMode').toggleClass('show');
			}
		});
		$j(document).on('mousedown', '.js-approval-li-types', function(e){
			e.preventDefault();
			$j('.js-approval-li-types').removeClass('active');
			$j(this).addClass('active');
			//$j('#anchorApprovalType').html('보기: '+$j(this).text());
			$j('#anchorApprovalType').html(approval_msg.getMessage('insa_view')+': '+$j(this).text());
			$j('#menuApprovalTypeMode').toggleClass('show');
			ApprovalRef._searchRelatedDocument['type'] = $j(this).attr('value');
			ApprovalRef.getRelatedDocumentList();
		});
		
		autoComplete();
		
		$j(document).on('click', '.js-approval-line-delete', function(){
			if($j('#use_user_no').val() === $j(this).parent().attr('user_no')){
				alert('동료의 휴가 또는 근태를 대신 신청하는 경우, 사용자(동료)는 자동으로 참조 결재선으로 포함되며, 삭제할 수 없습니다.');
				return false;
			}
			$j(this).parent().remove();
			ApprovalRef.saveApprovalLine('approvalThirdLine', 'approval_third_line');
		});
	}
});