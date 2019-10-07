approvalTableClass = function(pConfig)
{
	this._row = pConfig.row;
  	this._table = pConfig.table;
	this._headerExist = pConfig.header ? pConfig.header : true;
	this._noDataDisplay = true;
	this._initRowNumber = pConfig.initRowNumber ? pConfig.initRowNumber : 1;
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

				if(pValue.result[i]["link"] !== undefined && pValue.result[i]["link"] !== "" && this._row[j][0] !== "checkbox" && this._row[j][0] !== "star"){
					c.setAttribute("data-href", pValue.result[i]["link"]);
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
}
