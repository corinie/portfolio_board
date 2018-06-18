$(".container").on("click", "span a", function (e) {
	getAlllist(e);
});

/* LISTING*/
function getAlllist(e){
	num = e.target.attributes.href.nodeValue;
	replyList = $("#"+num);
	display = $(e.target);
	display.attr("data-display");
	
	e.stopPropagation();
	e.preventDefault();
	getJson(num);
	
	
};


function getJson(bno){
	
	if(display.attr("data-display") == "show"){
	
	$.getJSON("/reply/"+bno, function (data) {
		$(data).each(function () {
			if(this.depth != 0){
				urlbuilder =  makeURI(this.bno);
	
				replystr += "<div class='agile-blog-grid'><div>"
				+				"<div class='blog-left-grids'><div class='blog-left-left'>"
				+					"<i class='fa fa-pencil' aria-hidden='true'></i>"
				+				"</div>"
				+				"<div class='blog-left-right-in'><div class='blog-left-right-top'>"
				+						"<div class='blog-left-right-top'>";
				
				if(this.deleteyn == 'n'){
					replystr += "<h4><a href='/board/view"+urlbuilder+"' class='view' data-bno='"+this.bno+"'>"+this.title+"</a>"
					+								"<span><a href='"+this.bno+"' class='replyBtn' data-display='show'>("+this.boardcount+")</a></span>"
					+							"</h4>";
				}else if(this.deleteyn == 'm'){
					replystr += "<h4>이 글은 삭제된 글입니다. "
					+								"<span><a href='"+this.bno+"' class='replyBtn' data-display='show'>("+this.boardcount+")</a></span>"
					+							"</h4>";
				}
					
				replystr+=	 "<p>Writer &nbsp;&nbsp;"+this.writer+"&nbsp;&nbsp;"+this.regdate+"</p>"
				+						"</div>"
				+				"</div>"
				+				"<div class='blog-left-right-bottom'><p>"+this.bno+"</p></div>"
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
