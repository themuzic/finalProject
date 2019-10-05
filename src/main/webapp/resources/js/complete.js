var autoComplete = function(){
	$j(".js-complete").autocomplete({
		source: function(request, response){
			//console.log(request);
			//console.log($j(this.element).attr("id"));
			//console.log($j(this)[0].element);
			$j.ajax( {
				url: Common.getServiceRoot() + "approval/complete/search",
				dataType: 'json',
				data: {
					word: request.term,
					from: $j(this.element).attr("id")
				},
				type: 'POST',
				minLength: 1,
				delay: 500,
				success: function( data ) {
					response( data );
				}
			} );
		}

		,open: function(){
			$j(this).data("ui-autocomplete").menu.element.addClass("dropdown-menu block approval-autocomplete")
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
				case "inputApprovalManager" :
					ApprovalSetting.addManager(ui.item.user_no, ui.item.user_name);
					break;
				case "inputApprovalFormFirstLine" :
				case "inputApprovalFormSecondLine" :
				case "inputApprovalFormThirdLine" :
				case "inputApprovalFormFourthLine" :
					ApprovalSetting.addApprovalFormLineUser(selectCase, ui.item.user_no, ui.item.node_id, ui.item.user_name);
					break;
				case "inputApprovalFirstLine" :
				case "inputApprovalSecondLine" :
				case "inputApprovalThirdLine" :
				case "inputApprovalFourthLine" :
				case "inputApprovalFifthLine" :
					if(typeof ApprovalDocument === "object"){
						ApprovalDocument.addApprovalLineUser(selectCase, ui.item.user_no, ui.item.node_id, ui.item.user_name);
					}else if(typeof ApprovalProcess === "object"){
						ApprovalProcess.addApprovalLineUser(selectCase, ui.item.user_no, ui.item.node_id, ui.item.user_name, $j(this).attr('approval_type'));
					}
					break;
				case "inputApprovalLineSetting" :
					if(typeof ApprovalDocument === "object"){
						ApprovalDocument.addApprovalLineSetting(selectCase, ui.item.user_no, ui.item.node_id, ui.item.user_name);
					}else if(typeof ApprovalProcess === "object"){
						ApprovalProcess.addApprovalUserFormLayer(selectCase, ui.item.user_no, ui.item.node_id, ui.item.user_name);
					}
					if($j(this).attr("check_top_node_user") === "Y"){
						check_top_node_user();
					}
					break;
				case "inputApprovalCirculation" :
					ApprovalProcess.addApprovalCirculation(selectCase, ui.item.user_no, ui.item.node_id, ui.item.user_name);
					break;
				case "inputAddApprovalUser" :
					if(typeof ApprovalDocument === "object"){
						ApprovalDocument.addBatchApprovalLineUser(ui.item.user_no, ui.item.node_id, ui.item.user_name);
					}else if(typeof ApprovalSetting === "object"){
						ApprovalSetting.addApprovalLineUser(ui.item.user_no, ui.item.node_id, ui.item.user_name);
					}
					break;
				case "employeeAccount" :
				case "corporationCard" :
					ApprovalAccounting.setCompleteUser(selectCase, ui.item.user_no, ui.item.user_name);
					break;
				case "inputSpenderName" :
					ApprovalDocument.setSpenderName(ui.item.user_no, ui.item.node_id, ui.item.user_name, ui.item.node_name);
					break;
				case "inputAccountingAccount" :
					ApprovalDocument.setAccountingAccount(ui.item.name, ui.item.code);
					break;
				case "inputAccountingDepartment" :
					ApprovalDocument.setAccountingDepartment(ui.item.name, ui.item.code);
					break;
				case "inputAccountingCustomer" :
					ApprovalDocument.setAccountingCustomer(ui.item.name, ui.item.code, ui.item.company_num);
					break;
				case "inputRemittanceCustomer" :
					ApprovalDocument.setRemittanceCustomer(ui.item.name, ui.item.code, ui.item.bank_name, ui.item.account_num, ui.item.account_holder);
					break;
				case "inputApprovalSettingLastUser" :
					ApprovalSetting.addApprovalConfigLastUser(ui.item.user_no, ui.item.user_name);
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
			var term = $j('#' + item.from).val();
			var str = new RegExp(term, 'i');
			var name = item.left;
			var nameIdx = name.search(str);
			if(nameIdx > -1){
				name = item.left.substr(0, nameIdx) + '<b>' + item.left.substr(nameIdx, term.length) + '</b>' + item.left.substr(nameIdx + term.length);
			}

			if(item.from === "inputAccountingCustomer"){
				var company = item.center;
				
				var companyIdx = company.search(str);
				if(companyIdx > -1){
					company = item.center.substr(0, companyIdx) + '<b>' + item.center.substr(companyIdx, term.length) + '</b>' + item.center.substr(companyIdx + term.length);
				}
				return $j( "<li>" )
					.append("<div><span class='team-membername'>" + name + "</span><span class='comp-code'>" + company + "</span><span class='team-name'>" + item.right + "</span></div>" )
					.appendTo( ul );
			}else{
				return $j( "<li>" )
					.append( "<div><span class='team-membername'>" + name + "</span><span class='team-name'>" + item.right + "</span></div>" )
					.appendTo( ul );
			}
		};
	});
}