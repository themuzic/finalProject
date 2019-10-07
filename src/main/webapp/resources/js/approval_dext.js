approvalClass = function()
{
	_this = this;
	this._approvalLineNumber = {'A':21, 'B':20, 'C':20, 'D':63, 'E':28, 'F':100, 'G':100, 'H':100, 'I':100}
	this._documentMode = null;
	this._documentExtraMode = null;
	this._writeType = null;
	this._defaultFontFamily = '맑은 고딕';
	this._defaultFontSize = '16px';
	this._defaultLineHeight = '1.8';
}

approvalClass.prototype = {
	Ajax: function(pParam, pFlag, pSync)
	{
		if(pFlag === undefined){
			Common._createBackGround();
			Common._createProgress();
		}

		if(pSync == undefined) pSync = true;

		getAjaxData(Common.getRoot() + 'approval/document_ajax/', pParam, Approval.AjaxCallback, pSync);
	}
	
	,AjaxCallback: function(pValue)
	{
		if( pValue.layerID.indexOf("setApprovalCount") < 0 ){
			Common._closeProgress();
			Common._closeBackGround();
		}

		if (pValue.resultCode == RT_OK)
		{
			var methods = (new Function('return ' + pValue.layerID))();
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
			return;

		}
	}

	,getApprovalLineNumber: function(pApprovalType)
	{
		if(pApprovalType !== undefined && this._approvalLineNumber[pApprovalType]){
			return this._approvalLineNumber[pApprovalType];
		}

		return 0;
	}

	,getApprvalCount: function()
	{
		this.Ajax({
			"pMenu"	: "get_approval_count",
			"pCallback" : "Approval.setApprovalCount"
		}, false);
	}

	,setApprovalCount: function(pValue)
	{
		if(pValue.result.w) $j('#js-approval-lists-wait').html(pValue.result.w).show();
		else $j('#js-approval-lists-wait').hide();
		if(pValue.result.e) $j('#js-approval-lists-expect').html(pValue.result.e).show();
		else $j('#js-approval-lists-expect').hide();
		if(pValue.result.p) $j('#js-approval-lists-progress').html(pValue.result.p).show();
		else $j('#js-approval-lists-progress').hide();
		if(pValue.result.r) $j('#js-approval-lists-refer').html(pValue.result.r).show();
		else $j('#js-approval-lists-refer').hide();
		if(pValue.result.s) $j('#js-approval-lists-share').html(pValue.result.s).show();
		else $j('#js-approval-lists-share').hide();
		if(pValue.result.c) $j('#js-approval-lists-complete').html(pValue.result.c).show();
		else $j('#js-approval-lists-complete').hide();
		if(pValue.result.a) $j('#js-approval-lists-all').html(pValue.result.a).show();
		else $j('#js-approval-lists-all').hide();
		if(pValue.result.v) $j('#js-approval-lists-view-check').html(pValue.result.v).show();
		else $j('#js-approval-lists-view-check').hide();
	}

	,toggleMenu: function(menuId){
		$j("#" + menuId).find('.icon.fold').hasClass("open") ? setCookie(menuId, 0, 365) : setCookie(menuId, 1, 365);
	}

	// get_url_value
	,getUrlValue: function(query)
	{
		if(Common.getIEVersion() !== false && Common.getIEVersion() < 10){
			var query = (query === undefined ? window.location.hash.substring(2) : query);
		}else{
			var query = (query === undefined ? window.location.search.substring(1) : query);
		}
		var vars = query.split("&");
		var params = {};

		for(var i=0; i<vars.length; i++){
			var pair = vars[i].split("=");
			if(pair[1] !== undefined && pair[1] !== "" && pair[0] !== "_suid"){
				params[pair[0]] = pair[1];
			}
		}

		return params;
	}

	// get_url_query
	,getUrlQuery: function(params)
	{
		var query = [];
		if(typeof params === 'object'){
			console.log(params);
			$j.each(params, function(index, value){
				if(index !== undefined && value !== undefined && value !== "" && index !== "_suid"){
					query.push(index + "=" + value);
				}
			});
		}

		return query.join('&'); 
	}

	,pushState: function(pData)
	{
		var url_value = Approval.getUrlValue();
		url_value = $j.extend(url_value, pData)
		var url_query = Approval.getUrlQuery(url_value);

		History.pushState({path: url_query}, document.title, '?' + url_query);
	}

	,upUser: function(pId)
	{
		var selectBoxListObj = document.getElementById(pId);
		for ( var k = 1 ; k < selectBoxListObj.options.length ; k++ ){
			if ( selectBoxListObj.options[ k ].selected )
			{
				if ( selectBoxListObj.options[ k -1 ].selected )
					continue;
				else
					this.swapUser(selectBoxListObj, k, k-1);
			}
		}
	}

	,downUser: function(pId)
	{
		var selectBoxListObj = document.getElementById(pId);
		for ( var k = selectBoxListObj.options.length-2 ; k >= 0 ; k-- ) 
		{ 
			if ( selectBoxListObj.options[ k ].selected ) 
			{
				if ( selectBoxListObj.options[ k+1 ].selected ) 
					continue; 
				else
					this.swapUser(selectBoxListObj, k, k+1); 
			}
		}
	}

	,swapUser: function(selectBoxListObj, k, j)
	{
		// 결재선에 포함된 인원 중 수정이 불가능하면 순서또한 불가능
		if(selectBoxListObj.options[ k ].getAttribute('edit') == 'N' || selectBoxListObj.options[ j ].getAttribute('edit') == 'N'){
			return;
		}
		// 각 자리에 있는 Option객체를 임시 변수에 담는다.
		var k_new_option = selectBoxListObj.options[ k ];
		var j_new_option = selectBoxListObj.options[ j ];

		// 원래 k,j 자리에 껍데기만 있는 Option 객체를 대입한다.
		selectBoxListObj.options[ k ] = new Option();
		selectBoxListObj.options[ j ] = new Option();

		// k->j,   j->k 로 서로 다른 곳에 객체를 대입한다.
		selectBoxListObj.options[ k ] = j_new_option;
		selectBoxListObj.options[ j ] = k_new_option;
	}

	,addUser: function(pId)
	{
		var chk_user = true; // 선택된 사용자중에 조직이 중복되는 사용자가 있는지 체크
		var chk_user_arr = new Array(); // 정상적인 사용자
		var confirm_user_arr = new Array(); // 조직이 중복된 사용자
		var node_id = "";

		if (document.getElementById("rightList").selectedIndex > -1){
			
			var approval_method = '';
			if(typeof ApprovalDocument === "object"){
				approval_method = ApprovalDocument._approvalMethod;
			}else if(typeof ApprovalProcess === "object"){
				approval_method = ApprovalProcess._approvalMethod;
			}else if(typeof ApprovalRef === "object"){
				approval_method = 'BCF';
			}else{
				if($j('#div_approval_view_one:visible').length){
					approval_method = 'ADEF';
				}else if($j('#div_approval_view_two:visible').length){
					approval_method = 'BCF';
				}else if($j('#div_approval_view_three:visible').length){
					approval_method = 'I';
				}else if($j('#div_approval_view_four:visible').length){
					approval_method = 'AFGHI';
				}
			}
			
			var methods = approval_method.split('');
			var approval_type = '';
			if(pId === 'selectApprovalFirstLine'){
				approval_type = methods[0];
			}else if(pId === 'selectApprovalSecondLine'){
				approval_type = methods[1];
			}else if(pId === 'selectApprovalThirdLine'){
				approval_type = methods[2];
			}else if(pId === 'selectApprovalFourthLine'){
				approval_type = methods[3];
			}
			
			var minus = 0;
			if($j.inArray(approval_type, ['A', 'B']) !== -1 && typeof ApprovalPerson === "object"){
				minus = 1;
			}
			
			if(($j('#rightList option:selected').length + $j('#' + pId).children('option').length) > Approval._approvalLineNumber[approval_type] - minus){
				alert(ApprovalLang.getMessage('APPROVAL_SET_MAX_COUNT_'+approval_type).format(Approval._approvalLineNumber[approval_type] - minus));
				return;
			}
			
			for(var i=0 ; i<document.getElementById("rightList").options.length ; ++i){
				if (document.getElementById("rightList").options[i].selected){
					if( this.checkUser(document.getElementById("rightList").options[i].value) === false ){
						alert(ApprovalLang.getMessage('APPROVAL_DUPLICATED_APPROVER'));
						continue;
					}

					if(typeof ApprovalDocument === "object"){
						/*if( ApprovalDocument.checkDuplicateApprovalLineUser(document.getElementById("rightList").options[i].value, 'approval_fourth_line') ){
							alert(ApprovalLang.getMessage('APPROVAL_DUPLICATED_APPROVER') + "(" + ApprovalLang.getMessage('APPROVAL_LINE_TYPE_F') + ")");
							continue;
						}*/
						
						if(ApprovalDocument._approvalMethod === "I"){	// 결재양식이 회람인 경우 기안자 중복체크
							if(ApprovalDocument._registerNo === document.getElementById("rightList").options[i].value){
								alert(ApprovalLang.getMessage('APPROVAL_NO_ADD_WRITER'));
								continue;
							}
						}
					}else if(typeof ApprovalPerson === "object"){
						
					}else if(typeof ApprovalProcess === "object"){
						if(ApprovalProcess._approvalMethod === "I"){	// 결재양식이 회람인 경우 기안자 중복체크
							if(ApprovalProcess._registerNo === document.getElementById("rightList").options[i].value){
								alert(ApprovalLang.getMessage('APPROVAL_NO_ADD_WRITER'));
								continue;
							}
						}
					}
					
					node_id = document.getElementById("rightList").options[i].getAttribute("node_id").split(",");

					if(node_id.length > 1){ // 다중 조직일 경우 예외처리 필요함. 일단은 첫번째 node_id 로 처리함.
						confirm_user_arr.push(document.getElementById("rightList").options[i].value);
					}else{
						chk_user_arr.push(i);
					}
				}
			}

			var approval_line_chk = false;

			if(approval_line_chk){
				alert(ApprovalLang.getMessage('APPROVAL_EXIST_USER'));
				return false;
			}
			

			for(var i=0; i<chk_user_arr.length; i++){
				var num = chk_user_arr[i];
				var oOption = new Option(document.getElementById("rightList").options[num].text, document.getElementById("rightList").options[num].value);
				oOption.title = document.getElementById("rightList").options[num].title;
				node_id = document.getElementById("rightList").options[num].getAttribute("node_id").split(",")
				oOption.setAttribute("node_id", node_id[0]);
				oOption.setAttribute("old_new", 'new');
				document.getElementById(pId).options.add(oOption);
				addressbook._increaseCount("sp_"+pId);
			}

			if(confirm_user_arr.length > 1){
				alert(ApprovalLang.getMessage('APPROVAL_MULTI_NODE_USER'));
			}else if(confirm_user_arr.length == 1){
				Approval.Ajax({
					"pMenu"	: "get_user_info",
					"pNo" : confirm_user_arr[0],
					"pNodeId" : node_id,
					"pId" : pId,
					"pCallback" : "Approval.showmultiNodeUser"
				}, false);	
			}
		}
	}

	,multiNodeUser: function()
	{
				
	}

	,showmultiNodeUser: function(pValue)
	{
		$j("#multiNodeUser").html(pValue.text);
		$j("#multiNodeUser").attr("select_id", pValue.id);

		var tbl  = document.getElementById("tableMultiNode");
		for(var i=(tbl.rows.length-1) ; i>=0; --i){
			tbl.deleteRow(i);
		}

		var row = null, cell = null;
		for(var i=0; i<pValue.result.length; i++){
			row = tbl.insertRow(-1);
			cell = row.insertCell(-1);
			cell.innerHTML = '<label><input type="radio" name="radioMultiNode" value="' + pValue.result[i].office_user_no + '" node_id="' + pValue.result[i].node_id + '" node_name="' + pValue.result[i].node_name + '"></label>';
			cell = row.insertCell(-1);
			cell.innerHTML = pValue.result[i].nodes;
		}

		$j("input:radio[name='radioMultiNode']").eq(0).prop("checked", true);
		$j('#layerMultiNode').show();
	}

	,selectMultiNodeUser: function()
	{
		if($j("input:radio[name='radioMultiNode']:checked").length === 0){
			alert(ApprovalLang.getMessage('APPROVAL_SELECT_NODE'));
			return;
		}

		var select_id = $j("#multiNodeUser").attr("select_id");
		var user_no = $j("input:radio[name='radioMultiNode']:checked").val();
		var node_id = $j("input:radio[name='radioMultiNode']:checked").attr("node_id");
		var node_name = $j("input:radio[name='radioMultiNode']:checked").attr("node_name");
		var temp = $j("#multiNodeUser").html().split('&nbsp;');
		var user_name = temp[1];
		var position_name = temp[0] === "" ? "" : ":" + temp[0];
		var text = user_name + " " + "(" + node_name +  position_name + ")";

		var oOption = new Option(text, user_no);
		oOption.title = text;
		oOption.setAttribute("node_id", node_id);
		oOption.setAttribute("old_new", 'new');
		document.getElementById(select_id).options.add(oOption);
		addressbook._increaseCount("sp_"+select_id);

		$j('#layerMultiNode').hide();
	}

	,deleteUser: function(pId)
	{
		if (document.getElementById(pId).selectedIndex > -1)
		{
			for(var i=(document.getElementById(pId).options.length-1) ; i>=0 ; --i)
			{
				if (document.getElementById(pId).options[i].selected)
				{
					if(document.getElementById(pId).options[i].getAttribute('edit') !== null){
						if(document.getElementById(pId).options[i].getAttribute('edit') == "N"){
							return;
						}
					}
					if(document.getElementById(pId).options[i].getAttribute('del') !== null){
						if(document.getElementById(pId).options[i].getAttribute('del') == "N"){
							return;
						}
					}
					if(document.getElementById(pId).options[i].getAttribute('enable_delete') !== null){
						if(document.getElementById(pId).options[i].getAttribute('enable_delete') == "N"){
							showNoticeToast('지정 결재자는 삭제할 수 없습니다.');
							return;
						}
					}

					document.getElementById(pId).remove(i);
					addressbook._decreaseCount("sp_"+pId);
				}
			}
		}
	}

	,checkUser: function(pNo)
	{
		var checkFlag = true;

		$j.each(['selectApprovalFirstLine', 'selectApprovalSecondLine', 'selectApprovalThirdLine', 'selectApprovalFourthLine'], function(index, value){
			if($j('#' + value).length > 0){
				for(var j=0 ; j<document.getElementById(value).options.length ; ++j)
				{
					if (document.getElementById(value).options[j].value == pNo)
					{
						checkFlag = false;
						return false;
					}
				}
			}
		});

		return checkFlag;
	}

	,formatFileSize: function(pSize)
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
	}

	,insertEditorImage: function(pData)
	{
		CKEDITOR.instances.editorContent.insertHtml(pData);
		CKEDITOR.dialog.getCurrent().hide();
	}

	,insertEditorRuleImage: function(pData)
	{
		CKEDITOR.instances.editorRuleContent.insertHtml(pData);
		CKEDITOR.dialog.getCurrent().hide();
	}

	,setFavorites: function(pObj, pNo)
	{
		if($j(pObj).length && pNo){
			Approval.Ajax({
				"pMenu" : "set_favorites",
				"pCheck" : $j(pObj).hasClass("on") ? "N" : "Y",
				"pNo" : pNo,
				"pCallback" : "Approval.resultSetFavorites"
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

	,getSearchLayer: function()
	{
		$j('#searchApprovalState').hide();

		Approval.Ajax({
			"pMenu" : "get_search_document_layer",
			"pCallback" : "Approval.showSearchLayer"
		});
	}

	,showSearchLayer: function(pValue)
	{
		$j("#wrap").append(pValue.result);
		$j('#layerSearchDocument').showPopup();
	}

	,searchDocumentBox: function()
	{
		var search_state = {};
		
		if($j('#textApprovalRegister').val() !== ""){
			search_state.register = encodeURIComponent($j('#textApprovalRegister').val());
		}
		if($j('#textApprovalNode').val() !== ""){
			search_state.node_name = encodeURIComponent($j('#textApprovalNode').val());
		}
		if($j('#textApprovalDocumentTitle').val() !== ""){
			search_state.title = encodeURIComponent($j('#textApprovalDocumentTitle').val());
		}
		if($j('#textDocumentCode').val() !== ""){
			search_state.document_code = encodeURIComponent($j('#textDocumentCode').val());
		}
		if($j('#textApprovalForm').val() !== ""){
			search_state.form = encodeURIComponent($j('#textApprovalForm').val());
		}
		if($j('#textStartDate').val() !== ""){
			search_state.start_date = encodeURIComponent($j('#textStartDate').val());
		}
		if($j('#textEndDate').val() !== ""){
			search_state.end_date = encodeURIComponent($j('#textEndDate').val());
		}
		if($j('#textStartDate').val() !== "" && $j('#textEndDate').val() !== "" && $j('#textStartDate').val() > $j('#textEndDate').val()){
			alert(ApprovalLang.getMessage('APPROVAL_SET_WRITE_DATE'));
			return;
		}

		if(Object.keys(search_state).length === 0){
			alert(ApprovalLang.getMessage('APPROVAL_WRITE_SEARCH_STATE'));
			return;
		}

		$j.each(['register', 'node_name', 'title', 'document_code', 'start_date', 'end_date', 'type', 'form', 'level', 'box', 'all'], function(){
			if(search_state[this] === undefined){
				search_state[this] = "";
			}
		});
		search_state.page = '';
		Approval.pushState(search_state);

		$j('#layerSearchDocument').hidePopup();
	}

	,searchBar: function(pKey, pValue)
	{
		if(pKey !== undefined && pValue !== undefined && pKey !== "" && pValue !== ""){
			var search_state = {};
			$j.each(_this._boxSearchState, function(index, value){
				if(pKey === value){
					search_state[value] = encodeURIComponent(pValue);
				}else{
					search_state[value] = '';
				}
			});
			
			search_state.page = '';
			Approval.pushState(search_state);
		}
	}

	,resetDocumentBoxList: function(pType)
	{
		var search_state = {};
			
		if(pType === 'ALL'){
			// 초기화
			$j.each(_this._boxSearchState, function(index, value){
				search_state[value] = '';
			});
		}else if(pType === 'date'){
			search_state['start_date'] = '';
			search_state['end_date'] = '';
		}else{
			search_state[pType] = '';
		}

		search_state.page = '';
		Approval.pushState(search_state);
	}

	,closeApprovalNotice: function()
	{
		if($j('#chkApprovalNoticeDisplay').length > 0){
			if($j('#chkApprovalNoticeDisplay').prop("checked")){
				setCookie("cookie_approval_notice", "1", 365);
			}
			$j('#layerApprovalNotice').hidePopup();
		}
	}
	
	,receivePostMessage : function(event)
	{
		console.log('receivePostMessage');
		console.log(event);
		if(event.data){
			
			if($j('#alphaDiv').length > 0 || $j('#progressDiv').length > 0){
				Common._closeProgress();
				Common._closeBackGround();
			}
			
			try
			{
				var jsonData = JSON.parse(event.data);
				
				if(jsonData && typeof jsonData === "object"){
					console.log(jsonData);
					
					if($j.inArray(jsonData.mode, ['sign', 'delete']) !== -1){
						ApprovalProcess._dataProcessing = false;
						Approval.setApprovalGabiaLog('receive', jsonData.mode, jsonData.result, event.data);
					}
					
					if(jsonData.mode === 'add' || jsonData.mode === 'modify' || jsonData.mode === 'temp'){ 
						if(jsonData.result === 'ok'){
							var document_mode = '';
							if(jsonData.mode === 'add'){
								document_mode = 'WRITE';
							}else if(jsonData.mode === 'modify'){
								document_mode = 'MODIFY';
							}else if(jsonData.mode === 'temp'){
								document_mode = 'TEMP';
							}
							ApprovalDocument.saveDocumentProcess(document_mode);
						}else if(jsonData.result === 'duzon_true' || jsonData.result === 'acc_true'){
							if($j("input[name='approval_third_line']").val() === ""){
								alert('송금 요청 내역이 있으면 재무합의가 한 명 이상이 포함되어야 합니다.');
								return;
							}
							var sendMsg = {};
							sendMsg.mode = jsonData.mode;
							if(jsonData.result === 'duzon_true'){
								sendMsg.duzon_sign = 'ok';
							}else{
								sendMsg.acc_sign = 'ok';
							}
							
							console.log(sendMsg);
							Approval.sendPostMessage(JSON.stringify(sendMsg));
						}
					}else if(jsonData.mode === 'delete'){
						if(jsonData.result === 'ok'){
							if(Approval._redirectUrl){
								document.location.href = Approval._redirectUrl;
							}else{
								document.location.reload();
							}
						}else{
							alert("처리 도중 에러가 발생하였습니다.");
							document.location.reload(true);
						}
					}else if(jsonData.mode === 'sign'){
						if(jsonData.result === 'ok'){
							if(Approval._redirectUrl){
								document.location.href = Approval._redirectUrl;
							}else{
								document.location.reload();
							}
						}else{
							alert("처리 도중 에러가 발생하였습니다.");
							document.location.reload(true);
						}
					}else if(jsonData.mode === 'resize'){
						if(jsonData.w){
							$j('#approval_iframe_content').css("width", jsonData.w);
						}
						if(jsonData.h){
							$j('#approval_iframe_content').css("height", jsonData.h);
						}
					}else if(jsonData.mode === 'print'){
						if(jsonData.result === 'ok'){
							ApprovalProcess._gabiaIframePrintData = jsonData.print_data
						}else{
							
						}
					}else if(jsonData.mode === 'doc_view'){
						if(jsonData.result === 'ok'){
							
							$j('#approval_iframe_preview_content').parent().html('<link rel="stylesheet" type="text/css" href="/static/css/approval/style_gabia_ea.css" />' + jsonData.doc);
						}else{
							
						}
					}else if(jsonData.mode === 'preview'){
						if(jsonData.result === 'ok'){
							$j(Approval._previewWindow.document.body).find('#approval_content').html(jsonData.doc);
						}else{
							
						}
					}
					
					if(jsonData.subject){
						$j('input[name="approval_document_title"]').val(jsonData.subject);
					}
				}
			}
			catch(e)
			{
				console.log(e);
			}
		}
	}

	,sendPostMessage : function(message, iframe)
	{
		var msgData = JSON.parse(message);
		if(msgData.mode === 'sign' || msgData.mode === 'add' || msgData.mode === 'modify' || msgData.mode === 'delete'){
			Common._createBackGround();
			Common._createProgress();
		}
		
		iframe = iframe === undefined ? 'approval_iframe_content' : iframe;
		var iframeWindow = document.getElementById(iframe).contentWindow;
		console.log('sendPostMessage');
		console.log(message);
		iframeWindow.postMessage(message, '*');
		Approval.setApprovalGabiaLog('send', msgData.mode, 'ok', message);
	}
	
	,setApprovalGabiaLog : function(pType, pMode, pResult, pMessage)
	{
		if(pMode === 'sign' || pMode === 'delete'){
			var param = {
					'pMenu' : 'set_approval_gabia_log',
					'pDocumentNo' : ApprovalProcess._documentNo,
					'pMsgType' : pType,
					'pMode' : pMode,
					'pResult' : pResult,
					'pMessage' : pMessage
			}
			Approval.Ajax(param);
		}
	}

	,dextConfig : function() {
		DEXT5.config.SkinName = "mono";
		DEXT5.config.Lang = "ko-kr";
		DEXT5.config.Width = "100%";
		DEXT5.config.Height = "500px";
		DEXT5.config.FontFamilyList  = '맑은 고딕,돋움,돋움체,굴림,굴림체,바탕,바탕체,Arial,Arial Black,Tahoma,Verdana,Sans-Serif,Serif,Monospace,Cursive,Fantasy,Times New Roman,Century Gothic,Courier New,Georgia';
		DEXT5.config.FontSizeList = '9px,10px,11px,12px,13px,14px,16px,18px,24px,32px';
		DEXT5.config.HandlerUrl = Common.getRoot() + "approval/upload_file/image_dext/" + Approval._writeType;
		DEXT5.config.SetValueObjId = 'compose_contents';
		DEXT5.config.KeepOriginalHtml = "1";
		DEXT5.config.RemoveEmptyTag = "0";
		
		if(Approval._defaultFontFamily){
			DEXT5.config.DefaultFontFamily = Approval._defaultFontFamily;
		}else{
			DEXT5.config.DefaultFontFamily = '맑은 고딕';
		}
		
		if(Approval._defaultFontSize){
			DEXT5.config.DefaultFontSize = Approval._defaultFontSize;
		}else{
			DEXT5.config.DefaultFontSize = '16px';
		}
		
		if(Approval._defaultLineHeight){
			DEXT5.config.DefaultLineHeight = Approval._defaultLineHeight;
		}else{
			DEXT5.config.DefaultLineHeight = '1.8';
		}

		DEXT5.config.ShowLineForBorderNone = 0;
		DEXT5.config.UserCssUrl = window.location.origin + "/static/css/approval/dext_custom_css.css";
		DEXT5.config.UserCssAlwaysSet = "1";
		DEXT5.config.UploadImageFileObject = '1';
		DEXT5.config.focusInitObjId = 'approval_document_title';
		DEXT5.config.TableDefaultWidth = '500';
	}
	
	,settingDblClickForDeleteApprovalSelectUser : function()
	{
		$j(document).on('dblclick', '#selectApprovalFirstLine option, #selectApprovalSecondLine option, #selectApprovalThirdLine option, #selectApprovalFourthLine option', function(e){

			if($j(this).closest('select').attr('id') === 'selectApprovalFirstLine'){
				Approval.deleteUser('selectApprovalFirstLine');
			}else if($j(this).closest('select').attr('id') === 'selectApprovalSecondLine'){
				Approval.deleteUser('selectApprovalSecondLine');
			}else if($j(this).closest('select').attr('id') === 'selectApprovalThirdLine'){
				Approval.deleteUser('selectApprovalThirdLine');
			}else if($j(this).closest('select').attr('id') === 'selectApprovalFourthLine'){
				Approval.deleteUser('selectApprovalFourthLine');
			}
		});
	}
	
	,getUrlHash : function()
	{
		if(Common.getIEVersion() !== false && Common.getIEVersion() < 10){
			var hash = window.location.hash;
		}else{
			var hash = window.location.search;
		}
		
		return hash; 
	}
}

var Approval = new approvalClass();

//dext
function makeEditor_dext()
{
	Approval.dextConfig();
	DEXT5.config.SetValueObjId = 'compose_contents';
	DEXT5.config.EditorHolder = 'dexteditor_holder';
	
	DEXT5.config.ContentSizeChangeEvent = {
			IncludeExternalUrl: 0,
			IncludeRelevantUrlString: "/approval/image/view",
			HandlerUrl: Common.getRoot() + "approval/upload_file/image_dext_info"
	};
	
	var editor = new Dext5editor("editor2");
	return editor;
}

function dext_editor_loaded_event(editor){
	
}
//

String.prototype.numberFormat = function(num)
{
	num = this != window ? this : num;
	num = num.replace(/,/g, "");

	var num_str = num.toString();
	var result = "";

	for(var i=0; i<num_str.length; i++)
	{
		var tmp = num_str.length-(i+1);

		if(i%3==0 && i!=0)
		{
			result = ',' + result;
		}
		result = num_str.charAt(tmp) + result
	}

	return result;
}

String.prototype.format = String.prototype.format || function() {
	var formatted = this;
	for (var i = 0; i < arguments.length; i++) {
		var regexp = new RegExp('\\{'+i+'\\}', 'gi');
		formatted = formatted.replace(regexp, arguments[i]);
	}
	return formatted;
};

( function (){ 
    if ( ! window.atob ){ 

        window.atob = function ( b64text ){  return Base64.decode( b64text );  }; 
        window.btoa = function ( utf8text ){  return Base64.encode( utf8text );  }; 

        var Base64 = { 

            keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", 


            encode : function ( input ){ 
                var output = ""; 
                var chr1, chr2, chr3, enc1, enc2, enc3, enc4; 
                var x = 0; 

                input = Base64._utf8_encode( input ); 

                while ( x < input.length ){ 

                    chr1 = input.charCodeAt( x++ ); 
                    chr2 = input.charCodeAt( x++ ); 
                    chr3 = input.charCodeAt( x++ ); 

                    enc1 = chr1 >> 2; 
                    enc2 = ((chr1 & 3) << 4) | (chr2 >> 4); 
                    enc3 = ((chr2 & 15) << 2) | (chr3 >> 6); 
                    enc4 = chr3 & 63; 

                    if ( isNaN(chr2) ) enc3 = enc4 = 64; 
                    else if ( isNaN(chr3) ) enc4 = 64; 

                    output = output + this.keyStr.charAt( enc1 ) + this.keyStr.charAt( enc2 ) + this.keyStr.charAt( enc3 ) + 
                                this.keyStr.charAt( enc4 ); 
                } 

                return output; 
            }, 


            decode : function ( input ){ 
                var output = ""; 
                var chr1, chr2, chr3; 
                var enc1, enc2, enc3, enc4; 
                var x = 0; 

                input = input.replace( /[^A-Za-z0-9\+\/\=]/g , "" ); 

                while ( x < input.length ){ 

                    enc1 = this.keyStr.indexOf( input.charAt(x++) ); 
                    enc2 = this.keyStr.indexOf( input.charAt(x++) ); 
                    enc3 = this.keyStr.indexOf( input.charAt(x++) ); 
                    enc4 = this.keyStr.indexOf( input.charAt(x++) ); 

                    chr1 = (enc1 << 2) | (enc2 >> 4); 
                    chr2 = ((enc2 & 15) << 4) | (enc3 >> 2); 
                    chr3 = ((enc3 & 3) << 6) | enc4; 

                    output = output + String.fromCharCode( chr1 ); 

                    if ( enc3 != 64 ) output = output + String.fromCharCode( chr2 ); 

                    if ( enc4 != 64 ) output = output + String.fromCharCode( chr3 ); 
                } 

                output = Base64._utf8_decode( output ); 

                return output; 
            }, 


            _utf8_encode : function ( string ){ 
                string = string.replace( /\r\n/g , "\n" ); 
                var utftext = ""; 

                for ( var n = 0; n < string.length; n++ ){ 

                    var c = string.charCodeAt( n ); 

                    if ( c < 128 ) utftext += String.fromCharCode( c ); 

                    else if ( (c > 127) && (c < 2048) ){ 
                        utftext += String.fromCharCode( (c >> 6) | 192 ); 
                        utftext += String.fromCharCode( (c & 63) | 128 ); 
                    } 

                    else { 
                        utftext += String.fromCharCode( (c >> 12) | 224 ); 
                        utftext += String.fromCharCode( ( (c >> 6) & 63 ) | 128 ); 
                        utftext += String.fromCharCode( (c & 63) | 128 ); 
                    } 
                } 

                return utftext; 
            }, 


            _utf8_decode : function ( utftext ){ 
                var string = ""; 
                var x = 0; 
                var c = c1 = c2 = 0; 

                while ( x < utftext.length ){ 

                    c = utftext.charCodeAt( x ); 

                    if ( c < 128 ) { 
                        string += String.fromCharCode( c ); 
                        x++; 
                    } 

                    else if ( (c > 191) && (c < 224) ){ 
                        c2 = utftext.charCodeAt( x + 1 ); 
                        string += String.fromCharCode( ( (c & 31) << 6 ) | (c2 & 63) ); 
                        x += 2; 
                    } 

                    else { 
                        c2 = utftext.charCodeAt( x + 1 ); 
                        c3 = utftext.charCodeAt( x + 2 ); 
                        string += String.fromCharCode( ( (c & 15) << 12 ) | ( (c2 & 63) << 6 ) | (c3 & 63) ); 
                        x += 3; 
                    } 
                } 

                return string; 
            } 
        } 
    } 
}() ); 

var ApprovalLang = new validateMessage("approval");