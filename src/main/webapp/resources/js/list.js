$(".block").on("click", "span a", function (e) {
	getAlllist(e);
});

/* LISTING */
function getAlllist(e){
	num = e.target.attributes.href.nodeValue;
	replyList = $("#"+num);
	display = $(e.target);
	display.attr("data-display");
	
	e.stopPropagation();
	e.preventDefault();
	getJson(num);
	
	
};

/* DATE Fommation */
	function getFormattedDate(date) {
		  var year = date.getFullYear();
		  var month = (1 + date.getMonth()).toString();
		  month = month.length > 1 ? month : '0' + month;
		  var day = date.getDate().toString();
		  day = day.length > 1 ? day : '0' + day;
		  
		  return   year + '-'+ month + '-' + day;
		}
	



	function getJson(bno){
	if(display.attr("data-display") == "show"){
	
	$.getJSON("/reply/"+bno, function (data) {
		
		$(data).each(function () {
			var dt = new Date(this.regdate);
			var dt_to = getFormattedDate(dt);
			if(this.depth != 0){
				urlbuilder =  makeURI(this.bno);
	
				replystr += "<div class='agile-blog-grid'><div>"
				+				"<div class='blog-left-grids'><div class='blog-left-left'>"
				+"	<div class='ih-item circle bottom_to_top'>"
				+"	<div class='img'><img src='/resources/images/pic/"+this.writer+".jpg' alt='img' /></div></div>"
				+				"</div>"
				+				"<div class='blog-left-right-in'><div class='blog-left-right-top'>"
				+						"<div class='blog-left-right-top'>";
				
				if(this.deleteyn == 'n'){
					replystr += "<h4><span class='label "+this.status+"'>"+this.status+"</span><a href='/board/view"+urlbuilder+"' class='view' data-bno='"+this.bno+"'>"+this.title+"</a>"
					+								"<span><a href='"+this.bno+"' class='replyBtn' data-display='show'>("+this.boardcount+")</a></span>"
					+							"</h4>";
				}else if(this.deleteyn == 'm'){
					replystr += "<h4>이 글은 삭제된 글입니다. "
					+								"<span><a href='"+this.bno+"' class='replyBtn' data-display='show'>("+this.boardcount+")</a></span>"
					+							"</h4>";
				}
				
				replystr+="<p><h4>NAME(ID):"+this.mname+"("+this.writer+")</h4>"
				+			"<h4>"+dt_to+"</h4>"
				+			"</p>"
				+						"</div>"
				+				"</div>"
				+					"<div class='replyList'>"
				+						"<div id='"+this.bno+"'></div>"
				+					"</div>"
				+				"</div>"
				+			"</div></div>";
			}
			replyList.html(replystr);
			
		});
		replystr = "";
		display.attr("data-display", "hide");
	});
	}else if(display.attr("data-display") == "hide"){
		replyList.html(replystr);
		display.attr("data-display", "show");
	}
};

if(keyword!=""){
	$("#searchType").val(type);
	$("#searchKeyword").val(keyword);
}
