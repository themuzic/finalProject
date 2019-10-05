approvalDocumentClass = function() 
{
	_this = this;
	this._approvalLine = ['approval_first_line', 'approval_second_line', 'approval_third_line', 'approval_fourth_line'];
	this._boxSearchState = ['register', 'node_name', 'title', 'document_code', 'start_date', 'end_date', 'type', 'form', 'level', 'box', 'all'];
	this._boxSearchStateText = [ApprovalLang.getMessage('APPROVAL_WRITER') , ApprovalLang.getMessage('APPROVAL_WRITER_NODE'), ApprovalLang.getMessage('APPROVAL_TITLE'), ApprovalLang.getMessage('APPROVAL_DOCUMENT_CODE'), '', '', '', ApprovalLang.getMessage('APPROVAL_DOCUMENT_FORM'), ApprovalLang.getMessage('APPROVAL_SECURITY_LEVEL'), ApprovalLang.getMessage('APPROVAL_DIVISION'), ApprovalLang.getMessage('APPROVAL_ALL')];
	this._searchRelatedDocument = {'pMenu' : 'get_document_box_list', 'pCallback' : 'ApprovalDocument.setTableRelatedDocument', 'pStatus' : 'related_document_from_write', 'page' : '1'};
	this._documentSubmit = false;
	this._documentNo = null;
	this._approvalMethod = null;
	this._firstLine = null;
	this._secondLine = null;
	this._thirdLine = null;
	this._fourthLine = null;
	this._fifthLine = null;
	
	this._hiworksNo = null;
}

approvalDocumentClass.prototype = {
	Ajax: function(pParam, pFlag, pSync)
	{
		if(pFlag === undefined){
			Common._createBackGround();
			Common._createProgress();
		}

		if(pSync == undefined) pSync = true;

		getAjaxData(Common.getRoot() + 'approval/document_ajax/', pParam, ApprovalDocument.AjaxCallback, pSync);
	}

	,AjaxCallback: function(pValue)
	{
		if( pValue.layerID && pValue.layerID.indexOf("showPreviewApprovalForm") < 0 ){
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
			if(pValue.layerID === "ApprovalDocument.resultSaveDocument" && pValue.except === "Y"){
				$j("#wrap").append(pValue.result);
				$j('#layerAlertForPro').showPopup();

				return;
			}else if(pValue.layerID === "ApprovalDocument.resultSaveDocument" && pValue.changed_spending_settings){
				ApprovalDocument.setSpendingSettings(pValue.changed_spending_settings);
			}

			if(pValue.message){
				alert(pValue.message);
			}
			if(pValue.reload === RT_OK){
				document.location.reload();
			}
			return;

		}
	}

	,getDocumentListByPage: function(pPage)
	{
		Approval.pushState({"page":pPage === undefined ? 1 : pPage});
	}

	,getDocumentList: function()
	{
		var url_value = Approval.getUrlValue();
		console.log(url_value);
		if(url_value.page === undefined) url_value.page = 1;

		url_value.pStatus = $j('#approvalDocumentStatus').val();
		url_value.pMenu = 'get_document_list';
		url_value.pCallback = 'ApprovalDocument.setTableDocument';

		ApprovalDocument.Ajax(url_value);
	}

	,setTableDocument: function(pValue)
	{
		approvalDocumentTable.insertRow(pValue);
		$j('#pageApprovalDocument').html(pValue.paging);
		$j('#anchorApprovalForm').html(ApprovalLang.getMessage('APPROVAL_VIEW') + ": " + pValue.form_title);
		
		if(pValue.list_status_title !== ''){
			$j('#anchorApprovalListStatus').html(ApprovalLang.getMessage('APPROVAL_VIEW') + ": " + pValue.list_status_title);
		}
		
		if(Object.keys(pValue.search_state).length > 0){
			$j('#boxSearchState').html('');
			$j('#boxSearchState').show();

			var search_text = '', search_key = '';
			$j.each(_this._boxSearchState, function(index, value){
				if(pValue.search_state[value]){
					search_text = decodeURIComponent(pValue.search_state[value]);

					if(value !== 'start_date' && value !== 'end_date'){
						$j('#boxSearchState').append($j('<li class="tag">' + _this._boxSearchStateText[index] + ': ' + search_text + '<a href="javascript:void(0)" class="icon file_delete" onclick="Approval.resetDocumentBoxList(\'' + value + '\');"><span class="blind"></span></a></li>'));
					}
				}
			});

			search_text = search_key = '';
			if(pValue.search_state['start_date'] && pValue.search_state['end_date']){
				search_text = decodeURIComponent(pValue.search_state['start_date']) + "부터 " + decodeURIComponent(pValue.search_state['end_date']) + "까지";
				search_key = 'date';
			}else if(pValue.search_state['start_date']){
				search_text = ApprovalLang.getMessage('APPROVAL_FROM').format(decodeURIComponent(pValue.search_state['start_date']));
				search_key = 'start_date';
			}else if(pValue.search_state['end_date']){
				search_text = ApprovalLang.getMessage('APPROVAL_TO').format(decodeURIComponent(pValue.search_state['end_date']));
				search_key = 'end_date';
			}

			if(search_text !== "" && search_key !== ""){
				$j('#boxSearchState').append($j('<li class="tag">' + search_text + '<a href="javascript:void(0)" class="icon file_delete" onclick="Approval.resetDocumentBoxList(\'' + search_key + '\');"><span class="blind"></span></a></li>'));
			}

			$j('#boxSearchState').append($j('<li class="tag-button"><button class="point_color tag-refresh" onclick="Approval.resetDocumentBoxList(\'ALL\');")>' + ApprovalLang.getMessage('APPROVAL_RESET') + ' </button></li>'));
		}else{
			$j('#boxSearchState').hide();
		}
		
		if($j('.js-approval-all-checkbox').length){
			$j('.js-approval-all-checkbox').prop('checked', false);
			$j('.js-approval-all-checkbox').change();
		}
	}

	,getDocumentBoxListByPage: function(pPage)
	{
		Approval.pushState({"page":pPage === undefined ? 1 : pPage});
	}

	,getDocumentBoxList: function()
	{
		var url_value = Approval.getUrlValue();
		if(url_value.page === undefined) url_value.page = 1;

		url_value.pStatus = $j('#approvalDocumentBoxStatus').val();
		url_value.pMenu = 'get_document_box_list';
		url_value.pCallback = 'ApprovalDocument.setTableDocumentBox';

		ApprovalDocument.Ajax(url_value);
	}

	,setTableDocumentBox: function(pValue)
	{
		approvalDocumentBoxTable.insertRow(pValue);
		$j('#pageApprovalDocumentBox').html(pValue.paging);
		var view_txt = pValue.type;
		if(pValue.line_type){
			view_txt += ', ' + pValue.line_type;
		}
		$j('#anchorApprovalType').html(ApprovalLang.getMessage('APPROVAL_VIEW') + ": " + view_txt);

		if(Object.keys(pValue.search_state).length > 0){
			$j('#boxSearchState').html('');
			$j('#boxSearchState').show();

			var search_text = '', search_key = '';
			$j.each(_this._boxSearchState, function(index, value){
				if(pValue.search_state[value]){
					search_text = decodeURIComponent(pValue.search_state[value]);

					if(value !== 'start_date' && value !== 'end_date'){
						$j('#boxSearchState').append($j('<li class="tag">' + _this._boxSearchStateText[index] + ': ' + search_text + '<a href="javascript:void(0)" class="icon file_delete" onclick="Approval.resetDocumentBoxList(\'' + value + '\');"><span class="blind"></span></a></li>'));
					}
				}
			});

			search_text = search_key = '';
			if(pValue.search_state['start_date'] && pValue.search_state['end_date']){
				search_text = decodeURIComponent(pValue.search_state['start_date']) + "부터 " + decodeURIComponent(pValue.search_state['end_date']) + "까지";
				search_key = 'date';
			}else if(pValue.search_state['start_date']){
				search_text = ApprovalLang.getMessage('APPROVAL_FROM').format(decodeURIComponent(pValue.search_state['start_date']));
				search_key = 'start_date';
			}else if(pValue.search_state['end_date']){
				search_text = ApprovalLang.getMessage('APPROVAL_TO').format(decodeURIComponent(pValue.search_state['end_date']));
				search_key = 'end_date';
			}

			if(search_text !== "" && search_key !== ""){
				$j('#boxSearchState').append($j('<li class="tag">' + search_text + '<a href="javascript:void(0)" class="icon file_delete" onclick="Approval.resetDocumentBoxList(\'' + search_key + '\');"><span class="blind"></span></a></li>'));
			}

			$j('#boxSearchState').append($j('<li class="tag-button"><button class="point_color tag-refresh" onclick="Approval.resetDocumentBoxList(\'ALL\');")>' + ApprovalLang.getMessage('APPROVAL_RESET') + ' </button></li>'));
		}else{
			$j('#boxSearchState').hide();
		}
	}

	,getApprovalFormByCategory: function(pNo)
	{
		if($j('#prevApprovalFormNo').val() !== ""){
			if(!confirm("초기화하시겠습니까?\n작성한 내용은 저장되지 않습니다.")){
				$j("select[name='approval_category_no']").val($j('#prevApprovalCategoryNo').val());
				return;
			}
		}
		
		$j('#btnTempSaveDocument').hide();
		$j('#btnPreviewDocument').hide();
		$j('#btnApprovalAdressbookSelect').hide();
		$j('select[name="preserved_term"] option').eq(0).prop('selected', true);
		$j('select[name="security_level"] option').eq(0).prop('selected', true);

		ApprovalDocument.Ajax({
			"pMenu" : "get_approval_form_by_category",
			"pNo" : pNo,
			"pCallback" : "ApprovalDocument.showApprovalFormByCategory"
		}, false);
	}

	,getSearchLayer: function()
	{
		$j('#searchApprovalState').hide();

		ApprovalDocument.Ajax({
			"pMenu" : "get_search_document_layer",
			"pCallback" : "ApprovalDocument.showSearchLayer"
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

	,getRelatedDocumentLayer: function()
	{
		ApprovalDocument.Ajax({
			"pMenu" : "get_related_document_layer",
			"pCallback" : "ApprovalDocument.showRelatedDocumentLayer"
		});
	}

	,showRelatedDocumentLayer: function(pValue)
	{
		$j("#wrap").append(pValue.result);
		$j('#layerRelatedDocument').showPopup();
		$j('#textSearchRelatedDocument').focus();
		ApprovalDocument._searchRelatedDocument = {'pMenu' : 'get_document_box_list', 'pCallback' : 'ApprovalDocument.setTableRelatedDocument', 'pStatus' : 'related_document_from_write', 'page' : '1'};
		ApprovalDocument.getRelatedDocumentList();
	}

	,searchRelatedDocument: function()
	{
		if($j.trim($j("#textSearchRelatedDocument").val()) !== ""){
			ApprovalDocument._searchRelatedDocument['all'] = $j.trim($j("#textSearchRelatedDocument").val());
			ApprovalDocument.getRelatedDocumentList();
		}
	}

	,getRelatedDocumentListByPage: function(pPage)
	{
		ApprovalDocument._searchRelatedDocument['page'] = pPage === undefined ? 1 : pPage;
		ApprovalDocument.getRelatedDocumentList();
	}

	,getRelatedDocumentList: function()
	{
		ApprovalDocument.Ajax(this._searchRelatedDocument, false);	
	}

	,setTableRelatedDocument: function(pValue)
	{
		approvalRelatedDocumentTable.insertRow(pValue);
		$j('#pageRelatedDocument').html(pValue.paging);
		$j('#anchorApprovalType').html(ApprovalLang.getMessage('APPROVAL_VIEW') + ": " + pValue.type);
	}

	,selectRelatedDocument: function(pNo, pStr)
	{
		var exist_chk = false;
		$j.each($j('.js-select-realted_document'), function(index, value){
			if($j(value).attr("document_no") === pNo){
				exist_chk = true;
				return;
			}
		});

		if(exist_chk === false){
			$j("#addRelatedDocument").append($j('<span class="docu-list js-select-realted_document" document_no="' + pNo + '">' + decodeURIComponent(pStr) + ' <span class="icon file_delete" onclick="ApprovalDocument.removeRelatedDocument(this);"></span></span>'));
		}
	}

	,removeRelatedDocument: function(pObj)
	{
		$j(pObj).closest('tr').remove();
	}

	,addRelatedDocument: function()
	{
		var related_document = [];
		$j.each($j(".js-approval-related"), function(index, value){
			related_document.push($j(value).attr("document_no"));
		});

		$j.each($j('.js-select-realted_document'), function(index, value){
			if($j.inArray($j(value).attr("document_no"), related_document) === -1){
				related_document.push($j(value).attr("document_no"));
				$j("#tableApprovalRelated").append($j("<tr><td><div class=\"filename js-approval-related\" document_no=\"" + $j(value).attr("document_no") + "\"><span class=\"icon file\"></span> <a href=\"javascript:void(0)\" class=\"docu-link\">" + $j(value).contents().eq(0).text()+ "</a> <a href=\"javascript:void(0)\" class=\"icon file_delete\" onclick=\"ApprovalDocument.removeRelatedDocument(this);\"><span class=\"blind\">파일 삭제</span></a></div></td></tr>"));
			}
		});

		$j('#layerRelatedDocument').hidePopup();
		if(related_document.length > 0){
			$j('#approvalAttachText').hide();
			$j('#approvalAttachList').show();
		}
	}

	,showApprovalFormByCategory: function(pValue)
	{
		$j("select[name='approval_form_no'] option").remove();
		$j("select[name='approval_form_no']").append('<option value="">' + ApprovalLang.getMessage('APPROVAL_SELECT') + '</option>');

		if(pValue.result){ 
			for(var i=0; i<pValue.result.length; i++){
				$j("select[name='approval_form_no']").append('<option value="'+pValue.result[i]['form_no']+'">'+pValue.result[i]['title']+'</option>');
			}
		}
		$j('#prevApprovalFormNo').val('');
		ApprovalDocument.initApprovalDocument();
	}

	,changeApprovalForm: function(pNo)
	{
		if(pNo === ""){
			if(confirm(ApprovalLang.getMessage('APPROVAL_WANT_TO_INITIALIZE') + "\n" + ApprovalLang.getMessage('APPROVAL_NO_SAVE'))){
				this.initApprovalDocument();
				$j('#prevApprovalFormNo').val(pNo);
				$j('#prevApprovalFormTitle').val("");
				$j('#btnPreviewDocument').hide();
				$j('#btnTempSaveDocument').hide();
				$j('#btnApprovalAdressbookSelect').hide();
				$j('select[name="preserved_term"] option').eq(0).prop('selected', true);
				$j('select[name="security_level"] option').eq(0).prop('selected', true);
				return true;
			}

			$j("select[name='approval_form_no']").val($j('#prevApprovalFormNo').val());
			return false;
		}

		if($j('#prevApprovalFormNo').val() !== "" || ($j('#prevApprovalFormNo').val() === '' && $j('#prevApprovalFormTitle').val() !== '')){
			if(confirm(ApprovalLang.getMessage('APPROVAL_WANT_TO_CHANGE_FORM') + "\n" + ApprovalLang.getMessage('APPROVAL_NO_SAVE'))){
				this.initApprovalDocument();
				ApprovalDocument.getApprovalFormInfo(pNo);
				$j('#prevApprovalFormNo').val(pNo);
				return true;
			}else{
				$j("select[name='approval_form_no']").val($j('#prevApprovalFormNo').val());
				return false;
			}
		}

		ApprovalDocument.getApprovalFormInfo(pNo);
		$j('#prevApprovalFormNo').val(pNo);
	}

	,initApprovalDocument: function()
	{
		$j("input[name='approval_first_line']").val('');
		$j("input[name='approval_second_line']").val('');
		$j("input[name='approval_third_line']").val('');
		$j("input[name='approval_fourth_line']").val('');
		$j('#approvalDocumentLine').html(ApprovalLang.getMessage('APPROVAL_SELECT_FORM_VIEW_LINE'));
		$j('.js-approval-line').remove();
		$j("input[name='approval_document_title']").val('');
		$j('#approvalEditorContent').hide();
		$j('#approvalDbContent').hide();
		$j("#approvalDbContent").html('');
		$j('.js-approval-input').hide();
		$j('.js-approval-input-guide').show();
		// dext
		$j('textarea#compose_contents').val('');

		$j('#approvalFormRule').hide();
	}

	,getSelectApprovalForm: function()
	{
		ApprovalDocument.Ajax({
			"pMenu" : "get_select_approval_form",
			"pNo" : $j("select[name='approval_form_no']").val(),
			"pCallback" : "ApprovalDocument.shwoSelectApprovalForm"
		});
	}

	,shwoSelectApprovalForm: function(pValue)
	{
		$j("#wrap").append(pValue.result);
		$j('#layerSelectApprovalForm').showPopup();
	}

	,previewApprovalForm: function(pNo)
	{
		ApprovalDocument.Ajax({
			"pMenu" : "preview_approval_form",
			"pNo" : pNo,
			"pNodeId" : $j("[name='node_id']").val(),
			"pCallback" : "ApprovalDocument.showPreviewApprovalForm"
		}, false);
	}

	,showApprovalFormRule: function(pNo)
	{
		//var preview = window.open('', "preview", 'height=' + screen.height + ',width=' + screen.width + ",resizable=yes,menubar=yes,scrollbars=yes,status=yes,fullscreen=yes");
		var preview = window.open('', "preview", "resizable=yes,menubar=yes,scrollbars=yes,status=yes,fullscreen=yes");
		var $form = $j('<form>', {
			'id' : 'formRule',
			'action' : Common.getRoot() + 'approval/addons/rule',
			'method' : 'post',
			'target' : 'preview'
		});
		var $rule_content = $j('<input>', {
			'name' : 'form_no',
			'value' : (pNo === undefined || pNo === "" ? $j("select[name='approval_form_no']").val() : pNo),
			'type' : 'hidden'
		});		
		$form.append($rule_content);
		
		$j('body').append($form);
		$form.submit();
		$j('#formRule').remove();
	}

	,showPreviewApprovalForm: function(pValue)
	{
		$j('#templateApprovalFormComment').html(pValue.comment);
		$j('#templateApprovalForm').html(pValue.result);
		
		if(pValue.comment === ''){
			$j('#templateApprovalForm').css({'height':'453px', 'margin':'0px'});
		}else{
			$j('#templateApprovalForm').css({'height': (453 - parseInt($j('#templateApprovalFormComment').height() + 10) + 'px'), 'margin-top':'10px'});
		}
	}

	,selectApprovalForm: function()
	{
		var form_no = $j(".js-preview-approval-form.on").attr('form_no');

		if(form_no !== undefined){
			ApprovalDocument.changeApprovalForm(form_no);
			$j("select[name='approval_form_no']").val(form_no);
		}
		$j('#layerSelectApprovalForm').hidePopup();
	}

	,changeNodeId: function()
	{
		if($j("select[name='approval_form_no']").val() !== ""){
			ApprovalDocument.Ajax({
				"pMenu" : "get_approval_form_info",
				"pNo" : $j("select[name='approval_form_no']").val(),
				"pNodeId" : $j("[name='node_id']").val(),
				"pCallback" : "ApprovalDocument.changeApprovalLine"
			}, false);
		}
	}

	,changeApprovalLine: function(pValue)
	{
		$j("input[name='approval_first_line']").val(pValue.approval_first_line);
		$j("input[name='approval_second_line']").val(pValue.approval_second_line);
		$j("input[name='approval_third_line']").val(pValue.approval_third_line);
		$j("input[name='approval_fourth_line']").val(pValue.approval_fourth_line);

		$j('#approvalDocumentLine').html(pValue.result);

		$j('.js-approval-line tr').each(function (index) {
			var thHeight = $j(this).children('th').height();
			var thWidth = $j(this).children('th').width();
			$j(this).find('th > div').css({'height' : (thHeight - 1) + 'px'});
			$j(this).find('th > div').css({'display' : 'table-cell'});
			$j(this).find('th > div').css({'width' : (thWidth - 1) + 'px'});
			$j(this).find('th > div').css({'vertical-align' : 'middle'});
			$j(this).find('th > div').css({'text-align' : 'center'});
		});

		// 자동완성
		autoComplete();
		
		if(pValue.toast_message){
			for(var i=0; i<pValue.toast_message.length; i++){
				showNoticeToast(pValue.toast_message[i]);
			}
		}
	}

	,getApprovalFormInfo: function(pNo)
	{
		ApprovalDocument.Ajax({
			"pMenu" : "get_approval_form_info",
			"pNo" : pNo,
			"pNodeId" : $j("[name='node_id']").val(),
			"pCallback" : "ApprovalDocument.showApprovalFormInfo"
		});
	}

	,showApprovalFormInfo: function(pValue)
	{
		if(pValue.toast_message){
			for(var i=0; i<pValue.toast_message.length; i++){
				showNoticeToast(pValue.toast_message[i]);
			}
		}
		
		$j("select[name='approval_category_no']").val(pValue.approval_form_category_no);

		$j("select[name='approval_form_no'] option").remove();
		$j("select[name='approval_form_no']").append('<option value="">' + ApprovalLang.getMessage('APPROVAL_SELECT') + '</option>');
		if(pValue.show_rule === "Y"){
			$j("#approvalFormRule").show();
		}else{
			$j("#approvalFormRule").hide();
		}

		if(pValue.approval_form_list){ 
			for(var i=0; i<pValue.approval_form_list.length; i++){
				$j("select[name='approval_form_no']").append('<option value="'+pValue.approval_form_list[i]['form_no']+'">'+pValue.approval_form_list[i]['title']+'</option>');
			}
		}
		$j("select[name='approval_form_no']").val(pValue.approval_form_no);

		$j("#btnPreviewDocument").show();
		$j("#btnApprovalAdressbookSelect").show();
		$j("input[name='approval_first_line']").val(pValue.approval_first_line);
		$j("input[name='approval_second_line']").val(pValue.approval_second_line);
		$j("input[name='approval_third_line']").val(pValue.approval_third_line);
		$j("input[name='approval_fourth_line']").val(pValue.approval_fourth_line);
		ApprovalDocument._approvalMethod = pValue.approval_method;
		
		if(pValue.set_preserved_term === 'Y'){
			$j('#set_preserved_term_y').show();
			$j('#set_preserved_term_n').hide();
			$j('#set_preserved_term_n').closest('td').find('a.tipsIcon').css('top', '4px');
		}else{
			if(pValue.preserved_term === '0'){
				$j("#set_preserved_term_n").text(ApprovalLang.getMessage('APPROVAL_FOREVER'));
			}else{
				$j("#set_preserved_term_n").text(pValue.preserved_term + ApprovalLang.getMessage('APPROVAL_YEAR'));
			}
			
			$j('#set_preserved_term_n').closest('td').find('a.tipsIcon').css({'top' : '0px'});
			$j('#set_preserved_term_n').show();
			$j('#set_preserved_term_y').hide();
		}
		
		if(pValue.set_security_level === 'Y'){
			$j('#set_security_level_y').show();
			$j('#set_security_level_n').hide();
			$j('#set_security_level_n').closest('td').find('a.tipsIcon').css('top', '4px');
		}else{
			$j('#set_security_level_n').text(pValue.security_level + ApprovalLang.getMessage('APPROVAL_LEVEL'));
			$j('#set_security_level_n').show();
			$j('#set_security_level_y').hide();
			$j('#set_security_level_n').closest('td').find('a.tipsIcon').css({'top' : '0px'});
		}
		
		$j("select[name='preserved_term']").val(pValue.preserved_term);
		$j("select[name='security_level']").val(pValue.security_level);
		$j('#approvalDocumentLine').html(pValue.result);

//      페이지 연동 시 폼형식 설정
        if(_this._formType == "openapi") {
            pValue.form_type = "openapi";
        }

		if(pValue.form_type !== "openapi"){
			$j('.js-approval-input-guide').hide();
			$j('.js-approval-input').show();

			// dext
			var approval_editor = makeEditor_dext();

            if(pValue.use_editor === "Y"){
                $j('#approvalEditorContent').show();
                $j('textarea#compose_contents').val(pValue.content);
			}else{
				$j('#approvalEditorContent').hide();
				//dext
				$j('textarea#compose_contents').val('');
			}
            
            ApprovalDocument._editFlag = pValue.use_editor === 'Y' ? 'Y' : 'N';

			if(pValue.use_db === "Y"){
				$j('#approvalDbContent').show();
				$j('#approvalDbContent').html(pValue.db_content);
			}else{
				$j('#approvalDbContent').hide();
				$j('#approvalDbContent').html('');
			}
		}
		_this._formType = pValue.form_type;

		$j('.js-approval-line tr').each(function (index) {
			var thHeight = $j(this).children('th').height();
			var thWidth = $j(this).children('th').width();
			$j(this).find('th > div').css({'height' : (thHeight - 1) + 'px'});
			$j(this).find('th > div').css({'display' : 'table-cell'});
			$j(this).find('th > div').css({'width' : (thWidth - 1) + 'px'});
			$j(this).find('th > div').css({'vertical-align' : 'middle'});
			$j(this).find('th > div').css({'text-align' : 'center'});
		});

		//기안하기 버튼 활성화
		$j('#btnWriteSaveDocument').show();
		// 임시 저장 버튼 활성화
		$j('#btnTempSaveDocument').show();
		
		// 첨부파일 문서 영역 초기화
		if(_this._formType !== "openapi"){
			ApprovalDocument.initAttachedFileArea();
		}

		if(pValue.form_type === "gabia_iframe"){
			if($j('#iframeForm').length){
				$j('#iframeForm').remove();
			}
			var $form = $j('<form>', {
				'id' : 'iframeForm',
				'action' : location.host === 'inmail.gabia.com' ? 'https://hiworksedms.gabia.com/documents' : 'http://pko.hiworksedms.gabia.com/documents',
				'method' : 'post',
				'target' : 'approval_iframe_content'
			});
			var $mode = $j('<input>', {
				'name' : 'mode',
				'value' : 'add',
				'type' : 'hidden'
			});
			var $key = $j('<input>', {
				'name' : 'key',
				'value' : pValue.db_data.key,
				'type' : 'hidden'
			});
			var $cate = $j('<input>', {
				'name' : 'cate',
				'value' : pValue.db_data.cate,
				'type' : 'hidden'
			});
			var $code = $j('<input>', {
				'name' : 'code',
				'value' : pValue.db_data.code,
				'type' : 'hidden'
			});
			var $hiworks_no = $j('<input>', {
				'name' : 'hiworks_no',
				'value' : pValue.db_data.hiworks_no,
				'type' : 'hidden'
			});
			ApprovalDocument._hiworksNo = pValue.db_data.hiworks_no;
			ApprovalDocument._gabiaCate = pValue.db_data.cate;
			ApprovalDocument._changedForm = 'Y';

			$form.append($mode).append($key).append($cate).append($code).append($hiworks_no);
			
			$j('body').append($form);
			$form.submit();
			console.log($form);
			// $j('#iframeForm').remove();
			
			if(pValue.db_data.file_attached_flag && pValue.db_data.file_attached_flag === 'N'){
				ApprovalDocument.hideAttachedFileArea();
			}
			
		}else if(pValue.form_type === "iframe"){
			ApprovalDocument._hiworksNo = pValue.db_data.hiworks_no;

			$j('#btnTempSaveDocument').hide();
		}
		
		if($j('#approval_document_title').length){
			$j('#approval_document_title').focus();
		}

		// 자동완성
		autoComplete();
	}

	,getApprovalLineSelect: function()
	{
		var approval_view = '';
		if(_this._approvalMethod === 'ADEF'){
			approval_view = 'div_approval_view_one';
		}else if(_this._approvalMethod === 'BCF'){
			approval_view = 'div_approval_view_two';
		}else if(_this._approvalMethod === 'I'){
			approval_view = 'div_approval_view_three';
		}else if(_this._approvalMethod === 'AFGHI'){
			approval_view = 'div_approval_view_four';
		}else if(_this._approvalMethod === 'ADF'){
			approval_view = 'div_approval_view_five';
		}else{
			return false;
		}

		if( $j("select[name='approval_form_no']").val() === "" ){
			alert(ApprovalLang.getMessage('APPROVAL_SELECT_FORM_SET_LINE'));
			return false;
		}

		addressbook.getAddressbook(FROM_APPROVAL, 'ApprovalDocument.initApprovalLineSelect', 'ApprovalDocument.saveApprovalLineSelect', approval_view);
	}

	,initApprovalLineSelect: function()
	{
		var form_no = '';
		if($j.inArray(ApprovalDocument._approvalMethod, ['CIRCULATION', 'MODIFY']) === -1){
			form_no = $j("select[name='approval_form_no']").val();
		}
		if(ApprovalDocument._formType === 'openapi'){
			form_no = ApprovalDocument._formNo;
		}
		
		var first_line = $j("input[name='approval_first_line']").val();
		var second_line = $j("input[name='approval_second_line']").val();
		var third_line = $j("input[name='approval_third_line']").val();
		var fourth_line = $j("input[name='approval_fourth_line']").val();

		ApprovalDocument.Ajax({
			"pMenu" : "get_approval_line_select_info",
			"pFirstLine" : first_line,
			"pSecondLine" : second_line,
			"pThirdLine" : third_line,
			"pFourthLine" : fourth_line,
			"pMethod" : ApprovalDocument._approvalMethod,
			"pDocumentMode" : Approval._documentMode,
			"pDocumentNo" : ApprovalDocument._documentNo,
			"pFormNo" : form_no,
			"pFormNodeId" : $j('select[name="node_id"]').length ? $j('select[name="node_id"]').val() : $j('input[name="node_id"]').val(),
			"pCallback" : "ApprovalDocument.resultInitApprovalLineSelect"
		});
	}

	,resultInitApprovalLineSelect: function(pValue)
	{
		$j("#sp_selectApprovalFirstLine").html(pValue.first_line.length);
		var approval_method = ApprovalDocument._approvalMethod;
		for(var i=0; i<pValue.first_line.length; i++){
			var $option = $j('<option></option>', {'value':pValue.first_line[i].value, 'node_id':pValue.first_line[i].node_id, 'text':pValue.first_line[i].text, 'title':pValue.first_line[i].text});
			if(i === 0 && ApprovalDocument._approvalMethod !== "I"){
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
			$option.attr('enable_delete', pValue.third_line[i].enable_delete ? pValue.third_line[i].enable_delete : 'Y');
			
			$j("#selectApprovalThirdLine").append($option);
		}
		$j("#sp_selectApprovalFourthLine").html(pValue.fourth_line.length);
		for(var i=0; i<pValue.fourth_line.length; i++){
			var $option = $j('<option></option>', {'value':pValue.fourth_line[i].value, 'node_id':pValue.fourth_line[i].node_id, 'text':pValue.fourth_line[i].text, 'title':pValue.fourth_line[i].text});
			if(pValue.fourth_line[i].title && pValue.fourth_line[i].title !== ''){
				$option.addClass('bold');
				$option.attr('title', pValue.fourth_line[i].title);
			}
			$option.attr('old_new', pValue.fourth_line[i].old_new ? pValue.fourth_line[i].old_new : 'old');
			$option.attr('enable_delete', pValue.fourth_line[i].enable_delete ? pValue.fourth_line[i].enable_delete : 'Y');
			$j("#selectApprovalFourthLine").append($option);
		}

		if(pValue.form_enable_delete && pValue.form_enable_delete === 'Y'){
			$j("#selectApprovalLine").show();
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
			ApprovalDocument.Ajax({
				"pMenu" : "select_approval_line",
				"pNo" : select_approval_line,
				"pCallback" : "ApprovalDocument.resultSelectApprovalLine"
			});
		}
	}

	,resultSelectApprovalLine: function(pValue)
	{
		if($j('#selectApprovalFirstLine').length > 0){
			if(ApprovalDocument._approvalMethod === "I"){
				document.getElementById('selectApprovalFirstLine').options.length = 0;
				$j("#sp_selectApprovalFirstLine").html(pValue.first_line.length);
			}else{
				document.getElementById('selectApprovalFirstLine').options.length = 1;
				$j("#sp_selectApprovalFirstLine").html(pValue.first_line.length + 1);
			}
			
			for(var i=0; i<pValue.first_line.length; i++){
				if(i === 0 && ApprovalDocument._approvalMethod !== "I" && ApprovalDocument._registerNo === pValue.first_line[i].value){
					$j("#selectApprovalFirstLine").append('<option value="'+pValue.first_line[i].value+'" node_id="'+pValue.first_line[i].node_id+'" old_new="' + pValue.first_line[i].old_new + '" edit="N" disabled>'+pValue.first_line[i].text+'</option>');
				}else{
					$j("#selectApprovalFirstLine").append('<option value="'+pValue.first_line[i].value+'" node_id="'+pValue.first_line[i].node_id+'" old_new="' + pValue.first_line[i].old_new + '"' + (pValue.first_line[i].title !== "" ? ' class="bold"' : '') + ' title="'+(pValue.first_line[i].title === "" ? pValue.first_line[i].text : pValue.first_line[i].title)+'">'+pValue.first_line[i].text+'</option>');
				}
			}
		}
		if($j('#selectApprovalSecondLine').length > 0){
			document.getElementById('selectApprovalSecondLine').options.length = 0;
			$j("#sp_selectApprovalSecondLine").html(pValue.second_line.length);
			for(var i=0; i<pValue.second_line.length; i++){
				$j("#selectApprovalSecondLine").append('<option value="'+pValue.second_line[i].value+'" node_id="'+pValue.second_line[i].node_id+'" old_new="' + pValue.second_line[i].old_new + '"' + (pValue.second_line[i].title !== "" ? ' class="bold"' : '') + ' title="'+(pValue.second_line[i].title === "" ? pValue.second_line[i].text : pValue.second_line[i].title)+'">'+pValue.second_line[i].text+'</option>');
			}
		}
		if($j('#selectApprovalThirdLine').length > 0){
			document.getElementById('selectApprovalThirdLine').options.length = 0;
			$j("#sp_selectApprovalThirdLine").html(pValue.third_line.length);
			for(var i=0; i<pValue.third_line.length; i++){
				$j("#selectApprovalThirdLine").append('<option value="'+pValue.third_line[i].value+'" node_id="'+pValue.third_line[i].node_id+'" old_new="' + pValue.third_line[i].old_new + '"' + (pValue.third_line[i].title !== "" ? ' class="bold"' : '') + ' title="'+(pValue.third_line[i].title === "" ? pValue.third_line[i].text : pValue.third_line[i].title)+'">'+pValue.third_line[i].text+'</option>');
			}
		}
		if($j('#selectApprovalFourthLine').length > 0){
			document.getElementById('selectApprovalFourthLine').options.length = 0;
			$j("#sp_selectApprovalFourthLine").html(pValue.fourth_line.length);
			for(var i=0; i<pValue.fourth_line.length; i++){
				$j("#selectApprovalFourthLine").append('<option value="'+pValue.fourth_line[i].value+'" node_id="'+pValue.fourth_line[i].node_id+'" old_new="' + pValue.fourth_line[i].old_new + '"' + (pValue.fourth_line[i].title !== "" ? ' class="bold"' : '') + ' title="'+(pValue.fourth_line[i].title === "" ? pValue.fourth_line[i].text : pValue.fourth_line[i].title)+'">'+pValue.fourth_line[i].text+'</option>');
			}
		}
		
		if(pValue.toast_message){
			for(var i=0; i<pValue.toast_message.length; i++){
				showNoticeToast(pValue.toast_message[i]);
			}
		}
	}

	,checkApprovalLineSelect: function()
	{
		var approval_method = _this._approvalMethod;
	}

	,saveApprovalLineSelect: function()
	{
		var first_line = [], second_line = [], third_line = [], fourth_line = [];

		if($j('#selectApprovalFirstLine').length > 0){
			for(var i=0; i<document.getElementById("selectApprovalFirstLine").options.length; i++){
				first_line.push(document.getElementById("selectApprovalFirstLine").options[i].value + "|" + document.getElementById("selectApprovalFirstLine").options[i].getAttribute("node_id") + "|" + document.getElementById("selectApprovalFirstLine").options[i].getAttribute("old_new"));
			}
		}
		if($j('#selectApprovalSecondLine').length > 0){
			for(var i=0; i<document.getElementById("selectApprovalSecondLine").options.length; i++){
				second_line.push(document.getElementById("selectApprovalSecondLine").options[i].value + "|" + document.getElementById("selectApprovalSecondLine").options[i].getAttribute("node_id") + "|" + document.getElementById("selectApprovalSecondLine").options[i].getAttribute("old_new"));
			}
		}
		if($j('#selectApprovalThirdLine').length > 0){
			for(var i=0; i<document.getElementById("selectApprovalThirdLine").options.length; i++){
				third_line.push(document.getElementById("selectApprovalThirdLine").options[i].value + "|" + document.getElementById("selectApprovalThirdLine").options[i].getAttribute("node_id") + "|" + document.getElementById("selectApprovalThirdLine").options[i].getAttribute("old_new"));
			}
		}
		if($j('#selectApprovalFourthLine').length > 0){
			for(var i=0; i<document.getElementById("selectApprovalFourthLine").options.length; i++){
				fourth_line.push(document.getElementById("selectApprovalFourthLine").options[i].value + "|" + document.getElementById("selectApprovalFourthLine").options[i].getAttribute("node_id") + "|" + document.getElementById("selectApprovalFourthLine").options[i].getAttribute("old_new"));
			}
		}
		var methods = ApprovalDocument._approvalMethod.split('');

		if(methods[0] !== undefined && first_line.length > Approval._approvalLineNumber[methods[0]]){
			alert(ApprovalLang.getMessage('APPROVAL_SET_MAX_COUNT_'+methods[0]).format(Approval._approvalLineNumber[methods[0]]));
			return false;
		}
		if(methods[1] !== undefined && second_line.length > Approval._approvalLineNumber[methods[1]]){
			alert(ApprovalLang.getMessage('APPROVAL_SET_MAX_COUNT_'+methods[1]).format(Approval._approvalLineNumber[methods[1]]));
			return false;
		}
		if(methods[2] !== undefined && third_line.length > Approval._approvalLineNumber[methods[2]]){
			alert(ApprovalLang.getMessage('APPROVAL_SET_MAX_COUNT_'+methods[2]).format(Approval._approvalLineNumber[methods[2]]));
			return false;
		}
		if(methods[3] !== undefined && fourth_line.length > Approval._approvalLineNumber[methods[3]]){
			alert(ApprovalLang.getMessage('APPROVAL_SET_MAX_COUNT_'+methods[3]).format(Approval._approvalLineNumber[methods[3]]));
			return false;
		}
		
		var form_no = '';
		if($j.inArray(ApprovalDocument._approvalMethod, ['CIRCULATION', 'MODIFY']) === -1){
			form_no = $j("select[name='approval_form_no']").val();
		}
		else if(ApprovalDocument._formType === 'openapi'){
			form_no = ApprovalDocument._formNo;
		}
		
		ApprovalDocument.Ajax({
			"pMenu" : "get_approval_line_select_table",
			"pMethod" : ApprovalDocument._approvalMethod,
			"pApprovalType" : "ALL",
			"pDocumentNo" : ApprovalDocument._documentNo,
			"pDocumentMode" : Approval._documentMode,
			"pFirstLine" : first_line.join(","),
			"pSecondLine" : second_line.join(","),
			"pThirdLine" : third_line.join(","),
			"pFourthLine" : fourth_line.join(","),
			"pFormNo" : form_no,
			"pFormNodeId" : $j('select[name="node_id"]').length ? $j('select[name="node_id"]').val() : $j('input[name="node_id"]').val(),
			"pCallback" : "ApprovalDocument.resultSaveApprovalLineSelect"
		});

		return true;
	}

	,resultSaveApprovalLineSelect: function(pValue)
	{
		ApprovalDocument.setApprovalLineSelectTable(pValue);
		addressbook.closeAddressbook();
	}
	
	,setApprovalLineSelectTable : function(pValue)
	{
		var approval_method = ApprovalDocument._approvalMethod;
		$j('.js-approval-line tr').each(function (index) {
			var thHeight = $j(this).children('th').height();
			$j(this).find('th > div').css({'height' : 'auto'});
			$j(this).find('th > div').css({'line-height' : 'normal'});
			$j(this).children('th').height();
		});
		
		var methods = approval_method.split('');
		if(methods[0] !== undefined){
			$j("input[name='approval_first_line']").val(pValue.first_line);
			if($j("#approvalFirstLine input").length){
				$j("#approvalFirstLine").find('span').remove();
				$j("#approvalFirstLine").append(pValue.first_line_table);
			}else{
				$j("#approvalFirstLine").html(pValue.first_line_table);
			}
		}
		if(methods[1] !== undefined){
			$j("input[name='approval_second_line']").val(pValue.second_line);
			
			if($j("#approvalSecondLine input").length){
				$j("#approvalSecondLine").find('span').remove();
				$j("#approvalSecondLine").append(pValue.second_line_table);
			}else{
				$j("#approvalSecondLine").html(pValue.second_line_table);
			}
		}
		if(methods[2] !== undefined){
			$j("input[name='approval_third_line']").val(pValue.third_line);
			if($j("#approvalThirdLine input").length){
				$j("#approvalThirdLine").find('span').remove();
				$j("#approvalThirdLine").append(pValue.third_line_table);
			}else{
				$j("#approvalThirdLine").html(pValue.third_line_table);
			}
		}
		if(methods[3] !== undefined){
			$j("input[name='approval_fourth_line']").val(pValue.fourth_line);
			if($j("#approvalFourthLine input").length){
				$j("#approvalFourthLine").find('span').remove();
				$j("#approvalFourthLine").append(pValue.fourth_line_table);
			}else{
				$j("#approvalFourthLine").html(pValue.fourth_line_table);
			}
		}

		$j('.js-approval-line tr').each(function (index) {
			var thHeight = $j(this).children('th').height();
			var thWidth = $j(this).children('th').width();
			$j(this).find('th > div').css({'height' : (thHeight - 1) + 'px'});
			$j(this).find('th > div').css({'display' : 'table-cell'});
			$j(this).find('th > div').css({'width' : (thWidth - 1) + 'px'});
			$j(this).find('th > div').css({'vertical-align' : 'middle'});
			$j(this).find('th > div').css({'text-align' : 'center'});
		});
	}

	,approvalLineSetting: function(pLine, pType)
	{
		var form_no = '';
		if($j.inArray(ApprovalDocument._approvalMethod, ['CIRCULATION', 'MODIFY']) === -1){
			form_no = $j("select[name='approval_form_no']").val();
		}
		if(ApprovalDocument._formType === 'openapi'){
			form_no = ApprovalDocument._formNo;
		}
		var params = {
			"pMenu" : "approval_line_setting",
			"pDocumentMode" : Approval._documentMode,
			"pDocumentNo" : ApprovalDocument._documentNo,
			"pMethod" : ApprovalDocument._approvalMethod,
			"pApprovalType" : pType,
			"pFormNo" : form_no,
			"pFormNodeId" : $j('select[name="node_id"]').length ? $j('select[name="node_id"]').val() : $j('input[name="node_id"]').val(),
			"pCallback" : "ApprovalDocument.showApprovalLineSetting"
		}
		params.pApprovalLineType = pLine;
		params.pApprovalLine = $j("input[name='" + pLine + "']").val();

		ApprovalDocument.Ajax(params, false);
	}

	,showApprovalLineSetting: function(pValue)
	{
		$j("#wrap").append(pValue.result);
		$j('#layerApprovalLineSetting').showPopup();
		$j('#inputApprovalLineSetting').focus();
		
		if(pValue.toast_message){
			for(var i=0; i<pValue.toast_message.length; i++){
				showNoticeToast(pValue.toast_message[i]);
			}
		}
	}

	,addApprovalLineSetting: function(pId, pNo, pNode, pName)
	{
		if(this.checkApprovalLineSetting(pNo) === false){
			var approval_line_type = $j("#tempApprovalLineType").val();
			var approval_line_types = ['approval_first_line', 'approval_second_line', 'approval_third_line', 'approval_fourth_line'];
			approval_line_types.splice(approval_line_types.indexOf(approval_line_type), 1);

			if(this.checkDuplicateApprovalLineUser(pNo, approval_line_types)){
				alert(ApprovalLang.getMessage('APPROVAL_DUPLICATED_APPROVER'));
				return;
			}
			
			$j("#sortApprovalLineSetting").append('<li class="js-approval-line-setting ui-sortable-handle" user_no="'+pNo+'" node_id="'+pNode+'" old_new="new"><span>'+pName+'</span><span class="icon file_delete js-approval-line-setting-delete"></span><span class="spr-approval updown" title="이동"></span></li>');	
		}else{
			alert(ApprovalLang.getMessage('APPROVAL_DUPLICATED_APPROVER'));
			return;
		}
	}

	,checkApprovalLineSetting: function(pNo)
	{
		for(var i=0; i<$j("#sortApprovalLineSetting").children("li").length; i++){
			if(pNo === $j("#sortApprovalLineSetting ").children("li").eq(i).attr("user_no")){
				return true;
			}
		}

		return false;
	}

	,saveApprovalLineSetting: function(pApprovalType)
	{
		var approval_line_type = $j("#tempApprovalLineType").val();
		var approval_line = [];

		for(var i=0; i<$j("#sortApprovalLineSetting").children("li").length; i++){
			approval_line.push($j("#sortApprovalLineSetting").children("li").eq(i).attr("user_no") + "|" + $j("#sortApprovalLineSetting").children("li").eq(i).attr("node_id") + "|" + $j("#sortApprovalLineSetting").children("li").eq(i).attr("old_new"));
		}

		if(pApprovalType !== undefined){
			if(Approval._approvalLineNumber[pApprovalType] === undefined){
				alert(ApprovalLang.getMessage('APPROVAL_WRONG_REQUEST'));
				return false;
			}

			if(approval_line.length > Approval._approvalLineNumber[pApprovalType]){
				alert(ApprovalLang.getMessage('APPROVAL_SET_MAX_COUNT_'+pApprovalType).format(Approval._approvalLineNumber[pApprovalType]));
				return false;
			}
		}
		
		var first_line = second_line = third_line = fourth_line = "";
		if(approval_line_type === "approval_first_line"){
			first_line = approval_line.join(",");
		}else if(approval_line_type === "approval_second_line"){
			second_line = approval_line.join(",");
		}else if(approval_line_type === "approval_third_line"){
			third_line = approval_line.join(",");
		}else if(approval_line_type === "approval_fourth_line"){
			fourth_line = approval_line.join(",");
		}
		
		var form_no = '';
		if($j.inArray(ApprovalDocument._approvalMethod, ['CIRCULATION', 'MODIFY']) === -1){
			form_no = $j("select[name='approval_form_no']").val();
		}
		else if(ApprovalDocument._formType === 'openapi'){
			form_no = ApprovalDocument._formNo;
		}

		ApprovalDocument.Ajax({
			"pMenu" : "get_approval_line_select_table",
			"pMethod" : ApprovalDocument._approvalMethod,
			"pApprovalType" : pApprovalType,
			"pDocumentMode" : Approval._documentMode,
			"pDocumentNo" : ApprovalDocument._documentNo,
			"pFormNo" : form_no,
			"pFormNodeId" : $j('select[name="node_id"]').length ? $j('select[name="node_id"]').val() : $j('input[name="node_id"]').val(),
			"pFirstLine" : (approval_line_type === 'approval_first_line' ? first_line : $j("input[name='approval_first_line']").val()),
			"pSecondLine" : (approval_line_type === 'approval_second_line' ? second_line : $j("input[name='approval_second_line']").val()),
			"pThirdLine" : (approval_line_type === 'approval_third_line' ? third_line : $j("input[name='approval_third_line']").val()),
			"pFourthLine" : (approval_line_type === 'approval_fourth_line' ? fourth_line : $j("input[name='approval_fourth_line']").val()),
			"pCallback" : "ApprovalDocument.resultSaveApprovalLineSetting"
		}, false);
	}
	
	,resultSaveApprovalLineSetting : function(pValue)
	{
		ApprovalDocument.setApprovalLineSelectTable(pValue);
		$j('#layerApprovalLineSetting').hidePopup();
	}	

	,addApprovalLineUser: function(pId, pNo, pNode, pName)
	{
		var approval_method = ApprovalDocument._approvalMethod;
		var approval_line_id_match = {'inputApprovalFirstLine':'approvalFirstLine', 'inputApprovalSecondLine':'approvalSecondLine', 'inputApprovalThirdLine':'approvalThirdLine', 'inputApprovalFourthLine':'approvalFourthLine'};
		var approval_line_name_match = {'inputApprovalFirstLine':'approval_first_line', 'inputApprovalSecondLine':'approval_second_line', 'inputApprovalThirdLine':'approval_third_line', 'inputApprovalFourthLine':'approval_fourth_line'};
		var approval_line_id = approval_line_id_match[pId];
		var approval_line_name = approval_line_name_match[pId];
		
		if(this.checkLimitApprovalLineUser(ApprovalDocument._approvalMethod, approval_line_name)){
			return;
		}

		if(this.checkDuplicateApprovalLineUser(pNo, ['approval_first_line', 'approval_second_line', 'approval_third_line', 'approval_fourth_line'])){
			alert(ApprovalLang.getMessage('APPROVAL_DUPLICATE_USER'));
			return;
		}
		if(approval_method === "I" && pNo === ApprovalDocument._registerNo){
			alert(ApprovalLang.getMessage('APPROVAL_NO_ADD_WRITER'));
			return;
		}

		$j("#"+approval_line_id).append('<span class="refer-list" user_no="'+pNo+'" old_new="new" node_id="'+pNode+'">'+pName+'<span class="icon file_delete js-approval-line-delete"></span></span>');
		this.saveApprovalLine(approval_line_id, approval_line_name);
	}
	
	,checkLimitApprovalLineUser: function(pMethod, pLines)
	{
		var methods = pMethod.split('');
		var approval_lines = [];
		if(typeof pLines === 'string'){
			approval_lines = pLines.split(",");
		}else if(typeof pLines === 'object'){
			approval_lines = pLines;
		}

		for(var i=0; i<approval_lines.length; i++){
			var approval_line_length = $j("input[name='"+approval_lines[i]+"']").val().split(",").length + 1;
			var approval_type = '';
			if(approval_lines[i] === 'approval_first_line' && methods[0] !== undefined){
				approval_type = methods[0];
			}else if(approval_lines[i] === 'approval_second_line' && methods[1] !== undefined){
				approval_type = methods[1];
			}else if(approval_lines[i] === 'approval_third_line' && methods[2] !== undefined){
				approval_type = methods[2];
			}else if(approval_lines[i] === 'approval_fourth_line' && methods[3] !== undefined){
				approval_type = methods[3];
			}
			
			if(approval_type === ''){
				alert(ApprovalLang.getMessage('APPROVAL_WRONG_REQUEST'));
				console.log('checkLimitApprovalLineUser approval_type error');
				return true;
			}

			if(approval_line_length > Approval._approvalLineNumber[approval_type]){
				alert(ApprovalLang.getMessage('APPROVAL_SET_MAX_COUNT_' + approval_type).format(Approval._approvalLineNumber[approval_type]));
				return true;
			}
		}

		return false;
	}

	,checkDuplicateApprovalLineUser: function(pNo, pType)
	{
		var approval_lines = [], approval_line_user = [], approval_line_user_info = [];
		var return_value = false;
		if(typeof pType === 'string'){
			approval_lines = pType.split(",");
		}else if(typeof pType === 'object'){
			approval_lines = pType;
		}

		for(var i=0; i<approval_lines.length; i++){
			if(return_value === false){
				approval_line_user = $j("input[name='"+approval_lines[i]+"']").val().split(",");

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
	}

	,existApprovalLineUser: function(pId, pNo)
	{
		
	}

	,saveDocument: function(mode)
	{
		var approval_method = ApprovalDocument._approvalMethod;
		switch(approval_method){
			case "AFGHI" :
				this.saveApprovalLine('approvalSecondLine', 'approval_second_line');
			case "BCF" :
				this.saveApprovalLine('approvalThirdLine', 'approval_third_line');
			case "ADEF" :
				this.saveApprovalLine('approvalFourthLine', 'approval_fourth_line');
				break;
			case "I" :
				this.saveApprovalLine('approvalFirstLine', 'approval_first_line');
				break;
		}

		if(this.validateDocuementForm(mode) === false){
			return false;
		}
		
		if(mode === "MODIFY" && !confirm(ApprovalLang.getMessage('APPROVAL_MODIFY_CONTENT_CONTINUE'))){
			return;
		}

		if($j('.beta-text').length > 0){
			if(mode === "WRITE" && !confirm(ApprovalLang.getMessage('APPROVAL_WRITE_QUESTION_CONTINUE'))){
				return;
			}
		}else{
			if(mode === "WRITE" && !confirm("기안하시겠습니까?")){
				return;
			}
		}
		
		if(_this._formType === 'gabia_iframe' || _this._formType === 'iframe'){
			/*
			if($j('#alphaDiv').length === 0 && $j('#progressDiv').length === 0){ 
				Common._createBackGround(); 
				Common._createProgress(); 
			}
			*/ 
			
			var iframe_mode = '';
			if(mode === 'WRITE'){
				iframe_mode = 'add';
			}else if(mode === 'MODIFY'){
				iframe_mode = 'modify';
			}else if(mode === 'TEMP'){
				iframe_mode = 'temp';
			}
			
			var sendMsg = JSON.stringify({
				'mode' : iframe_mode
			});
			
			Approval.sendPostMessage(sendMsg);
		}else{
			ApprovalDocument.saveDocumentProcess(mode);
		}
	}
	
	,saveDocumentProcess : function(mode)
	{
		if($j.inArray(mode, ['CIRCULATION', 'MODIFY']) === -1){
			var form_no = $j("select[name='approval_form_no']").val();
		}

		if($j("input[name='node_id']").length) var node_id = $j("input[name='node_id']").val();
		else var node_id = $j("select[name='node_id']").val();
		var preserved_term = $j("select[name='preserved_term']").val();
		var security_level = $j("select[name='security_level']").val();
		var first_line = $j("input[name='approval_first_line']").val();
		var second_line = $j("input[name='approval_second_line']").val();
		var third_line = $j("input[name='approval_third_line']").val();
		var fourth_line = $j("input[name='approval_fourth_line']").val();
		
		var title = $j.trim($j("input[name='approval_document_title']").val());
		var content = "";
		if(mode !== "CIRCULATION" && _this._formType !== "spending_report"){
			if(ApprovalDocument._editFlag === 'Y' && !DEXT5.IsLoadedEditor('editor2')){
				alert('에디터 로드중...');
				return;
			}
			if(ApprovalDocument._editFlag === 'Y' && DEXT5.IsLoadedEditor('editor2')){
				var d5ele = DEXT5.getD5Dom('editor2');

				if(d5ele.document.getElementById('hw_dext_default_style')){
					d5ele.document.getElementById('hw_dext_default_style').style.height = '';
				}
				
				content = DEXT5.getBodyValue('editor2');
			}
		}

		var contentBytes = Common.byte_check(content);
		
		if(content !== '' && contentBytes >= 10000000){
			alert('문서 내용 초과 [' + contentBytes.comma() +  ' / 10,000,000 bytes]');
			return;
		}

		if(preserved_term === "" || $j.inArray(preserved_term, ['1', '3', '5', '10', '0']) === -1){
			alert('보존 연한을 선택해주세요.');
			return;
		}
		if(security_level === "" || $j.inArray(security_level, ['S', 'A', 'B', 'C']) === -1){
			alert('보안 등급을 선택해주세요.');
			return;
		}

		var attached_file = [], related_document = [], attached_temp_flle = [];
		$j(".js-approval-attach").each(function(index, value){
			if($j(value).attr("file")){
				attached_file.push($j(value).attr("file"));
			}
		});

		$j(".js-approval-temp-attach").each(function(index, value){
			if($j(value).attr("file")){
				attached_temp_flle.push($j(value).attr("file"));
			}
		});

		$j(".js-approval-related").each(function(index, value){
			if($j(value).attr("document_no")){
				related_document.push($j(value).attr("document_no"));
			}
		});
		
		if(_this._formType === "db_form" && typeof dbUnitWrite === "object"){
			var components_values = dbUnitWrite.getDBUnitComponentsValues();
			if(components_values === false){
				return;
			}
		}
		
		var approval_document = {
			"pMenu" : "save_document",
			"pMode" : mode,
			"pExtraMode" : Approval._documentExtraMode,
			"pDocumentNo" : this._documentNo,
			"pFormNo" : form_no,
			"pNodeId" : node_id,
			"pPreservedTerm" : preserved_term,
			"pSecurityLevel" : security_level,
			"pFirstLine" : first_line,
			"pSecondLine" : second_line,
			"pThirdLine" : third_line,
			"pFourthLine" : fourth_line,
			"pTitle" : title,
			"pContent" : content,
			"pAttahcedFile" : attached_file,
			"pAttachedTempFile" : attached_temp_flle,
			"pRelatedDocument" : related_document,
			"pCallback" : "ApprovalDocument.resultSaveDocument",
//          페이지 연동 문서 타입 설정
            "pDocumentType" : _this._formType
		}

		if(_this._formType === "spending_report"){ // 지출 결의
			approval_document.pSpendingReport = _this._spendingReport;
		}else if(_this._formType === "remittance"){ // 품의서
			approval_document.pRemittance = _this._remittance;
		}else if(_this._formType === "gabia_iframe" || _this._formType === "iframe"){
			approval_document.pHiworksNo = ApprovalDocument._hiworksNo;
			if(mode === 'TEMP' && ApprovalDocument._changedForm !== undefined){
				approval_document.pChangedForm = ApprovalDocument._changedForm;
			}
		}else if(_this._formType === "openapi"){ // OpenAPI
			approval_document.pOpenapiKey = _this._openapiKey;
			approval_document.pFormNo = _this._formNo;
		}else if(_this._formType === "db_form"){
			if(typeof dbUnitWrite === "object"){
				var components_values = dbUnitWrite.getDBUnitComponentsValues();
				if(components_values !== false){
					approval_document.pComponents = {'unit_no' : dbUnitWrite._unitNo, 'values' : components_values};
				}else{
					return;
				}
			}
		}

		this._documentSubmit = true;

		ApprovalDocument.Ajax(approval_document);
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

	,resultSaveDocument: function(pValue)
	{
		if(_this._formType === "gabia_iframe" || _this._formType === "iframe"){
			if(pValue.complete === "Y"){
				if(pValue.url){
					Approval._redirectUrl = pValue.url;
				}else{
					Approval._redirectUrl = Common.getRoot() + "approval/document/lists/P";
				}

				var sendMsg = JSON.stringify({
					'mode' : 'sign',
					'status' : '7'
				});
				
				Approval.sendPostMessage(sendMsg);

				if(pValue.message){
					alert(pValue.message);
				}
				
				return;
			}
		}
		
		if(pValue.message){
			alert(pValue.message);
		}

		if(pValue.url){
			document.location.href = pValue.url;
		}else{
			document.location.href = Common.getRoot() + "approval/document/lists/P";
		}
	}

	,validateDocuementForm: function(mode)
	{
		if($j.inArray(mode, ['CIRCULATION', 'MODIFY']) === -1 && $j.inArray(_this._formType, ['openapi']) === -1){
			if($j("select[name='approval_form_no']").val() === undefined || $j("select[name='approval_form_no']").val() === ""){
				alert(ApprovalLang.getMessage('APPROVAL_SELECT_DOCUMENT_FORM'));
				$j("select[name='approval_form_no']").focus();
				return false;
			}
		}

		var approval_method = ApprovalDocument._approvalMethod;

		if($j.trim($j("input[name='approval_document_title']").val()) === ""){
			alert(ApprovalLang.getMessage('APPROVAL_WRITE_TITLE'));
			$j("input[name='approval_document_title']").focus();
			return false;
		}
		if(mode !== "CIRCULATION" && _this._formType !== "spending_report" && _this._formType !== "gabia_iframe" && _this._formType !== "iframe"){
//dext
				if(ApprovalDocument._editFlag === 'Y' && DEXT5.IsLoadedEditor('editor2')){
					if(DEXT5.getBodyValue('editor2') === ''){
						alert(ApprovalLang.getMessage('APPROVAL_WRITE_CONTENT'));
						return false;
					}
				}
//
		}

		if(_this._formType === "spending_report"){ // 지출 결의
			if(_this._spendingReport.spender.user_no === ""){
				alert(ApprovalLang.getMessage('APPROVAL_WRITE_SPENDER'));
				$j("#inputSpenderName").focus();
				return false;
			}
			if(_this._spendingReport.type === "P"){
				if($j("#infoEmployeeAccount").children().filter(":odd").html() === ""){
					alert(ApprovalLang.getMessage('APPROVAL_NOT_EXIST_ACCOUNT'));
					return false;
				}
			}else{
				if($j("#corporationCard").children().length === 1){
					alert(ApprovalLang.getMessage('APPROVAL_NOT_EXIST_CARD'));
					return false;
				}
				if($j("#corporationCard").val() === ""){
					alert(ApprovalLang.getMessage('APPROVAL_SELECT_CORPORATION_CARD'));
					return false;
				}
				_this._spendingReport.spender.card = $j("#corporationCard").val();
			}

			if(_this._spendingReport.deal.length === 0){
				alert(ApprovalLang.getMessage('APPROVAL_NOT_EXIST_DEAL'));
				return false;
			}
		}

		return true;
	}

	,deleteDocument: function()
	{
		if(confirm(ApprovalLang.getMessage('APPROVAL_WANT_TO_DELETE_NOT_RESTORE'))){
			ApprovalDocument.Ajax({
				"pMenu" : "delete_document",
				"pNo" : $j("input[name='approval_document_no']").val(),
				"pCallback" : "ApprovalDocument.resultDeleteDocument"
			});
		}
	}

	,resultDeleteDocument: function(pValue)
	{
		if(pValue.message){
			alert(pValue.message);
		}

		ApprovalDocument._documentSubmit = true;

		if(pValue.url){
			location.href = pValue.url;
		}else{
			location.href = Common.getRoot() + "approval/document";
		}
	}

	,batchAction: function(pType, pListMode)
	{
		var checked_lists = [];
		$j(".js-checkbox-approval-lists").each(function(index, value){
			if($j(value).prop("checked")){
				checked_lists.push($j(value).val());
			}
		});

		if(checked_lists.length === 0){
			alert(ApprovalLang.getMessage('APPROVAL_SELECT_DOCUMENT'));
			return;
		}

		var tf = false;
		
		if(pType === "approval"){
			if(pListMode === 'A'){
				tf = confirm(ApprovalLang.getMessage('APPROVAL_WANT_TO_BATCH_APPROVAL_LIST_A'));
			}else{
				tf = confirm(ApprovalLang.getMessage('APPROVAL_WANT_TO_BATCH_APPROVAL'));
			}
			
			if(tf){
				ApprovalDocument.Ajax({
					"pMenu" : "approval_action",
					"pNo" : checked_lists,
					"pListMode" : pListMode === 'A' ? 'A' : '',
					"pCallback" : "ApprovalDocument.resultBatchAction"
				});
			}
		}else if(pType === "check"){
			if(pListMode === 'A'){
				tf = confirm(ApprovalLang.getMessage('APPROVAL_WANT_TO_BTACH_CHECK_LIST_A'));
			}else{
				tf = confirm(ApprovalLang.getMessage('APPROVAL_WANT_TO_BTACH_CHECK'))
			}
			
			if(tf){
				ApprovalDocument.Ajax({
					"pMenu" : "check_action",
					"pNo" : checked_lists,
					"pListMode" : pListMode === 'A' ? 'A' : '',
					"pCallback" : "ApprovalDocument.resultBatchAction"
				});
			}
		}
	}

	,resultBatchAction: function(pValue)
	{
		alert(pValue.message);

		if(pValue.url){
			location.href = pValue.url;
		}else{
			document.location.reload();
		}
	}

	,changeSpendingReportType: function()
	{
		if(_this.initDealInformation() === false){
			$j("input[name='accounting_type'][value='"+ _this._spendingReport.type +"']").prop("checked", true);
			return;
		}

		_this._spendingReport.type = $j("input[name='accounting_type']:checked").val();
		_this.setAutoTitleInSpendingReport();

		if(_this._spendingReport.type === "P"){
			$j("#infoEmployeeAccount").show();
			$j("#infoCorporationCard").hide();
		}else if(_this._spendingReport.type === "C"){
			$j("#infoEmployeeAccount").hide();
			$j("#infoCorporationCard").show();
		}

		this.getSpenderAccountingInfo();
	}

	,changeFixedDate: function()
	{
		if(_this.initDealInformation() === false){
			$j("#selectFixedYear").val(_this._spendingReport.fixedYear);
			$j("#selectFixedMonth").val(_this._spendingReport.fixedMonth);
			if($j("#selectFixedDays").length){
				
				if($j('#selectFixedDays option[value="' + _this._spendingReport.fixedDays + '"]').length){
					$j('#selectFixedDays').val(_this._spendingReport.fixedDays);
				}else{
					var lastDays = new Date($j('#selectFixedYear').val(), $j('#selectFixedMonth').val(), 0).getDate();
					
					if(_this._spendingReport.fixedDays == lastDays && ($j('#selectFixedDays option[value="' + _this._spendingReport.fixedDays + '"]').length || $j('#selectFixedDays option[value="LAST"]').length)){
						$j("#selectFixedDays").val('LAST');
					}else{
						$j("#selectFixedDays").val('0');
					}
				}
			}
			
			return;
		}

		_this._spendingReport.fixedYear = $j("#selectFixedYear").val();
		_this._spendingReport.fixedMonth = $j("#selectFixedMonth").val();
		
		if($j("#selectFixedDays").length){
			var fixedDays = $j('#selectFixedDays').val();
			var lastDays = new Date($j('#selectFixedYear').val(), $j('#selectFixedMonth').val(), 0).getDate();
			if(fixedDays !== '0' && fixedDays !== 'LAST' && fixedDays > lastDays){
				alert('유효하지 않은 날짜입니다.');
				$j('#selectFixedDays').val(0);
			}
			
			if(fixedDays === 'LAST'){
				fixedDays = lastDays;
			}
				
			_this._spendingReport.fixedDays = fixedDays;
		}else{
			_this._spendingReport.fixedDays = "0";
		}
		_this.setAutoTitleInSpendingReport();

	}

	,modifySpenderName: function()
	{
		if(_this.initDealInformation() === false){
			return;
		}
		ApprovalDocument.setSpenderName('', '', '', '', true);
	}

	,getSpenderAccountingInfo: function()
	{
		if(_this._spendingReport.spender.user_no !== ""){
			ApprovalDocument.Ajax({
				"pMenu" : "get_spender_accounting_info",
				"pType" : _this._spendingReport.type,
				"pNo" : _this._spendingReport.spender.user_no,
				"pCallback" : "ApprovalDocument.showSpenderAccountingInfo"
			}, false);
		}
	}

	,showSpenderAccountingInfo: function(pValue)
	{
		$j("#infoEmployeeAccount").children().filter(":odd").html('');
		$j("#corporationCard").children().filter("option[value!='']").remove();

		if(pValue.warning === "Y"){
			alert(pValue.message);
			return;
		}

		if(pValue.type === "P"){
			$j("#infoEmployeeAccount").children().filter(":odd").html(pValue.result);	
		}else if(pValue.type === "C"){
			for(var i=0; i<pValue.result.length; i++){
				$j("#corporationCard").append('<option value="'+pValue.result[i]["no"]+'">'+pValue.result[i]["card_name"]+" "+pValue.result[i]["card_number"]+'</option>');
			}
		}
	}

	,setSpenderName: function(pNo, pNodeId, pUserName, pNodeName, pChange)
	{
		if(pChange === true){
			_this._spendingReport.spender.user_no = '';
			_this._spendingReport.spender.node_id = '';

			$j("#textSpenderName").html('');
			$j("#textSpenderName").hide();
			$j("#inputSpenderName").show();
			$j("#inputSpenderName").focus();
			$j("#modifySpenderName").hide();
			$j("#infoEmployeeAccount").children().filter(":odd").html('');
			$j("#corporationCard").children().filter("option[value!='']").remove();

			return;
		}

		_this._spendingReport.spender.user_no = pNo;
		_this._spendingReport.spender.node_id = pNodeId;
		$j("#textSpenderName").html(pNodeName + ' ' + pUserName);
		$j("#inputSpenderName").hide();
		$j("#textSpenderName").show();
		$j("#modifySpenderName").show();

		_this.getSpenderAccountingInfo();
	}

	,initDealInformation: function()
	{
		if(_this._spendingReport.deal.length === 0){
			return true;
		}

		if(confirm(ApprovalLang.getMessage('APPROVAL_INIT_DEAL_CONTINUE'))){
			$j("#tableAccoutingDealInformation tbody").children().remove();
			_this._spendingReport.deal = [];
			return true;
		}

		return false;
	}

	,setAutoTitleInSpendingReport: function()
	{
		var form_title = $j("select[name='approval_form_no']").children().filter(":selected").text();
		if(Approval._documentMode === 'MODIFY'){
			form_title = ApprovalDocument._formTitle;
		}
		var spending_report_title_pattern = new RegExp('^[0-9]{4}년\\s[0-9]{1,2}월\\s(?:[0-9]{0,2}일\\s){0,1}'+ form_title +'\\s\-\\s개인|법인$');;

		if(spending_report_title_pattern.test($j.trim($j("input[name='approval_document_title']").val()))){
			// 2017년 08월 지출 결의 - 개인
			var speding_report_title = '';
			if(_this._spendingReport.spendingRegist === "M"){
				speding_report_title = $j("#selectFixedYear").val() + "년 " + $j("#selectFixedMonth").val() + "월 " + form_title + " - " + ($j("input[name='accounting_type']:checked").val() === "P" ? "개인" : "법인");
			}else if(_this._spendingReport.spendingRegist === "D"){
				var days = $j('#selectFixedDays').val() === 'LAST' ? new Date($j('#selectFixedYear').val(), $j('#selectFixedMonth').val(), 0).getDate() : $j('#selectFixedDays').val();
				speding_report_title = $j("#selectFixedYear").val() + "년 " + $j("#selectFixedMonth").val() + "월 " + (days !== '' && days !== '0' ? (days + "일 ") : '') + form_title + " - " + ($j("input[name='accounting_type']:checked").val() === "P" ? "개인" : "법인");
			}else if(_this._spendingReport.spendingRegist === "C"){
				var days = _this._spendingReport.fixedDays;
				speding_report_title = _this._spendingReport.fixedYear + "년 " + _this._spendingReport.fixedMonth + "월 " + (days !== '' && days !== '0' ? (days + "일 ") : '') + form_title + " - " + ($j("input[name='accounting_type']:checked").val() === "P" ? "개인" : "법인");
			}
			
			$j("input[name='approval_document_title']").val(speding_report_title);
		}
		
	}

	,getDealInformationLayer: function(pObj)
	{
		if(_this._spendingReport.spender.user_no === ''){
			alert(ApprovalLang.getMessage('APPROVAL_CHECK_SPENDER'));
			$j('#inputSpenderName').focus();
			return;
		}

		if(_this._spendingReport.type === "P"){
			if($j("#infoEmployeeAccount").children().filter(":odd").html() === ""){
				alert(ApprovalLang.getMessage('APPROVAL_NOT_EXIST_ACCOUNT'));
				return;
			}
		}else{
			if($j("#corporationCard").children().length === 1){
				alert(ApprovalLang.getMessage('APPROVAL_NOT_EXIST_CARD'));
				return;
			}
			if($j("#corporationCard").val() === ""){
				alert(ApprovalLang.getMessage('APPROVAL_SELECT_CORPORATION_CARD'));
				return;
			}
		}
		
		if(_this._spendingReport.spendingRegist === 'D'){
			var fixedDays = $j('#selectFixedDays').val(); 
			if(fixedDays === '' || fixedDays === '0'){
				alert(ApprovalLang.getMessage('APPROVAL_WRONG_BASE_DAYS_SELECT_AGAIN'));
				return;
			}
		}else if(_this._spendingReport.spendingRegist === 'C'){
			if($j('#spendingDateCustom').length <= 0 || $j('#spendingDateCustom').val() === ''){
				alert(ApprovalLang.getMessage('APPROVAL_WRONG_BASE_DAYS_SELECT_AGAIN'));
				$j('#spendingDateCustom').focus();
				return;
			}
		}

		var mode = 'save';
		_this._spendingReport.currentDeal = {};
		if($j(pObj).length > 0){
			mode = "modify";

			var searchIndex = -1;
			$j.each($j("#tableAccoutingDealInformation tbody").children(), function(idx, ele){
				if($j(pObj).parent().parent()[0] === $j(ele)[0]){
					searchIndex = idx;
					return false;
				}
			});
			if(searchIndex > -1){
				_this._spendingReport.modifyIndex = searchIndex;
				_this._spendingReport.currentDeal = _this._spendingReport.deal[searchIndex];
			}
		}

		ApprovalDocument.Ajax({
			"pMenu" : "get_deal_information_layer",
			"pMode" : mode,
			"pType" : _this._spendingReport.type,
			"pCallback" : "ApprovalDocument.showDealInformationLayer"
		}, false);
	}

	,showDealInformationLayer: function(pValue)
	{
		$j("#wrap").append(pValue.result);
	
		if(Object.keys(_this._spendingReport.currentDeal).length > 0){
			if(_this._spendingReport.type === 'P'){
				$j("#inputAccountingAccount").hide();
				$j("#btnAccountingAccountSearchLayer").hide();
				$j("#textAccountingAccount").html(_this._spendingReport.currentDeal.account_name);
				$j("#textAccountingAccount").show();
				$j("#btnAccountingAccount").show();
				$j("#textExpenseDate").val(_this._spendingReport.currentDeal.expense_date);
				$j("#inputAccountingDepartment").hide();
				$j("#btnAccountingDepartmentSearchLayer").hide();
				$j("#textAccountingDepartment").html(_this._spendingReport.currentDeal.department_name);
				$j("#textAccountingDepartment").show();
				$j("#btnAccountingDepartment").show();
				var customer_name = _this._spendingReport.currentDeal.customer_name;
				var customer_code = _this._spendingReport.currentDeal.customer_code;
				var company_num = _this._spendingReport.currentDeal.company_num;
				$j("#selectAccountingProof").val(_this._spendingReport.currentDeal.proof);
				_this.changeAccountingProof();
				_this._spendingReport.currentDeal.customer_name = customer_name;
				_this._spendingReport.currentDeal.customer_code = customer_code;
				_this._spendingReport.currentDeal.company_num = company_num;
				$j("#inputSupplyPrice").val(_this._spendingReport.currentDeal.supply_price.toString().numberFormat());
				if($j.inArray(_this._spendingReport.currentDeal.proof, ['tax_bill', 'cash_receipt']) > -1){
					$j("#inputTaxAmount").val(_this._spendingReport.currentDeal.tax_amount.toString().numberFormat());
				}
				if($j.inArray(_this._spendingReport.currentDeal.proof, ['tax_bill', 'bill', 'cash_receipt']) > -1){
					$j("#inputDealCustomer").hide();
					$j("#inputAccountingCustomer").hide();
					$j("#btnAccountingCustomerSearchLayer").hide();
					$j("#textAccountingCustomer").html(_this._spendingReport.currentDeal.customer_name);
					$j("#textAccountingCustomer").show();
					$j("#btnAccountingCustomer").show();
					$j("#inputCompanyNum").val(_this._spendingReport.currentDeal.company_num);
				}else{
					$j("#inputDealCustomer").val(_this._spendingReport.currentDeal.customer_name);
				}
				if(_this._spendingReport.currentDeal.proof === 'cash_receipt'){
					$j("#inputCashReceiptsNum").val(_this._spendingReport.currentDeal.cash_receipts_num);
				}
				$j("#inputBrief").val(_this._spendingReport.currentDeal.brief);
			}else{
				$j("#inputAccountingAccount").hide();
				$j("#btnAccountingAccountSearchLayer").hide();
				$j("#textAccountingAccount").html(_this._spendingReport.currentDeal.account_name);
				$j("#textAccountingAccount").show();
				$j("#btnAccountingAccount").show();
				$j("#textExpenseDate").val(_this._spendingReport.currentDeal.expense_date);
				$j("#inputAccountingDepartment").hide();
				$j("#btnAccountingDepartmentSearchLayer").hide();
				$j("#textAccountingDepartment").html(_this._spendingReport.currentDeal.department_name);
				$j("#textAccountingDepartment").show();
				$j("#btnAccountingDepartment").show();
				if(_this._spendingReport.currentDeal.supply_price){
					$j("#inputPrice").val(_this._spendingReport.currentDeal.supply_price.toString().numberFormat());
				}
				if(_this._spendingReport.currentDeal.tax_amount){
					$j("#inputTaxAmount").val(_this._spendingReport.currentDeal.tax_amount.toString().numberFormat());
				}
				$j("#inputCompanyNum").val(_this._spendingReport.currentDeal.company_num);
				$j("#inputDealCustomer").val(_this._spendingReport.currentDeal.customer_name);
				$j("#inputBrief").val(_this._spendingReport.currentDeal.brief);
			}
		}

		$j("#layerDealInformation").showPopup();

	}

	,changeAccountingProof: function()
	{
		var accounting_proof = $j("#selectAccountingProof").val();
		var proof_except_check = true;
		if($j.inArray(_this._spendingReport.currentDeal.proof, ['tax_bill', 'bill', 'cash_receipt']) === -1){
			proof_except_check = false;
		}

		if(accounting_proof === "receipt"){ // 일반 영수증
			$j("#inputTaxAmount").val('');
			$j("#inputTaxAmount").prop('disabled', true);
			$j("#inputDealCustomer").show();
			$j("#inputAccountingCustomer").hide();
			$j("#btnAccountingCustomerSearchLayer").hide();
			$j("#textAccountingCustomer").hide();
			$j("#btnAccountingCustomer").hide();
			$j("#textAccountingCustomer").html('');
			$j("#inputCompanyNum").val('');
			_this._spendingReport.currentDeal.customer_name = '';
			_this._spendingReport.currentDeal.customer_code = '';
			_this._spendingReport.currentDeal.account_num = '';
			$j("#inputCashReceiptsNum").prop("disabled", true);
			$j("#inputCashReceiptsNum").val('');
		}else if(accounting_proof === "card"){ // 개인 카드
			$j("#inputTaxAmount").val('');
			$j("#inputTaxAmount").prop('disabled', true);
			$j("#inputDealCustomer").show();
			$j("#inputAccountingCustomer").hide();
			$j("#btnAccountingCustomerSearchLayer").hide();
			$j("#textAccountingCustomer").hide();
			$j("#btnAccountingCustomer").hide();			
			$j("#textAccountingCustomer").html('');
			$j("#inputCompanyNum").val('');
			_this._spendingReport.currentDeal.customer_name = '';
			_this._spendingReport.currentDeal.customer_code = '';
			_this._spendingReport.currentDeal.account_num = '';
			$j("#inputCashReceiptsNum").prop("disabled", true);
			$j("#inputCashReceiptsNum").val('');
		}else if(accounting_proof === "tax_bill"){ // 세금 계산서
			$j("#inputTaxAmount").removeClass("changed_input_tax");
			$j("#inputTaxAmount").val('');
			$j("#inputTaxAmount").prop('disabled', false);
			if($j("#inputSupplyPrice").val() !== ""){
				var supply_price = $j("#inputSupplyPrice").val().replace(/(,)/g, "");
				var tax = Math.round(parseInt(supply_price)/10);
				$j("#inputTaxAmount").val(tax.toString().numberFormat());
			}
			$j("#inputDealCustomer").hide();
			$j("#inputDealCustomer").html('');
			if(proof_except_check === false){
				$j("#inputAccountingCustomer").show();
				$j("#btnAccountingCustomerSearchLayer").show();
				$j("#textAccountingCustomer").hide();
				$j("#btnAccountingCustomer").hide();
				$j("#textAccountingCustomer").html('');
				$j("#inputCompanyNum").val('');
				_this._spendingReport.currentDeal.customer_name = '';
				_this._spendingReport.currentDeal.customer_code = '';
				_this._spendingReport.currentDeal.account_num = '';
			}
			$j("#inputCashReceiptsNum").prop("disabled", true);
			$j("#inputCashReceiptsNum").val('');
		}else if(accounting_proof === "bill"){ // 계산서
			$j("#inputTaxAmount").val('');
			$j("#inputTaxAmount").prop('disabled', true);
			$j("#inputDealCustomer").hide();
			$j("#inputDealCustomer").html('');
			if(proof_except_check === false){
				$j("#inputAccountingCustomer").show();
				$j("#btnAccountingCustomerSearchLayer").show();
				$j("#textAccountingCustomer").hide();
				$j("#btnAccountingCustomer").hide();
				$j("#textAccountingCustomer").html('');
				$j("#inputCompanyNum").val('');
				_this._spendingReport.currentDeal.customer_name = '';
				_this._spendingReport.currentDeal.customer_code = '';
				_this._spendingReport.currentDeal.account_num = '';
			}
			$j("#inputCashReceiptsNum").prop("disabled", true);
			$j("#inputCashReceiptsNum").val('');
		}else if(accounting_proof === "cash_receipt"){ // 현금 영수증
			$j("#inputTaxAmount").removeClass("changed_input_tax");
			$j("#inputTaxAmount").val('');
			$j("#inputTaxAmount").prop('disabled', false);
			if($j("#inputSupplyPrice").val() !== ""){
				var supply_price = $j("#inputSupplyPrice").val().replace(/(,)/g, "");
				var tax = Math.round(parseInt(supply_price)/10);
				$j("#inputTaxAmount").val(tax.toString().numberFormat());
			}
			$j("#inputDealCustomer").hide();
			$j("#inputDealCustomer").html('');
			if(proof_except_check === false){
				$j("#inputAccountingCustomer").show();
				$j("#btnAccountingCustomerSearchLayer").show();
				$j("#textAccountingCustomer").hide();
				$j("#btnAccountingCustomer").hide();
				$j("#textAccountingCustomer").html('');
				$j("#inputCompanyNum").val('');
				_this._spendingReport.currentDeal.customer_name = '';
				_this._spendingReport.currentDeal.customer_code = '';
				_this._spendingReport.currentDeal.account_num = '';
			}
			$j("#inputCashReceiptsNum").prop("disabled", false);
		}else if(accounting_proof === "etc"){ // 기타
			$j("#inputTaxAmount").val('');
			$j("#inputTaxAmount").prop('disabled', true);
			$j("#inputDealCustomer").show();
			$j("#inputAccountingCustomer").hide();
			$j("#btnAccountingCustomerSearchLayer").hide();
			$j("#textAccountingCustomer").hide();
			$j("#btnAccountingCustomer").hide();			
			$j("#textAccountingCustomer").html('');
			$j("#inputCompanyNum").val('');
			_this._spendingReport.currentDeal.customer_name = '';
			_this._spendingReport.currentDeal.customer_code = '';
			_this._spendingReport.currentDeal.account_num = '';
			$j("#inputCashReceiptsNum").prop("disabled", true);
			$j("#inputCashReceiptsNum").val('');
		}else{
			$j("#inputTaxAmount").val('');
			$j("#inputTaxAmount").prop('disabled', true);
			$j("#inputDealCustomer").show();
			$j("#inputAccountingCustomer").hide();
			$j("#btnAccountingCustomerSearchLayer").hide();
			$j("#textAccountingCustomer").hide();
			$j("#btnAccountingCustomer").hide();
			$j("#textAccountingCustomer").html('');
			$j("#inputCompanyNum").val('');
			_this._spendingReport.currentDeal.customer_name = '';
			_this._spendingReport.currentDeal.customer_code = '';
			_this._spendingReport.currentDeal.account_num = '';
			$j("#inputCashReceiptsNum").prop("disabled", true);
			$j("#inputCashReceiptsNum").val('');
		}

		_this._spendingReport.currentDeal.proof = accounting_proof;
	}

	,setAccountingAccount: function(pName, pCode, pChange)
	{
		if(pChange === true)
		{
			_this._spendingReport.currentDeal.account_name = '';
			_this._spendingReport.currentDeal.account_code = '';

			$j("#textAccountingAccount").html('');
			$j("#textAccountingAccount").hide();
			$j("#btnAccountingAccount").hide();
			$j("#inputAccountingAccount").show();
			$j("#inputAccountingAccount").focus();
			$j('#btnAccountingAccountSearchLayer').show();

			return;
		}

		_this._spendingReport.currentDeal.account_name = pName;
		_this._spendingReport.currentDeal.account_code = pCode;

		$j("#textAccountingAccount").html(pName);
		$j("#inputAccountingAccount").hide();
		$j("#textAccountingAccount").show();
		$j("#btnAccountingAccount").show();
		$j('#btnAccountingAccountSearchLayer').hide();
	}

	,setAccountingDepartment: function(pName, pCode, pChange)
	{
		if(pChange === true)
		{
			_this._spendingReport.currentDeal.department_name = '';
			_this._spendingReport.currentDeal.department_code = '';

			$j("#textAccountingDepartment").html('');
			$j("#textAccountingDepartment").hide();
			$j("#btnAccountingDepartment").hide();
			$j("#inputAccountingDepartment").show();
			$j("#inputAccountingDepartment").focus();
			$j("#btnAccountingDepartmentSearchLayer").show();

			return;
		}

		_this._spendingReport.currentDeal.department_name = pName;
		_this._spendingReport.currentDeal.department_code = pCode;

		$j("#textAccountingDepartment").html(pName);
		$j("#inputAccountingDepartment").hide();
		$j("#textAccountingDepartment").show();
		$j("#btnAccountingDepartment").show();
		$j("#btnAccountingDepartmentSearchLayer").hide();
	}

	,setAccountingCustomer: function(pName, pCode, pCompanyNum, pChange)
	{
		if(pChange === true)
		{
			_this._spendingReport.currentDeal.customer_name = '';
			_this._spendingReport.currentDeal.customer_code = '';
			_this._spendingReport.currentDeal.company_num = '';

			$j("#textAccountingCustomer").html('');
			$j("#textAccountingCustomer").hide();
			$j("#btnAccountingCustomer").hide();
			$j("#inputCompanyNum").val('');
			$j("#inputAccountingCustomer").show();
			$j("#btnAccountingCustomerSearchLayer").show();
			$j("#inputAccountingCustomer").focus();

			return;
		}

		_this._spendingReport.currentDeal.customer_name = pName;
		_this._spendingReport.currentDeal.customer_code = pCode;
		_this._spendingReport.currentDeal.company_num = pCompanyNum;

		$j("#inputAccountingCustomer").hide();
		$j("#btnAccountingCustomerSearchLayer").hide();
		$j("#textAccountingCustomer").html(pName);
		$j("#textAccountingCustomer").show();
		$j("#btnAccountingCustomer").show();
		$j("#inputCompanyNum").val(pCompanyNum);
	}

	,saveDealInformation: function(pType)
	{
		if(_this._spendingReport.type === 'P'){
			if(!_this._spendingReport.currentDeal.account_name || !_this._spendingReport.currentDeal.account_code){
				alert(ApprovalLang.getMessage('APPROVAL_WRITE_ACCOUNT'));
				$j("#inputAccountingAccount").focus();
				return;
			}

			if($j("#textExpenseDate").val() === ""){
				alert(ApprovalLang.getMessage('APPROVAL_WRITE_SPENDING_DATE'));
				$j("#textExpenseDate").focus();
				return;
			}
			_this._spendingReport.currentDeal.expense_date = $j("#textExpenseDate").val();

			if(!_this._spendingReport.currentDeal.department_name || !_this._spendingReport.currentDeal.department_code){
				alert(ApprovalLang.getMessage('APPROVAL_WRITE_SPEDNING_NODE'));
				$j("#inputAccountingDepartment").focus();
				return;
			}

			if($j("#selectAccountingProof").val() === ""){
				alert(ApprovalLang.getMessage('APPROVAL_WRITE_PROOF'));
				$j("#selectAccountingProof").focus();
				return;
			}
			_this._spendingReport.currentDeal.proof = $j("#selectAccountingProof").val();

			var price_pattern = /^[1-9][0-9]{1,20}$/;
			var supply_price = $j.trim($j("#inputSupplyPrice").val()).replace(/(,)/g, "");
			if(!price_pattern.test(supply_price)){
				alert(ApprovalLang.getMessage('APPROVAL_ONLY_NUMBER_IN_SUPPLY'));
				$j("#inputSupplyPrice").focus();
				return;
			}
			_this._spendingReport.currentDeal.supply_price = parseInt(supply_price);

			if($j.inArray(_this._spendingReport.currentDeal.proof, ['tax_bill', 'cash_receipt']) > -1){
				var tax_amount = $j.trim($j("#inputTaxAmount").val()).replace(/(,)/g, "");
				_this._spendingReport.currentDeal.tax_amount = parseInt(tax_amount);
			}else{
				_this._spendingReport.currentDeal.tax_amount = '';
			}

			if($j.inArray(_this._spendingReport.currentDeal.proof, ['tax_bill', 'bill', 'cash_receipt']) > -1){
				if(!_this._spendingReport.currentDeal.customer_name || !_this._spendingReport.currentDeal.customer_code){
					alert(ApprovalLang.getMessage('APPROVAL_WRITE_CUSTOMER'));
					$j("#inputAccountingCustomer").focus();
					return;
				}
			}else{
				var customer_name = $j.trim($j("#inputDealCustomer").val());
				if(customer_name === ""){
					alert(ApprovalLang.getMessage('APPROVAL_WRITE_CUSTOMER'));
					$j("#inputDealCustomer").focus();
					return;
				}
				_this._spendingReport.currentDeal.customer_name = customer_name;
				_this._spendingReport.currentDeal.customer_code = "";
				_this._spendingReport.currentDeal.company_num = "";
			}

			if(_this._spendingReport.currentDeal.proof === 'cash_receipt'){
				var cash_receipts_num = $j.trim($j("#inputCashReceiptsNum").val());
				if(cash_receipts_num === ""){
					alert(ApprovalLang.getMessage('APPROVAL_WRITE_CASH_RECEIPTS'));
					$j("#inputCashReceiptsNum").focus();
					return;
				}
				_this._spendingReport.currentDeal.cash_receipts_num = cash_receipts_num;
			}else{
				_this._spendingReport.currentDeal.cash_receipts_num = "";
			}

			var brief = $j.trim($j("#inputBrief").val());
			if(brief === ""){
				alert(ApprovalLang.getMessage('APPROVAL_WRITE_BRIEFS'));
				$j("#inputBrief").focus();
				return;
			}
			_this._spendingReport.currentDeal.brief = brief;
		}else{
			if(!_this._spendingReport.currentDeal.account_name || !_this._spendingReport.currentDeal.account_code){
				alert(ApprovalLang.getMessage('APPROVAL_WRITE_ACCOUNT'));
				$j("inputAccountingAccount").focus();
				return;
			}

			if($j("#textExpenseDate").val() === ""){
				alert(ApprovalLang.getMessage('APPROVAL_WRITE_SPENDING_DATE'));
				$j("#textExpenseDate").focus();
				return;
			}
			_this._spendingReport.currentDeal.expense_date = $j("#textExpenseDate").val();

			if(!_this._spendingReport.currentDeal.department_name || !_this._spendingReport.currentDeal.department_code){
				alert(ApprovalLang.getMessage('APPROVAL_WRITE_SPEDNING_NODE'));
				$j("#inputAccountingDepartment").focus();
				return;
			}

			var price_pattern = /^[1-9][0-9]{0,20}$/
			var price = $j.trim($j("#inputPrice").val()).replace(/(,)/g, "");
			if(!price_pattern.test(price) || parseInt(price) === 0){
				alert(ApprovalLang.getMessage('APPROVAL_ONLY_NUMBER_IN_SUPPLY'));
				$j("#inputPrice").focus();
				return;
			}
			_this._spendingReport.currentDeal.supply_price = parseInt(price);
			
			var tax_amount = $j.trim($j("#inputTaxAmount").val()).replace(/(,)/g, "");
			_this._spendingReport.currentDeal.tax_amount = parseInt(tax_amount);
			
			var customer_name = $j.trim($j("#inputDealCustomer").val());
			if(customer_name === ""){
				alert(ApprovalLang.getMessage('APPROVAL_WRITE_CUSTOMER'));
				$j("#inputDealCustomer").focus();
				return;
			}
			_this._spendingReport.currentDeal.customer_name = customer_name;
			
			var company_num = $j.trim($j('#inputCompanyNum').val());
			var company_num_pattern = /^[0-9\-\s]{1,20}$/
			if(company_num !== '' && !company_num_pattern.test(company_num)){
				alert(ApprovalLang.getMessage('APPROVAL_AVAILABLE_COMPANY_NUMBER'));
				$j("#inputCompanyNum").focus();
				return;
			}
			_this._spendingReport.currentDeal.company_num = company_num;

			var brief = $j.trim($j("#inputBrief").val());
			if(brief === ""){
				alert(ApprovalLang.getMessage('APPROVAL_WRITE_BRIEFS'));
				$j("#inputBrief").focus();
				return;
			}
			_this._spendingReport.currentDeal.brief = brief;
		}

		var row = "<tr>";
		row += "<td>" + _this._spendingReport.currentDeal.account_name + "</td>";
		row += "<td>" + _this._spendingReport.currentDeal.expense_date + "</td>";
		row += "<td>";
		row += "<span class='fl'>" + _this._spendingReport.currentDeal.department_name + "</span>";
		row += '<a href="javascript:void(0);" class="icon question tipsIcon" style="position: relative;top:0;margin-left:10px"><span class="blind">세부 설명</span></a>';
		row += '<span class="tooltip hide" style="left:0;top:0;color:#676767;">';
			row += '<div class="tooltip-box" style="width:230px;">';
				row += '<p>' + ApprovalLang.getMessage('APPROVAL_CODE_WORD') + ' : ' +  (_this._spendingReport.currentDeal.department_code !== "" ? _this._spendingReport.currentDeal.department_code : "-") + '&nbsp';
				row += ApprovalLang.getMessage('APPROVAL_SPEND_DEPARTMENT_NO_SPACE') + " : " + _this._spendingReport.currentDeal.department_name + '</p></div></span></td>';
				
		if(_this._spendingReport.type === 'P'){
			if($j.inArray(_this._spendingReport.currentDeal.proof, ['tax_bill', 'cash_receipt']) > -1){
				row += "<td>" + (_this._spendingReport.currentDeal.supply_price + _this._spendingReport.currentDeal.tax_amount).toString().numberFormat() + "</td>";
			}else{
				row += "<td>" + _this._spendingReport.currentDeal.supply_price.toString().numberFormat() + "</td>";
			}
		}else{
			row += "<td>" + (_this._spendingReport.currentDeal.supply_price + _this._spendingReport.currentDeal.tax_amount).toString().numberFormat() + "</td>";
		}
		row += "<td><span class='fl'>" + _this._spendingReport.currentDeal.customer_name + "</span>";
		row += '<a href="javascript:void(0);" class="icon question tipsIcon" style="position: relative;top:0;margin-left:10px"><span class="blind">세부 설명</span></a>';
		row += '<span class="tooltip hide" style="left:0;top:0;color:#676767;">';
			row += '<div class="tooltip-box" style="width:230px;">';
				row += '<p>' + ApprovalLang.getMessage('APPROVAL_CODE_WORD') + ' : ' +  (_this._spendingReport.currentDeal.customer_code ? _this._spendingReport.currentDeal.customer_code : "-") + '&nbsp';
				row += ApprovalLang.getMessage('APPROVAL_CUSTOMER_NAME') + " : " + _this._spendingReport.currentDeal.customer_name + '</p></div></span></td>';
				
		row += "<td>" + _this._spendingReport.currentDeal.brief + "</td>";
		row += '<td><button type="button" name="button" class="weakblue" onclick="ApprovalDocument.getDealInformationLayer(this);">수정</button><span class="weakgray"> | </span><button type="button" name="button" class="weakblue" onclick="ApprovalDocument.deleteDealInformation(this);">삭제</button></td>';
		row += "</tr>";

		if(pType === "MODIFY"){
			$j("#tableAccoutingDealInformation tbody").children().eq(_this._spendingReport.modifyIndex).replaceWith(row);
			_this._spendingReport.deal.splice(_this._spendingReport.modifyIndex, 1, _this._spendingReport.currentDeal);
		}else{
			$j("#tableAccoutingDealInformation").append(row);
			_this._spendingReport.deal.push(_this._spendingReport.currentDeal);
			_this._spendingReport.currentDeal = $j.extend({}, _this._spendingReport.currentDeal);
		}
		_this.sumDealInformation();

		$j('#layerDealInformation').hidePopup();
		if(pType === "REPEAT"){
			ApprovalDocument.Ajax({
				"pMenu" : "get_deal_information_layer",
				"pMode" : 'save',
				"pType" : _this._spendingReport.type,
				"pCallback" : "ApprovalDocument.showDealInformationLayer"
			}, false);
		}else{
			_this._spendingReport.currentDeal = {};
		}
	}

	,deleteDealInformation: function(pObj)
	{
		if($j(pObj).length > 0){
			var deleteIndex = -1;
			$j.each($j("#tableAccoutingDealInformation tbody").children(), function(idx, ele){
				if($j(pObj).parent().parent()[0] === $j(ele)[0]){
					deleteIndex = idx;
					$j(ele).remove();
					return false;
				}
			});
			if(deleteIndex > -1){
				ApprovalDocument._spendingReport.deal.splice(deleteIndex, 1);
			}
		}
	}

	,sumDealInformation: function(pObj)
	{
		$j('#tableAccoutingDealInformation #sumRow').remove();

		if(_this._spendingReport.deal.length > 0){
			var row = "<tr id=\"sumRow\">";
			row += "<td></td>";
			row += "<td></td>";
			row += "<td></td>";
			
			var sum_of_price = 0;
			$j.each(_this._spendingReport.deal, function(index, value){
				if(_this._spendingReport.type === 'P'){
					if(_this._spendingReport.deal[index].supply_price){
						sum_of_price += parseInt(_this._spendingReport.deal[index].supply_price);
					}
					if(_this._spendingReport.deal[index].tax_amount){
						sum_of_price += parseInt(_this._spendingReport.deal[index].tax_amount);
					}
				}else{
					if(_this._spendingReport.deal[index].supply_price){
						sum_of_price += parseInt(_this._spendingReport.deal[index].supply_price);
					}
					if(_this._spendingReport.deal[index].tax_amount){
						sum_of_price += parseInt(_this._spendingReport.deal[index].tax_amount);
					}
				}
			});
			row += "<td class=\"account-total\" style=\"text-align: left;\">총 " + sum_of_price.toString().numberFormat() + "</td>";
			row += "<td></td>";
			row += "<td></td>";
			row += "<td></td>";
			row += "</tr>";

			$j("#tableAccoutingDealInformation").append(row);
		}
	}

	,getRemittanceRequestLayer: function(pObj)
	{
		var mode = 'save';
		_this._remittance.currentRequest = {};
		if($j(pObj).length > 0){
			mode = "modify";

			var searchIndex = -1;
			$j.each($j("#tableRemittanceRequest tbody").children(), function(idx, ele){
				if($j(pObj).parent().parent()[0] === $j(ele)[0]){
					searchIndex = idx;
					return false;
				}
			});
			if(searchIndex > -1){
				_this._remittance.modifyIndex = searchIndex;
				_this._remittance.currentRequest = _this._remittance.request[searchIndex];
			}
		}

		ApprovalDocument.Ajax({
			"pMenu" : "get_remittance_request_layer",
			"pMode" : mode,
			"pCallback" : "ApprovalDocument.showRemittanceRequestLayer"
		}, false);
	}
	
	,showRemittanceRequestLayer: function(pValue)
	{
		$j("#wrap").append(pValue.result);

		if(Object.keys(_this._remittance.currentRequest).length > 0){
			var customer_name = _this._remittance.currentRequest.customer_name;
			var customer_code = _this._remittance.currentRequest.customer_code;
			var bank_name = _this._remittance.currentRequest.bank_name;
			var account_num = _this._remittance.currentRequest.account_num;
			var account_holder = _this._remittance.currentRequest.account_holder;
			$j("input[name='regular_type'][value='"+_this._remittance.currentRequest.regular_type+"']").prop("checked", true);
			_this.changeRegularType();

			if(_this._remittance.currentRequest.regular_type === "Y"){
				$j("#inputRemittanceCustomer").hide();
				$j("#btnRemittanceCustomerSearchLayer").hide();
				$j("#textRemittanceCustomer").html(customer_name);
				$j("#textRemittanceCustomer").show();
				$j("#btnRemittanceCustomer").show();
				$j("#inputBankName").val(bank_name);
				$j("#inputAccountNum").val(account_num);
				$j("#inputAccountHolder").val(account_holder);
				$j("#inputPrice").val(_this._remittance.currentRequest.price);
				if($j("#selectRequestDate").length > 0){
					$j("#selectRequestDate").val(_this._remittance.currentRequest.request_date);
				}else{
					$j("#inputRequestDate").val(_this._remittance.currentRequest.request_date);
				}

				_this._remittance.currentRequest.customer_name = customer_name;
				_this._remittance.currentRequest.customer_code = customer_code
				_this._remittance.currentRequest.bank_name = bank_name;
				_this._remittance.currentRequest.account_num = account_num;
				_this._remittance.currentRequest.account_holder = account_holder;
			}else{
				$j("#inputCustomer").val(customer_name);
				var bank_name_index = -1;
				$j("#selectBankName").children().each(function(index){
					if($j(this).val() === bank_name && $j(this).val() !== "SELF"){
						bank_name_index = index;
						$j(this).prop("selected", true);
						return;
					}
				});
				if(bank_name_index === -1){
					$j("#selectBankName").val("SELF");
					$j("#inputBankName").val(bank_name);
					$j("#inputBankName").prop("disabled", false);
					$j("#inputBankName").show();
				}
				$j("#inputAccountNum").val(account_num);
				$j("#inputAccountHolder").val(account_holder);
				$j("#inputPrice").val(_this._remittance.currentRequest.price);
				$j("#inputRequestDate").val(_this._remittance.currentRequest.request_date);
			}
		}

		$j("#layerRemittanceRequest").showPopup();
	}

	,changeRegularType: function()
	{
		if($j("input[name='regular_type']:checked").val() === "Y"){
			$j("#inputCustomer").hide();
			$j("#inputRemittanceCustomer").show();
			$j("#btnRemittanceCustomerSearchLayer").show();
			$j("#textRemittanceCustomer").hide();
			$j("#btnRemittanceCustomer").hide();
			$j("#selectBankName").hide();
			$j("#inputBankName").val('');
			$j("#inputBankName").prop("disabled", true);
			$j("#inputBankName").show();
			$j("#inputAccountNum").val('');
			$j("#inputAccountNum").prop("disabled", true);
			$j("#inputAccountHolder").val('');
			$j("#inputAccountHolder").prop("disabled", true);
			if($j("#selectRequestDate").length > 0){
				$j("#inputRequestDate").hide();
				$j("#selectRequestDate").val('');
				$j("#selectRequestDate").show();
			}

			_this._remittance.currentRequest.customer_name = '';
			_this._remittance.currentRequest.customer_code = '';
			_this._remittance.currentRequest.bank_name = '';
			_this._remittance.currentRequest.account_num = '';
			_this._remittance.currentRequest.account_holder = '';
		}else{
			alert(ApprovalLang.getMessage('APPROVAL_REGIST_BEFORE_CHECK_ACCOUNTING_DEPARTMENT'));

			$j("#inputRemittanceCustomer").hide();
			$j("#btnRemittanceCustomerSearchLayer").hide();
			$j("#textRemittanceCustomer").hide();
			$j("#btnRemittanceCustomer").hide();
			$j("#inputCustomer").val('');
			$j("#inputCustomer").show();
			$j("#inputBankName").hide();
			$j("#selectBankName").val('');
			$j("#selectBankName").show();
			$j("#inputAccountNum").val('');
			$j("#inputAccountNum").prop("disabled", false);
			$j("#inputAccountHolder").val('');
			$j("#inputAccountHolder").prop("disabled", false);
			if($j("#selectRequestDate").length > 0){
				$j("#selectRequestDate").hide();
			}
			$j("#inputRequestDate").val('');
			$j("#inputRequestDate").show();
		}
	} 

	,setRemittanceCustomer: function(pName, pCode, pBankName, pAccountNum, pAccountHolder, pChange)
	{
		if(pChange === true)
		{
			$j("#textRemittanceCustomer").html('');
			$j("#textRemittanceCustomer").hide();
			$j("#btnRemittanceCustomer").hide();
			$j("#inputRemittanceCustomer").show();
			$j("#btnRemittanceCustomerSearchLayer").show();
			$j("#inputRemittanceCustomer").focus();
			$j("#inputBankName").val('');
			$j("#inputAccountNum").val('');
			$j("#inputAccountHolder").val('');

			_this._remittance.currentRequest.customer_name = '';
			_this._remittance.currentRequest.customer_code = '';
			_this._remittance.currentRequest.bank_name = '';
			_this._remittance.currentRequest.account_num = '';
			_this._remittance.currentRequest.account_holder = '';

			return;
		}

		if(pBankName === "" || pAccountNum === "" || pAccountHolder === ""){
			alert(ApprovalLang.getMessage('APPROVAL_NOT_EXIST_REMITTANCE_REQUEST_MANGER'));
			return;
		}

		$j("#inputRemittanceCustomer").hide();
		$j("#btnRemittanceCustomerSearchLayer").hide();
		$j("#textRemittanceCustomer").html(pName);
		$j("#textRemittanceCustomer").show();
		$j("#btnRemittanceCustomer").show();
		$j("#inputBankName").val(pBankName);
		$j("#inputAccountNum").val(pAccountNum);
		$j("#inputAccountHolder").val(pAccountHolder);

		_this._remittance.currentRequest.customer_name = pName;
		_this._remittance.currentRequest.customer_code = pCode;
		_this._remittance.currentRequest.bank_name = pBankName;
		_this._remittance.currentRequest.account_num = pAccountNum;
		_this._remittance.currentRequest.account_holder = pAccountHolder;
	}

	,changeBankName: function()
	{
		if($j("#selectBankName").val() === "SELF"){
			$j("#inputBankName").val('');
			$j("#inputBankName").prop("disabled", false);
			$j("#inputBankName").show();

			return;
		}

		$j("#inputBankName").hide();
	}

	,saveRemittanceRequest: function(pType)
	{
		if($j("input[name='regular_type']:checked").val() === "Y"){
			if(_this._remittance.currentRequest.customer_name === undefined || _this._remittance.currentRequest.customer_name === "" || _this._remittance.currentRequest.customer_code === ""){
				alert(ApprovalLang.getMessage('APPROVAL_WRITE_CUSTOMER'));
				$j("#inputRemittanceCustomer").focus();
				return;
			}

			var price_pattern = /^[0-9]{1,20}$/
			var price = $j.trim($j("#inputPrice").val()).replace(/(,)/g, "");
			if(!price_pattern.test(price)){
				alert(ApprovalLang.getMessage('APPROVAL_ONLY_NUMBER_IN_REMITTANCE_AMOUNT'));
				$j("#inputPrice").focus();
				return;
			}
			_this._remittance.currentRequest.price = price;
			
			if($j("#selectRequestDate").length > 0){
				var request_date = $j("#selectRequestDate").val();
				if(request_date === ""){
					alert(ApprovalLang.getMessage('APPROVAL_SELECT_REMITTANCE_DATE'));
					$j("#selectRequestDate").focus();
					return;
				}
			}else{
				var request_date = $j("#inputRequestDate").val();
				if(request_date === ""){
					alert(ApprovalLang.getMessage('APPROVAL_SELECT_REMITTANCE_DATE'));
					$j("#inputRequestDate").focus();
					return;
				}
			}
			_this._remittance.currentRequest.request_date = request_date;

		}else{
			var customer_name = $j.trim($j("#inputCustomer").val());
			if(customer_name === ""){
				alert("거래처를 입력해주세요.");
				$j("#inputCustomer").focus();
				return;
			}
			_this._remittance.currentRequest.customer_name = customer_name;

			var bank_name = $j("#selectBankName").val();
			if(bank_name === ""){
				alert(ApprovalLang.getMessage('APPROVAL_SELECT_BANK'));
				$j("#selectBankName").focus();
				return;
			}else if(bank_name === "SELF"){
				bank_name = $j.trim($j("#inputBankName").val());
				if(bank_name === ""){
					alert(ApprovalLang.getMessage('APPROVAL_WRITE_BANK'));
					$j("#inputBankName").focus();
					return;
				}
			}
			_this._remittance.currentRequest.bank_name = bank_name;

			var account_num = $j.trim($j("#inputAccountNum").val());
			var account_num_pattern = /^[0-9\-]{1,20}$/;
			if(!account_num_pattern.test(account_num)){
				alert(ApprovalLang.getMessage('APPROVAL_AVAILABLE_CARD_NUMBER'));
				$j("#inputAccountNum").focus();
				return;
			}
			_this._remittance.currentRequest.account_num = account_num;

			var account_holder = $j.trim($j("#inputAccountHolder").val());
			if(account_holder === ""){
				alert(ApprovalLang.getMessage('APPROVAL_WRITE_ACCOUNT_HOLDER'));
				$j("#inputAccountHolder").focus();
				return;
			}
			_this._remittance.currentRequest.account_holder = account_holder;

			var price_pattern = /^[0-9]{1,20}$/
			var price = $j.trim($j("#inputPrice").val()).replace(/(,)/g, "");
			if(!price_pattern.test(price)){
				alert(ApprovalLang.getMessage('APPROVAL_ONLY_NUMBER_IN_REMITTANCE_AMOUNT'));
				$j("#inputPrice").focus();
				return;
			}
			_this._remittance.currentRequest.price = price;

			var request_date = $j.trim($j("#inputRequestDate").val());
			if(request_date === ""){
				alert(ApprovalLang.getMessage('APPROVAL_WRITE_REMITTANCE_DATE'));
				$j("#inputRequestDate").focus();
				return;
			}
			_this._remittance.currentRequest.request_date = request_date;

		}
		_this._remittance.currentRequest.regular_type = $j("input[name='regular_type']:checked").val();

		var row = "<tr>";
		if($j("input[name='regular_type']:checked").val() === "Y"){
			row += "<td>" + _this._remittance.currentRequest.customer_name + "</td>";
		}else{
			row += "<td><span class=\"red_color\">*</span> " + _this._remittance.currentRequest.customer_name + "</td>";
		}
		row += "<td>" + _this._remittance.currentRequest.bank_name + "</td>";
		row += "<td>" + _this._remittance.currentRequest.account_num + "</td>";
		row += "<td>" + _this._remittance.currentRequest.account_holder + "</td>";
		row += "<td class=\"ta_r\">" + _this._remittance.currentRequest.price.toString().numberFormat() + "원</td>";
		row += "<td>" + _this._remittance.currentRequest.request_date + "</td>";
		row += "<td><button type=\"button\" class=\"weakblue\" onclick=\"ApprovalDocument.getRemittanceRequestLayer(this);\">수정</button><span class=\"weakgray\"> | </span><button type=\"button\" class=\"weakblue\" onclick=\"ApprovalDocument.deleteRemittanceRequest(this);\">삭제</button></td>";
		row += "</tr>";

		if(pType === "MODIFY"){
			$j("#tableRemittanceRequest tbody").children().eq(_this._remittance.modifyIndex).replaceWith(row);
			_this._remittance.request.splice(_this._remittance.modifyIndex, 1, _this._remittance.currentRequest);
		}else{
			$j("#tableRemittanceRequest").append(row);
			_this._remittance.request.push(_this._remittance.currentRequest);
			_this._remittance.currentRequest = $j.extend({}, _this._remittance.currentRequest);
		}

		$j('#layerRemittanceRequest').hidePopup();
		if(pType === "REPEAT"){
			ApprovalDocument.Ajax({
				"pMenu" : "get_remittance_request_layer",
				"pMode" : 'save',
				"pCallback" : "ApprovalDocument.showRemittanceRequestLayer"
			}, false);
		}else{
			_this._remittance.currentRequest = {};
		}
		_this.irregularDisplayCheck();
	}

	,deleteRemittanceRequest: function(pObj)
	{
		if($j(pObj).length > 0){
			var deleteIndex = -1;
			$j.each($j("#tableRemittanceRequest tbody").children(), function(idx, ele){
				if($j(pObj).parent().parent()[0] === $j(ele)[0]){
					deleteIndex = idx;
					$j(ele).remove();
					return false;
				}
			});
			if(deleteIndex > -1){
				ApprovalDocument._remittance.request.splice(deleteIndex, 1);
			}
		}
		_this.irregularDisplayCheck();
	}

	,irregularDisplayCheck: function()
	{
		var irregular_type = false;
		$j.each(_this._remittance.request, function(index, value){
			if(_this._remittance.request[index]["regular_type"] === "N"){
				irregular_type = true;
				return;
			}
		});

		if(irregular_type){
			$j("#irregular_display").show();
		}else{
			$j("#irregular_display").hide();
		}
	}

	,previewDocument: function()
	{
		if($j('#previewForm').length){
			$j('#previewForm').remove();
		}
		
		var $form = $j('<form>', {
			'id' : 'previewForm',
			'action' : Common.getRoot() + 'approval/addons/preview',
			'method' : 'post',
			'target' : 'preview'
		});
		var $document_no = $j('<input>', {
			'name' : 'document_no',
			'value' : _this._documentNo,
			'type' : 'hidden'
		});
		var $form_type = $j('<input>', {
			'name' : 'form_type',
			'value' : _this._formType,
			'type' : 'hidden'
		});
		var $form_no = $j('<input>', {
			'name' : 'form_no',
			'value' : $j("select[name='approval_form_no']").length ? $j("select[name='approval_form_no']").val() : '',
			'type' : 'hidden'
		});
		var $approval_method = $j('<input>', {
			'name' : 'approval_method',
			'value' : _this._approvalMethod,
			'type' : 'hidden'
		});
		var $node_id = $j('<input>', {
			'name' : 'node_id',
			'value' : $j("input[name='node_id']").length ? $j("input[name='node_id']").val() : $j("select[name='node_id']").val(),
			'type' : 'hidden'
		});
		var $preserved_term = $j('<input>', {
			'name' : 'preserved_term',
			'value' : $j("select[name='preserved_term']").val(),
			'type' : 'hidden'
		});
		var $security_level = $j('<input>', {
			'name' : 'security_level',
			'value' : $j("select[name='security_level']").val(),
			'type' : 'hidden'
		});
		var $first_line = $j('<input>', {
			'name' : 'first_line',
			'value' : $j("input[name='approval_first_line']").val(),
			'type' : 'hidden'
		});
		var $second_line = $j('<input>', {
			'name' : 'second_line',
			'value' : $j("input[name='approval_second_line']").val(),
			'type' : 'hidden'
		});
		var $third_line = $j('<input>', {
			'name' : 'third_line',
			'value' : $j("input[name='approval_third_line']").val(),
			'type' : 'hidden'
		});
		var $fourth_line = $j('<input>', {
			'name' : 'fourth_line',
			'value' : $j("input[name='approval_fourth_line']").val(),
			'type' : 'hidden'
		});
		var $title = $j('<input>', {
			'name' : 'title',
			'value' : $j("input[name='approval_document_title']").val(),
			'type' : 'hidden'
		});
		var approval_content = "";
		if(_this._formType === "circulation"){
			approval_content = $j("#approvalCirculationContent").html();
		}else if(_this._formType === "spending_report"){
			approval_content = "";
		}else if(_this._formType === "gabia_iframe"){
			approval_content = "";
		}else if(_this._formType === "openapi"){
			approval_content = $j('.contents').html();
		}else if(_this._formType === "db_form"){
			approval_content = "";
		}else{
			approval_content = DEXT5.getBodyValue('editor2');
		}
		var $content = $j('<input>', {
			'name' : 'content',
			'value' : approval_content,
			'type' : 'hidden'
		});
		var attached_file = [];
		var related_document = [];
		$j(".js-approval-attach").each(function(index, value){
			if($j(value).attr("file")){
				attached_file.push($j(value).attr("file"));
			}
		});
		$j(".js-approval-related").each(function(index, value){
			if($j(value).attr("document_no")){
				related_document.push($j(value).attr("document_no"));
			}
		});
		var $attached_file = $j('<input>', {
			'name' : 'attached_file',
			'value' : attached_file,
			'type' : 'hidden'
		});
		var $related_document = $j('<input>', {
			'name' : 'related_document',
			'value' : related_document,
			'type' : 'hidden'
		});		
		$form.append($document_no).append($form_type).append($form_no).append($approval_method).append($node_id).append($preserved_term).append($security_level).append($first_line).append($second_line).append($third_line).append($fourth_line).append($title).append($content).append($attached_file).append($related_document);

		if(_this._formType === "spending_report"){
			_this._spendingReport.spender.card = $j("#corporationCard").val();
			var $spending_report = $j('<input>', {
				'name' : 'spending_report',
				'value' : JSON.stringify(_this._spendingReport),
				'type' : 'hidden'
			});
			$form.append($spending_report);
		}else if(_this._formType === "remittance"){
			var $remittance = $j('<input>', {
				'name' : 'remittance',
				'value' : JSON.stringify(_this._remittance),
				'type' : 'hidden'
			});
			$form.append($remittance);
		}else if(_this._formType === "db_form"){
			var components_values = dbUnitWrite.getDBUnitComponentsValues();
			if(components_values === false){
				return;
			}

			var o = new Object();
			o[(dbUnitWrite._unitNo)] = components_values;
			console.log(o);
			var $db_unit_components_value = $j('<input>', {
				'name' : 'db_unit_components_value',
				'value' : JSON.stringify(o),
				'type' : 'hidden'
			});
			
			$form.append($db_unit_components_value);
		}

		$j('body').append($form);
		
		var screenHeight = screen.height;
		var screenWidth = '1200';
		Approval._previewWindow = window.open('', "preview", 'height=' + screenHeight + ',width=' + screenWidth + ",resizable=yes,menubar=yes,scrollbars=yes,status=yes,fullscreen=no");
		$form.submit();
		$j('#previewForm').remove();
	}
	
	,setSpendingSettings : function(pSettings){
		var spending_regist = pSettings.spending_regist;
		var spending_date = pSettings.spending_date;
		var fixed_days = pSettings.fixed_days;
		
		if(spending_regist === 'M'){
			$j('#spending_regist_md').show();
			$j('#selectFixedDays').hide();
			$j('#spending_regist_c').hide();
		}else if(spending_regist === 'D'){
			$j('#spending_regist_md').show();
			$j('#selectFixedDays').show();
			$j('#spending_regist_c').hide();
			
			ApprovalDocument._spendingReport.fixedDays = fixed_days;
			ApprovalDocument._spendingReport.spendingDate = spending_date;
			$j('#selectFixedDays').children('option').each(function(k, v){
				if($j(v).val() === '0'){
					return true;
				}
				
				v.remove();
			});
			
			var lastDays = new Date($j('#selectFixedYear').val(), $j('#selectFixedMonth').val(), 0).getDate();
			$j.each(spending_date, function(k, v){
				var title = (v === 'LAST') ? ApprovalLang.getMessage('APPROVAL_LAST_DAY') : (v + ApprovalLang.getMessage('APPROVAL_DAY')); 
				$j('#selectFixedDays').append('<option value="' + v + '"' + (v == ApprovalDocument._spendingReport.fixedDays || (v === 'LAST' && ApprovalDocument._spendingReport.fixedDays == lastDays) ? ' selected' : '') +'>' + title + '</option>');
			});
			
			if($j('#selectFixedDays').val() === '0'){
				ApprovalDocument._spendingReport.fixedDays = 0;
			}
			
		}else if(spending_regist === 'C'){
			$j('#spending_regist_md').hide();
			$j('#spending_regist_c').show();
			$j('#spendingDateCustom').val(pSettings.fixed_date);
		}
		
		if(spending_regist === 'M'){
			$j('#th_spending_regist_month').show();
			$j('#th_spending_regist_days').hide();
		}else{
			$j('#th_spending_regist_month').hide();
			$j('#th_spending_regist_days').show();
		}
		
		ApprovalDocument._spendingReport.spendingRegist = spending_regist;
		ApprovalDocument.setAutoTitleInSpendingReport();
	}
	
	,hideAttachedFileArea : function()
	{
		$j('.viewAttachedFileArea').hide();
	}
	
	,initAttachedFileArea : function()
	{
		$j('.viewAttachedFileArea').show();
		$j('#tableApprovalRelated tbody').empty();
		$j('#tableApprovalAttach tbody').empty();
		$j('#approvalAttachSize').hide();
		$j('#approvalAttachList').hide();
	}
	
	,getView : function(pDocumentNo, mode, target)
	{
		var condition = '';
		if(Common.getIEVersion() !== false && Common.getIEVersion() < 10){
			var hash = window.location.hash;
			condition = hash.substring(hash.lastIndexOf('/?') + 2);
		}else{
			condition = window.location.search.substring(1);
		}
		
		if(mode !== '' && mode !== undefined){
			if($j.inArray(mode, ['all', 'writer', 'approval', 'refer', 'read', 'return']) !== -1){
				condition += '&box_mode=' + mode;
			}else{
				condition += '&list_mode=' + mode;
			}
		}
		
		if(condition !== ''){
			condition = '/condition/' + btoa(condition);
		}
		
		var link_url = Common.getRoot() + 'approval/document/view/' + pDocumentNo + condition;
		if(target !== '' && target !== undefined){
			window.open(link_url);
		}else{
			window.location.href = link_url;
		}
	}
	
	,getAccountSearchLayer : function()
	{
		var param = {
				'pMenu' : 'get_approval_account_search_layer',
				'pCallback' : 'ApprovalDocument.resultGetAccountSearchLayer'
		};
		ApprovalDocument.Ajax(param);
	}
	
	,resultGetAccountSearchLayer : function(pValue)
	{
		$j('#wrap').append(pValue.result);
		$j('#layerAccountingAccountSearch').showPopup();
	}
	
	,getAccountingAccountSearch : function()
	{
		var param = {
				'pMenu' : 'get_approval_account_search',
				'pSearch' : $j('#textAccountingAccountSearch').val(),
				'pCallback' : 'ApprovalDocument.resultGetAccountingAccountSearch'
		};
		ApprovalDocument.Ajax(param);
	}
	
	,resultGetAccountingAccountSearch : function(pValue)
	{
		accountSearchTable.insertRow(pValue);
	}
	
	,selectAccountingAccountSearch : function(pCode, pName)
	{
		_this._spendingReport.currentDeal.account_name = pName;
		_this._spendingReport.currentDeal.account_code = pCode;
		
		$j("#textAccountingAccount").html(pName);
		$j("#inputAccountingAccount").hide();
		$j("#textAccountingAccount").show();
		$j("#btnAccountingAccount").show();
		$j("#btnAccountingAccountSearchLayer").hide();
		$j('#layerAccountingAccountSearch').remove();
	}
	
	,getDepartmentSearchLayer : function()
	{
		var param = {
				'pMenu' : 'get_approval_department_search_layer',
				'pCallback' : 'ApprovalDocument.resultGetDepartmentSearchLayer'
		};
		ApprovalDocument.Ajax(param);
	}
	
	,resultGetDepartmentSearchLayer : function(pValue)
	{
		$j('#wrap').append(pValue.result);
		$j('#layerAccountingDepartmentSearch').showPopup();
	}
	
	,getAccountingDepartmentSearch : function()
	{
		var param = {
				'pMenu' : 'get_approval_department_search',
				'pSearch' : $j('#textAccountingDepartmentSearch').val(),
				'pCallback' : 'ApprovalDocument.resultGetAccountingDepartmentSearch'
		};
		ApprovalDocument.Ajax(param);
	}
	
	,resultGetAccountingDepartmentSearch : function(pValue)
	{
		departmentSearchTable.insertRow(pValue);
	}
	
	,selectAccountingDepartmentSearch : function(pCode, pName)
	{
		_this._spendingReport.currentDeal.department_name = pName;
		_this._spendingReport.currentDeal.department_code = pCode;
		
		$j("#textAccountingDepartment").html(pName);
		$j("#inputAccountingDepartment").hide();
		$j("#textAccountingDepartment").show();
		$j("#btnAccountingDepartment").show();
		$j("#btnAccountingDepartmentSearchLayer").hide();
		$j('#layerAccountingDepartmentSearch').remove();
	}
	
	,getCustomerSearchLayer : function(pType)
	{
		if(pType === undefined || pType === '' || $j.inArray(pType, ['deal', 'remittance']) === -1){
			pType = 'deal';
		}
		
		var param = {
				'pMenu' : 'get_approval_customer_search_layer',
				'pType' : pType,
				'pCallback' : 'ApprovalDocument.resultGetCustomerSearchLayer'
		};
		ApprovalDocument.Ajax(param);
	}
	
	,resultGetCustomerSearchLayer : function(pValue)
	{
		$j('#wrap').append(pValue.result);
		$j('#layerAccountingCustomerSearch').showPopup();
	}
	
	,getAccountingCustomerSearch : function(pType)
	{
		if(pType === undefined || pType === '' || $j.inArray(pType, ['deal', 'remittance']) === -1){
			pType = 'deal';
		}
		
		var param = {
				'pMenu' : 'get_approval_customer_search',
				'pSearch' : $j('#textAccountingCustomerSearch').val(),
				'pType' : pType,
				'pCallback' : 'ApprovalDocument.resultGetAccountingCustomerSearch'
		};
		ApprovalDocument.Ajax(param);
	}
	
	,resultGetAccountingCustomerSearch : function(pValue)
	{
		customerSearchTable.insertRow(pValue);
	}
	
	,selectAccountingCustomerSearch : function(pCode, pName, pCompanyNum)
	{
		_this._spendingReport.currentDeal.customer_name = pName;
		_this._spendingReport.currentDeal.customer_code = pCode;
		_this._spendingReport.currentDeal.company_num = pCompanyNum;
		
		$j("#inputAccountingCustomer").hide();
		$j("#textAccountingCustomer").html(pName);
		$j("#textAccountingCustomer").show();
		$j("#btnAccountingCustomer").show();
		$j("#inputCompanyNum").val(pCompanyNum);
		$j("#btnAccountingCustomerSearchLayer").hide();
		$j('#layerAccountingCustomerSearch').remove();
	}
	
	,selectRemittanceCustomerSearch : function(pCode, pName, pBankName, pAccountNum, pAccountHolder)
	{
		if(pBankName === "" || pAccountNum === "" || pAccountHolder === ""){
			alert(ApprovalLang.getMessage('APPROVAL_NOT_EXIST_REMITTANCE_REQUEST_MANGER'));
			return;
		}

		_this._remittance.currentRequest.customer_name = pName;
		_this._remittance.currentRequest.customer_code = pCode;
		_this._remittance.currentRequest.bank_name = pBankName;
		_this._remittance.currentRequest.account_num = pAccountNum;
		_this._remittance.currentRequest.account_holder = pAccountHolder;
		
		$j("#inputRemittanceCustomer").hide();
		$j("#textRemittanceCustomer").html(pName);
		$j("#textRemittanceCustomer").show();
		$j("#btnRemittanceCustomer").show();
		$j("#inputBankName").val(pBankName);
		$j("#inputAccountNum").val(pAccountNum);
		$j("#inputAccountHolder").val(pAccountHolder);
		$j("#btnRemittanceCustomerSearchLayer").hide();
		$j('#layerAccountingCustomerSearch').remove();
	}
	
	,clearDeletedContentImage : function()
	{
		if(CKEDITOR.instances.editorContent && $j('.js-approval-attach:hidden').length){
			var content_data = CKEDITOR.instances.editorContent.getSnapshot();
			var set_file_sum = false;
			$j('.js-approval-attach:hidden').each(function(index, value){
				if(content_data.indexOf('/approval/image/view/' + $j(value).attr('file') + '"') < 0){
					$j(value).attr('deleted', 'Y');
					set_file_sum = true;
				}else{
					if($j(value).attr('deleted')){
						$j(value).removeAttr('deleted');
						set_file_sum = true;
					}
				}
			});
			if(set_file_sum){
				set_attached_file_sum();
			}
		}
	}
	
	,batchManage: function(pMode, pValue)
	{
		var document_no = [];
		$j('.js-checkbox-document-box-list:checked').each(function(k, v){
			document_no.push($j(this).val());
		});
		
		if(document.length === 0){
			alert(ApprovalLang.getMessage('APPROVAL_SELECT_DOCUMENT'));
			return;
		}

		var params = {
				'pCallback':'ApprovalDocument.resultBatchManage'
		};

		if(pMode === 'add_user_layer'){
			params.pMenu = 'get_add_approval_user_layer';
			params.pApprovalType = pValue;
			
		}else if(pMode === 'add_user_action'){
			var add_approval_user = [];
			$j("#layerAddApprovalUser .js-add-approval-user").each(function(index, value){
				add_approval_user.push($j(value).attr("user_no") + "|" + $j(value).attr("node"));
			});

			if(add_approval_user.length === 0){
				if(pValue === "F"){
					alert(ApprovalLang.getMessage('APPROVAL_WRITE_APPROVER_F'));
				}else if(pValue === "I"){
					alert(ApprovalLang.getMessage('APPROVAL_WRITE_APPROVER_I'));
				}
				return;
			}
			
			params.pMenu = 'box_batch_action';
			params.pType = 'add_user';
			params.pValue = add_approval_user;
			params.pApprovalType = pValue;
			params.pDocumentList = document_no;
			console.log(params);
		}else{
			return;
		}
		
		ApprovalDocument.Ajax(params);
	}
	
	,resultBatchManage : function(pValue)
	{
		if(pValue.mode === 'add_user_layer'){
			if($j('#layerAddApprovalUser').length){
				$j('#layerAddApprovalUser').remove();
			}
			$j("#wrap").append(pValue.result);
			$j("#layerAddApprovalUser").showPopup();
			$j("#inputAddApprovalUser").focus();
		}else if(pValue.mode === 'add_user'){
			alert(pValue.message);
			$j('#layerAddApprovalUser').hidePopup();
		}
	}
	
	,addBatchApprovalLineUser: function(pNo, pNode, pName)
	{
		var duplicate_chk = false;
		$j('.js-add-approval-user').each(function(index, value){
			if(pNo === $j(value).attr("user_no")){
				duplicate_chk = true;
				return;
			}
		});

		if(duplicate_chk){
			alert(ApprovalLang.getMessage('APPROVAL_NOT_ADD_APPROVER_F'));
			return;
		}

		$j('#addApprovalUserPart').append('<span class="refer-list name js-add-approval-user" user_no="'+pNo+'" node="'+pNode+'">'+pName+' <span class="icon file_delete js-approval-line-user-delete"></span></span>');
	}
}

var ApprovalDocument = new approvalDocumentClass();
